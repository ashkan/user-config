" vim: foldmethod=marker

" Variables  "{{{
" call unite#util#set_default('g:unite_source_git_grep_required_pattern_length', 3)
" call unite#util#set_default('g:unite_source_git_grep_max_candidates', 100)
"}}}

let s:source = {
      \ 'name'           : 'vcs_grep/ag_root',
      \ 'max_candidates' : 0,
      \ 'syntax'    : 'uniteSource__Agrep',
      \ 'hooks'    : {}
      \ }
" \ 'filters'    : ['matcher_glob'],

let s:root = ''
let s:gitError = ''
function! s:source.hooks.on_init(args, context)"{{{
  if !<SID>GitCheck()
    let s:gitError = printf('Fatal: "%s" is not a .git repository', l:cwd)
    return 0
  endif
  let l:cwd = getcwd()
  let s:root = PushGitRoot()
endfunction"}}}

function! s:source.hooks.on_close(args, context)"{{{
  call PopDir()
endfunction"}}}

" let s:root = ''
" function! s:source.hooks.on_init(args, context)"{{{
" 	if !<SID>GitCheck()
" 		call unite#util#print_error('Not a Git repoitory.')
"     return
"   endif
"   let s:root= GitRootPush()
" endfunction"}}}

" function! s:source.hooks.on_close(args, context)"{{{
"   call GitRootPop()
" endfunction"}}}

function! s:source.hooks.on_syntax(args, context)"{{{
  " syntax case ignore
  syntax match uniteSource__AgrepPath +\s*\zs[-.a-zA-z/]*\ze:+
        \ contained containedin=uniteSource__Agrep
  syntax match uniteSource__AgrepLineNr /\d\+\ze:/
        \ contained containedin=uniteSource__Agrep

  highlight! default link uniteSource__AgrepPath Error
  highlight! default link uniteSource__AgrepLineNr Float
endfunction"}}}

function! s:source.gather_candidates(args, context)"{{{
  if s:gitError == ''
    let l:input = unite#util#input('Pattern: ')
    return <SID>GitRootAg(l:input)
  else
    return [{'word': s:gitError}]
  endif
endfunction"}}}

" let s:query = ''
" let s:results = []
" let s:resultQuery = ''
" let s:lastTime = localtime()

" function! s:source.async_gather_candidates(args, context)"{{{
"   let l:query = a:context.input
"   if s:query != l:query
"     if s:resultQuery != ''
"       if strstr(l:query, s:resultQuery) >= 0
"         let s:query = l:query
"         return []
"       endif
"       if strstr(s:resultQuery, l:query) >= 0
"         let s:query = l:query
"         return []
"       endif
"     endif
"     if localtime() > s:lastTime + 2
"       let s:query = l:query
"       let s:lastTime = localtime()
"       let s:resultQuery = l:query
"       return <SID>GitRootAg(s:resultQuery)
"     endif
"   endif
"   return []
" endfunction"}}}

" function! s:source.change_candidates(args, context)"{{{
"   " return []
" 	" return <SID>GitRootAg(a:context.input)
" endfunction"}}}

function! <SID>GitCheck()"{{{
  call unite#util#system('git rev-parse')
  return (unite#util#get_last_status() == 0)? 1 : 0
endfunction"}}}

function! <SID>GitRootAg(input)"{{{
  " let l:command = printf("ag --nocolor --nogroup -m %s '%s' %s",
  "       \ s:source.max_candidates,
  "       \ a:input,
  "       \ s:root)
  let l:command = printf("ag --line-numbers --nocolor --nogroup '%s' %s",
        \ a:input,
        \ s:root)
  " let l:result = unite#util#system('ag --nocolor --nogroup "' . a:input . '" '.s:root)
  let l:result = unite#util#system(l:command)
  " let l:result = vimproc#system_bg('ag --nocolor --nogroup "' . a:input . '" '.s:root)
  " let l:result = unite#util#system('git grep -n "'.a:input.'"')
  let l:matches = split(l:result, '\r\n\|\r\|\n')
  let l:entries = map(l:matches, '[v:val, split(v:val, ":")]')
  let l:entries = filter(l:entries, 'len(v:val[1]) > 1')
  return map(l:entries,
        \ '{
        \   "word": v:val[0],
        \   "source": "vcs_grep/ag_root",
        \   "kind": "jump_list",
        \   "action__path": v:val[1][0],
        \   "action__line": v:val[1][1],
        \   "action__text": join(v:val[1][2:], ":"),
        \   "action__pattern": a:input,
        \ }')
        " \   "action__path": s:root."/".v:val[1][0],
endfunction"}}}

call unite#define_source(s:source)
