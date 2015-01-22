let g:user_emmet_install_global = 0

augroup EMMET
  au!
  au FileType html,css EmmetInstall
  au BufRead,BufNewFile *.html imap <C-y><C-e> <C-y>,
  au BufRead,BufNewFile *.html nmap <C-y><C-e> <C-y>,
augroup END
