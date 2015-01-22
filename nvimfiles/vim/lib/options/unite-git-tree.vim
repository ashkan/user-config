let s:unite_source = {
      \ 'name': 'git_tree',
      \ 'is_volatile': 1,
      \ 'default_kind': 'file'
      \ }

" Pass any args to make it use the current buffer directory.
function! s:unite_source.gather_candidates(args, context)
  let doCD = len(a:args) > 0
  if doCD
    let l:oldpwd = getcwd()
    cd %:p:h
  endif
  let root = substitute(unite#util#system('git root'), '[\n]\+$', '', '')
  let files = split(
        \ unite#util#system('git ls-tree -r --full-tree HEAD --name-only'),
        \ "\n")
  if doCD
    execute 'cd '.l:oldpwd
  endif
  let files = map(files, '[v:val, root."/".v:val]')
  return map(files, '{
        \ "word": v:val[0],
        \ "action__path": v:val[1],
        \ "kind": "file"
        \ }')
endfunction

call unite#define_source(s:unite_source)
