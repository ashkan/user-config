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
  au BufWritePost */cobalt/plugins.json !cd %:h && ./cobalt-vim
  au BufWritePost */cobalt/plugins.json nested so ~/.vimrc
augroup END

augroup AuNginx
  au!
  au BufRead,BufNewFile /etc/nginx/* setf nginx
  au FileType nginx setl commentstring=#\ %s
augroup END

augroup AuShell
  au!
  au BufWritePost *.sh silent !chmod +x %
  au BufWritePost *.sh silent !chmod +x %
  au BufRead,BufNewFile /etc/nginx/* setf nginx
  au FileType nginx setl commentstring=#\ %s
augroup END

