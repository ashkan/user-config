let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Workspace/projects/neovim.as/src/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +21 ui.coffee
badd +36 nvim.coffee
badd +13 ~/Workspace/dotfiles/nvimfiles/vim/auto.json
badd +16 ../launcher.coffee
badd +1 ~/Workspace/dotfiles/nvimfiles/vim/lib/filetypes.vim
badd +1 ~/Workspace/projects/neovim.as/src/nvim/./config.coffee
badd +10 ~/Workspace/dotfiles/nvimfiles/vim/lib/mappings.vim
badd +51 ~/Workspace/dotfiles/nvimfiles/vim/lib/operators.vim
badd +135 ~/Workspace/dotfiles/nvimfiles/vim/plugins.json
badd +0 ~/Workspace/dotfiles/nvimfiles/vim/lib/settings.vim
argglobal
silent! argdel *
edit ~/Workspace/dotfiles/nvimfiles/vim/lib/settings.vim
set splitbelow splitright
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 59 - ((58 * winheight(0) + 42) / 84)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
59
normal! 06|
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
tabnext 1
