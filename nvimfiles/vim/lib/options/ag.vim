" The Silver Searcher
if executable('ag')
  " let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
  " let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'

  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C2'
  " let g:unite_source_grep_default_opts='--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt=''
endif
