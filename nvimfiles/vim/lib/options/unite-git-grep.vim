" vim: foldmethod=marker

" Variables  "{{{
call unite#util#set_default('g:unite_source_git_grep_required_pattern_length', 3)
call unite#util#set_default('g:unite_source_git_grep_max_candidates', 100)
"}}}

let s:source = {
			\ 'name'           : 'vcs_grep/git',
			\ 'is_volatile'    : 1,
			\ 'max_candidates' : g:unite_source_git_grep_max_candidates,
			\ 'required_pattern_length': g:unite_source_git_grep_required_pattern_length,
			\ 'syntax'    : 'uniteSource__Ggrep',
			\ 'filters'    : ['matcher_glob'],
			\ 'hooks'    : {}
			\ }

let s:root = ''
let s:gitError = ''
function! s:source.hooks.on_init(args, context)"{{{
  " call PushDir(a:context.path)
  let l:cwd = getcwd()
  if !<SID>GitCheck()
    let s:gitError = printf('Fatal: "%s" is not a .git repository', l:cwd)
    return 0
  endif
  let s:root = PushGitRoot()
endfunction"}}}

function! s:source.hooks.on_close(args, context)"{{{
  " call PopDir()
  call PopDir()
endfunction"}}}

function! s:source.hooks.on_syntax(args, context)"{{{
  " syntax case ignore
  syntax match uniteSource__GgrepPath +\s*\zs[-.a-zA-z/]*\ze:+
        \ contained containedin=uniteSource__Ggrep
  syntax match uniteSource__GgrepLineNr /\d\+\ze:/
        \ contained containedin=uniteSource__Ggrep

  highlight! default link uniteSource__GgrepPath Error
  highlight! default link uniteSource__GgrepLineNr Float
endfunction"}}}

function! s:source.gather_candidates(args, context)"{{{
  if s:gitError == ''
    return []
  else
    return [{'word': s:gitError}]
  endif
endfunction"}}}

function! s:source.change_candidates(args, context)"{{{
  if s:gitError == ''
    return <SID>GitGrep(a:context.input, join(a:args, ' '))
  else
    return [{'abbr': s:gitError, 'word': a:context.input}]
  endif
endfunction"}}}

function! <SID>GitCheck()"{{{
	call unite#util#system('git rev-parse')
	return (unite#util#get_last_status() == 0)? 1 : 0
endfunction"}}}

function! <SID>GitGrep(input, options)"{{{
  let l:command = printf('git grep -n %s "%s"', a:options, a:input)
	let l:result = unite#util#system(l:command)
	let l:matches = split(l:result, '\r\n\|\r\|\n')
  let l:entries = map(l:matches, '[v:val, split(v:val, ":")]')
  let l:entries = filter(l:entries, 'len(v:val[1]) > 1')
  return map(l:entries,
    \ '{
    \   "word": v:val[0],
    \   "source": "vcs_grep/git",
    \   "kind": "jump_list",
    \   "action__path": s:root."/".v:val[1][0],
    \   "action__line": v:val[1][1],
    \   "action__text": join(v:val[1][2:], ":"),
    \   "action__pattern": a:input,
    \ }')
endfunction"}}}

call unite#define_source(s:source)
