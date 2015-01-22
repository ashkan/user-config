let g:unite_source_session_enable_auto_save = 1

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_source_history_yank_enable=1
let g:unite_data_directory='~/.vim/.cache/unite'

call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)
" let g:unite_source_file_rec_max_cache_files = 0

" Use start insert by default.
call unite#custom#profile('default', 'context', {
      \ 'start_insert' : 1,
      \ 'direction': 'botright',
      \ })
