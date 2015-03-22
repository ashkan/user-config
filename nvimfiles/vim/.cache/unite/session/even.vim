let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Workspace/projects/queue-master
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 frontend/frontend.go
badd +6 master/master.go
badd +236 ~/Workspace/projects/gosocket/main.go
badd +1 slave/slave.ls
argglobal
silent! argdel *
edit frontend/frontend.go
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
exe '1resize ' . ((&lines * 42 + 43) / 87)
exe 'vert 1resize ' . ((&columns * 91 + 91) / 182)
exe '2resize ' . ((&lines * 41 + 43) / 87)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 182)
exe '3resize ' . ((&lines * 42 + 43) / 87)
exe 'vert 3resize ' . ((&columns * 90 + 91) / 182)
exe '4resize ' . ((&lines * 41 + 43) / 87)
exe 'vert 4resize ' . ((&columns * 90 + 91) / 182)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 28 - ((25 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 0
lcd ~/Workspace/projects/queue-master/frontend
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
let s:l = 17 - ((16 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 0
lcd ~/Workspace/projects/queue-master/slave
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
let s:l = 31 - ((30 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
31
normal! 019|
lcd ~/Workspace/projects/gosocket
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
let s:l = 19 - ((8 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 0
lcd ~/Workspace/projects/queue-master/frontend
wincmd w
4wincmd w
exe '1resize ' . ((&lines * 42 + 43) / 87)
exe 'vert 1resize ' . ((&columns * 91 + 91) / 182)
exe '2resize ' . ((&lines * 41 + 43) / 87)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 182)
exe '3resize ' . ((&lines * 42 + 43) / 87)
exe 'vert 3resize ' . ((&columns * 90 + 91) / 182)
exe '4resize ' . ((&lines * 41 + 43) / 87)
exe 'vert 4resize ' . ((&columns * 90 + 91) / 182)
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
