let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Workspace/projects/queue-master/site
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +8 src/htdocs/index.html
badd +28 src/sass/app.scss
badd +28 src/javascript/main.ls
badd +1 src/javascript/components/test.ract
badd +1 src/sass/util.scss
argglobal
silent! argdel *
argadd src/htdocs/index.html
edit src/htdocs/index.html
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 1resize ' . ((&columns * 90 + 90) / 181)
exe '2resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 2resize ' . ((&columns * 90 + 90) / 181)
exe '3resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 3resize ' . ((&columns * 90 + 90) / 181)
exe '4resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 4resize ' . ((&columns * 90 + 90) / 181)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 21 - ((20 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 035|
wincmd w
argglobal
edit src/javascript/components/test.ract
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit src/javascript/main.ls
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 17 - ((16 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 0
wincmd w
argglobal
edit src/sass/app.scss
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 48 - ((24 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
48
normal! 017|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 1resize ' . ((&columns * 90 + 90) / 181)
exe '2resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 2resize ' . ((&columns * 90 + 90) / 181)
exe '3resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 3resize ' . ((&columns * 90 + 90) / 181)
exe '4resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 4resize ' . ((&columns * 90 + 90) / 181)
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
