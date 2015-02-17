au FileType go nmap <Leader>gs <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gi :GoImport 

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nnoremap <Leader>dv :vsp <CR>:exe "GoDef" <CR>
au FileType go nnoremap <Leader>ds :sp <CR>:exe "GoDef" <CR>

" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nnoremap <silent> <leader>gb :<c-u>GoBuild<cr>
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)

" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>e <Plug>(go-rename)

