" Markdown
function! MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

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
  " au BufRead,BufNewFile *vim/lib/*.vim setl path+=
  au BufWritePost vimrc,nvimrc,.vimrc,.nvimrc nested source $MYVIMRC | call ReloadAirline()
  au BufWritePost *vim/lib/*.vim nested so %
  function! s:vimrcLoad()
    setl path+=./vim/
    setl suffixesadd+=.vim
  endfun
  au BufRead,BufNewFile vimrc,nvimrc,.vimrc,.nvimrc call <SID>vimrcLoad()
  " au BufRead,BufNewFile */cobalt/plugins.json setl commentstring=//%s

  function! s:cobaltPost()
    !cd %:h && ./cobalt-vim
    so ~/.vimrc
  endfun
  au BufWritePost */cobalt/plugins.json nested call <SID>cobaltPost()

  function! s:pluginsReload()
    so ~/.vim/lib/plug.vim
    " PlugInstall
  endfun
  " au BufWritePost */vim/plugins.json nested so ~/.vim/lib/plug.vim
  au BufWritePost */vim/plugins.json nested call <SID>pluginsReload()
augroup END

augroup AuJson
  au!
  function! s:jsonLoad()
    inoremap <buffer> ; :
    inoremap <buffer> : ;
    if expand("%:p") =~ ".*/cobalt/plugins.json" | setl commentstring=//\ %s | endif
  endfun
  au FileType json call <SID>jsonLoad()
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
  function! s:GoMappings()
    " nmap <leader>ds <Plug>(go-def-split)
    " nmap <leader>dt <Plug>(go-def-tab)
    " nmap <leader>dv <Plug>(go-def-vertical)
    " nmap <leader>gb <Plug>(go-doc-browser)
    " nmap <leader>c <Plug>(go-coverage)
    " nmap <leader>r <Plug>(go-run)
    " nnoremap <silent> <leader>gb :<c-u>GoBuild<cr>
    nmap <leader>e <Plug>(go-rename)
    nmap <leader>gd <Plug>(go-doc)
    nmap <leader>gi :GoImport 
    nmap <leader>gs <Plug>(go-implements)
    nmap <leader>gv <Plug>(go-doc-vertical)
    nmap <leader>i <Plug>(go-info)
    nmap <leader>gb <Plug>(go-build)
    nmap <leader>t <Plug>(go-test)
    nnoremap <leader>ds :sp <CR>:exe "GoDef" <CR>
    nnoremap <leader>dv :vsp <CR>:exe "GoDef" <CR>
  endfun

  au FileType go call <SID>GoMappings()
augroup END

augroup AuC
  au!
  " this one is which you're most likely to use?
  autocmd FileType c nnoremap K :YcmCompleter GoToImprecise<CR>
augroup end

augroup AuCrontab
  au!
  autocmd FileType crontab setlocal nobackup nowritebackup
augroup end

augroup AuPfConf
  au!
  autocmd FileType pf setlocal commentstring=#\ %s
  autocmd BufWritePost pf.conf !pfctl -f /etc/pf.conf -e
augroup end

" augroup AuAll
"   au!
"   " function! s:AddPath()
"   "   setl path^=
"   " endfun
"   " " this one is which you're most likely to use?
"   " autocmd FocusLost 
" augroup end
function! s:loadAuto()
  let filename = expand('~/.vim/auto.json')
  let lines = readfile(filename)
  if len(lines) == 0
    return
  endif
  let contents = join(filter(lines, 'v:val !~ "^ *\/\/"'), "")
  let [false, true] = [0, 1]
  let pluginData = eval(contents)
  for [group_name, events] in items(pluginData)
    execute "augroup Au".group_name
    execute "au!"
    let idx = 0
    for [event, options] in items(events)
      let idx += 1
      let body = printf("fun! s:%s_%d()\n", group_name, idx)
      if type(options) == type({})
        for [var, val] in items(get(options, "set", {}))
          let var = substitute(var, '^&\%([gl]:\)\?', '\&l:', "")
          let body .= printf("let %s = \"%s\"\n", var, val)
          unlet var  val
        endfor
        for [type, key, to] in get(options, "map", [])
          let body .= printf("%smap <buffer> %s %s\n", type, key, to)
          unlet type key to
        endfor
        let doopt = get(options, "do", [])
        if type(doopt) == type("")
          let body .= doopt."\n"
        else
          let body .= join(doopt, "\n")
        endif
        unlet doopt
      elseif type(options) == type("")
        let body .= options."\n"
      elseif type(options) == type([])
        let body .= join(options, "\n")
      endif
      let body .= "\nendfun"
      exe body

      exe printf("au %s call <SID>%s_%d()", event, group_name, idx)
      unlet event  options 
    endfor
    execute "augroup END"
    unlet group_name  events
  endfor
endfun

call <SID>loadAuto()
augroup AuAutoJson_
  au!
  " this one is which you're most likely to use?
  autocmd BufWritePost auto.json so ~/.vim/lib/filetypes.vim
augroup end
