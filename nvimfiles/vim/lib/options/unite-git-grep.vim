" vim: foldmethod=marker

" Variables  "{{{
" call unite#util#set_default('g:unite_source_git_grep_required_pattern_length', 3)
" call unite#util#set_default('g:unite_source_git_grep_max_candidates', 100)
"}}}

let s:source = {
			\ 'name':                     'vcs_grep/git',
			\ 'is_volatile':              1,
			\ 'max_candidates':           100,
			\ 'required_pattern_length':  3,
			\ 'syntax':                   'uniteSource__Ggrep',
			\ 'matchers':                  [],
      \ "default_kind": "jump_list",
      \ "default_action": "echo",
      \ "sorters": ["sorter_rank"],
			\ 'hooks':                    {}
			\ }

function! s:source.find_root()
  let s:source.root = substitute(unite#util#system('git rev-parse --show-toplevel'), "[\n\r]*$", "", "")
  let s:source.error = (s:source.root =~ "^fatal: ")
  return !s:source.error
endfunction

fun! s:source.add_raw(job_id, data, event)
  if a:event == "stdout"
    let l:entries = map(a:data, '[v:val, split(v:val, ":")]')
    let l:entries = filter(l:entries, 'len(v:val[1]) > 1')
    let s:source.candidates += map(l:entries,
          \ '{
          \   "word": v:val[0],
          \   "source": "vcs_grep/git",
          \   "action__path": v:val[1][0],
          \   "action__line": v:val[1][1],
          \   "action__col_pattern": s:source.query,
          \   "action__text": join(v:val[1][2:], ":"),
          \ }')
          " \   "kind": "jump_list",
          " \   "word": v:val[0],
          " \   "action__path": s:source.root."/".v:val[1][0],
  endif
endfun

" fun! s:source.filtered(filter)
" endfun

fun! s:source.grep(args, query)
  let s:source.candidates = []
  let s:source.query = a:query
  let options = {
        \ "on_stdout": s:source.add_raw
        \ }
  " let s:source.job = jobstart(["git", "grep", "-n"] + a:args + [a:query, '--', s:source.root], options)
  let s:source.job = jobstart(["git", "grep", "-n"] + a:args + [a:query], options)
endfun

function! s:source.hooks.on_init(args, context)
  return s:source.find_root()
endfunction

function! s:source.hooks.on_close(args, context)
endfunction

function! s:source.hooks.on_syntax(args, context)
  " syntax case ignore
  syntax match uniteSource__GgrepPath +\s*\zs[-.a-zA-z/]*\ze:+
        \ contained containedin=uniteSource__Ggrep
  syntax match uniteSource__GgrepLineNr /\d\+\ze:/
        \ contained containedin=uniteSource__Ggrep

  highlight! default link uniteSource__GgrepPath Comment
  highlight! default link uniteSource__GgrepLineNr Float
endfunction

let s:source.query = ""
let s:source.candidates = []

function! s:source.gather_candidates(args, context)
  " echom 2
  " call s:source.grep(a:args, a:context.input)
  " return s:source.candidates
  return []
endfunction

function! s:source.async_gather_candidates(args, context)
  " echom 6
  let cand = s:source.candidates
  let s:source.candidates = []
  " call s:source.grep(a:args, a:context.input)
  " return s:source.candidates
  return cand
endfunction

function! s:source.change_candidates(args, context)
  " echom 3
  if len(a:context.input) == 3 && a:context.input[:3] != s:source.query
    " echom 123
    call s:source.grep(a:args, a:context.input)
  endif
  " return s:source.candidates
  return []
endfunction

call unite#define_source(s:source)
