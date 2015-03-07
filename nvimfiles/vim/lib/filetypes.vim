" Markdown
augroup AuMarkdown
  au! 
  au BufRead,BufNewFile *.md setf markdown
augroup END

" Vimrc Autoload
fun! ReloadAirline() " {{{
	AirlineToggle
	AirlineToggle
endfun " }}}

augroup AuVimrc
  au!
  au BufWritePost vimrc,nvimrc,.vimrc,.nvimrc nested source $MYVIMRC | call ReloadAirline()
  au BufWritePost *vim/lib/*.vim nested so %
  " au BufRead,BufNewFile */cobalt/plugins.json setl commentstring=//%s
  au BufWritePost */cobalt/plugins.json !cd %:h && ./cobalt-vim
  au BufWritePost */cobalt/plugins.json nested so ~/.vimrc
  au BufWritePost */vim/plugins.json nested so ~/.vim/lib/plug.vim
augroup END

augroup AuJson
  au!
  au FileType json if expand("%:p") =~ ".*/cobalt/plugins.json" | setl commentstring=//\ %s | endif
  " au BufRead,BufNewFile */cobalt/plugins.json setl commentstring=//%s
augroup END

augroup AuNginx
  au!
  au BufRead,BufNewFile /etc/nginx/* setf nginx
  au FileType nginx setl commentstring=#\ %s
augroup END

augroup AuShell
  au!
  au BufWritePost *.sh silent !chmod +x %
augroup END

augroup AuGolang
  au!
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
augroup END

augroup AuC
  " this one is which you're most likely to use?
  autocmd FileType c nnoremap K :YcmCompleter GoToImprecise<CR>
augroup end

augroup AuCrontab
  autocmd FileType crontab setlocal nobackup nowritebackup
augroup end
