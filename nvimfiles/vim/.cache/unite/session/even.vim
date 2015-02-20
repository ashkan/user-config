let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Workspace/projects/queue-master
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +180 frontend/frontend.go
badd +24 master/master.go
badd +236 ~/Workspace/projects/gosocket/main.go
badd +7 slave/slave.ls
argglobal
silent! argdel *
edit master/master.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 48 + 50) / 100)
exe 'vert 1resize ' . ((&columns * 89 + 90) / 181)
exe '2resize ' . ((&lines * 48 + 50) / 100)
exe 'vert 2resize ' . ((&columns * 89 + 90) / 181)
exe '3resize ' . ((&lines * 49 + 50) / 100)
exe 'vert 3resize ' . ((&columns * 91 + 90) / 181)
exe '4resize ' . ((&lines * 47 + 50) / 100)
exe 'vert 4resize ' . ((&columns * 91 + 90) / 181)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 24 - ((23 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 0
lcd ~/Workspace/projects/queue-master
wincmd w
argglobal
edit ~/Workspace/projects/queue-master/slave/slave.ls
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 7 - ((6 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 0
lcd ~/Workspace/projects/queue-master
wincmd w
argglobal
edit ~/Workspace/projects/gosocket/main.go
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 244 - ((30 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
244
normal! 08|
lcd ~/Workspace/projects/queue-master
wincmd w
argglobal
edit ~/Workspace/projects/queue-master/frontend/frontend.go
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 151 - ((9 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
151
normal! 0
lcd ~/Workspace/projects/queue-master
wincmd w
exe '1resize ' . ((&lines * 48 + 50) / 100)
exe 'vert 1resize ' . ((&columns * 89 + 90) / 181)
exe '2resize ' . ((&lines * 48 + 50) / 100)
exe 'vert 2resize ' . ((&columns * 89 + 90) / 181)
exe '3resize ' . ((&lines * 49 + 50) / 100)
exe 'vert 3resize ' . ((&columns * 91 + 90) / 181)
exe '4resize ' . ((&lines * 47 + 50) / 100)
exe 'vert 4resize ' . ((&columns * 91 + 90) / 181)
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
tabnext 1
