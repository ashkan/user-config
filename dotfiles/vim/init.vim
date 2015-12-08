" vim:fdm=marker
syntax on

let $FZF_DEFAULT_COMMAND='ag -l -g ""'
" let $FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || '.$FZF_DEFAULT_COMMAND .') 2> /dev/null'

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

let $RUST_SRC_PATH="/Users/ashkan/rustsrc/beta/src/"
let g:racer_cmd = "/Users/ashkan/.multirust/cargo/bin/racer"

command! -nargs=* E e <args>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#auto_initialization = 0
" let g:jedi#use_splits_not_buffers = "right"
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
" let g:jedi#force_py_version = 3

au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
inoremap <silent><expr> <C-space> pumvisible() ? "" : deoplete#mappings#manual_complete()

call plug#begin("~/.vim/plugged")

Plug 'vim-scripts/nginx.vim', {'for': 'nginx'}

Plug 'davidhalter/jedi-vim', {'for': 'python' }
" Plug 'davidhalter/jedi-vim'

Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }
let g:airline_section_warning = '%{exists("g:loaded_syntastic_plugin")?SyntasticStatuslineFlag():""}'

Plug 'racer-rust/vim-racer', { 'for': 'rust' }

Plug 'mustache/vim-mustache-handlebars'

Plug 'zah/nim.vim', { 'for': 'nim' }
Plug 'gkz/vim-ls', { 'for': 'ls' }
Plug 'godlygeek/tabular', { 'on': 'Tabular' }
Plug 'christoomey/vim-conflicted', { 'on': 'Conflicted' }
Plug 'artnez/vim-wipeout', { 'on': ['Wipeout']}

Plug 'random.vim'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' } | Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

Plug 'maksimr/vim-jsbeautify', { 'do': 'git submodule update --init --recursive' }

nnoremap <c-f> :call JsBeautify()<cr>

Plug 'einars/js-beautify', { 'for': 'javascript' }

Plug 'mattn/emmet-vim', { 'for': 'javascript' }

Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-sneak'
Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'rking/ag.vim', {'on': 'Ag'}

Plug 'benekastah/neomake', { 'on': 'Neomake' }

Plug 'Peeja/vim-cdo', { 'on': ['Cdo', 'Ldo'] }

omap \ $
" nnoremap y\ y$
" nmap Y\ Y$

let g:airline_section_x = "%{exists('g:loaded_obsession')?ObsessionStatus('$', ''):''} %{exists('g:virtualenv_loaded') ?virtualenv#statusline():''} %{g:airline_right_alt_sep} %{airline#util#wrap(airline#parts#filetype(),0)}"
let g:airline_section_z = "%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3v "
let g:prosession_on_startup = 0
Plug 'tpope/vim-obsession', {'on': 'Obsession'} | Plug 'dhruvasagar/vim-prosession'

Plug 'Raimondi/delimitMate'

Plug 'localrc.vim'

Plug 'jmcantrell/vim-virtualenv', {'on': ['VirtualEnvList', 'VirtualEnvActivate', 'VirtualEnvDeactivate']}

" Plug 'LucHermitte/lh-vim-lib' | Plug 'LucHermitte/local_vimrc'

" let g:local_vimrc = ["vimrc", ".vimrc"]

" Load on nothing
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
      !./install.py --clang-completer
        " !mkdir -p ~/ycm_build
        " !cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON ~/ycm_build ~/.vim/plugged/YouCompleteMe/third_paty/ycmd/cpp
        " !make -C ~/ycm_build ycm_support_libs
    endif
endfunction

let g:UltiSnipsUsePythonVersion = 2
" Plug 'SirVer/ultisnips', { 'on': [] }
" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'on': [] }

Plug 'SirVer/ultisnips'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.python = ['buffer', 'file', 'ultisnips', 'omni']
let g:deoplete#sources.cpp = ['buffer', 'tag']
Plug 'Shougo/deoplete.nvim'

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Plug 'Shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1


autocmd filetype crontab setlocal nobackup nowritebackup

function! AuMatlab()
  setl commentstring=%\ %s
  command! Start term /Applications/MATLAB_R2015b.app/bin/matlab -nodesktop
  command! Run let @"=expand("%:r.h")."\n\n" | b matlab | norm pa
  nnoremap <buffer> <leader>m :<c-u>Run<cr>
endfun

autocmd filetype matlab call AuMatlab()

" augroup load_us_ycm
"   autocmd!
"   autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
"                      \| call youcompleteme#Enable() | autocmd! load_us_ycm
" augroup END


Plug 'honza/vim-snippets'

Plug 'lambdatoast/elm.vim', {'for': 'elm'}
" autocmd! User YouCompleteMe call youcompleteme#Enable()

call plug#end()

command! EbDeploy 10split | term eb deploy

" nnoremap <A-r> :<C-U>exec "resize " . v:count1<CR>

" colorscheme base16-default
" colorscheme random
exec 'colorscheme base16-'.$BASE16_THEME
" colorscheme base16-google

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let base16colorspace=256

set colorcolumn=80
set relativenumber number

set showcmd

set wildignorecase

let g:jsx_ext_required = 0

" Settings {{{

let &titlestring = "%{join(split(getcwd(), '/')[-2:], '/')}"
set diffopt+=vertical
set title
set hidden
set background=dark
set splitbelow

" Don't change the position to the start of the line on bnext or whatnot
set nosol

" set expandtab shiftwidth=2 softtabstop=2 tabstop=2
set expandtab shiftwidth=2 softtabstop=2 tabstop=2
set wildmode=list:longest,full
set wildmenu

set ignorecase smartcase incsearch
set noswapfile

" let mapleader=","
" nnoremap ; :
" nnoremap : ;

fun! s:ToggleMouse()
  if !exists("s:old_mouse")
    let s:old_mouse = "a"
  endif

  if &mouse == ""
    let &mouse = s:old_mouse
    echo "Mouse is for Vim (" . &mouse . ")"
  else
    let s:old_mouse = &mouse
    let &mouse=""
    echo "Mouse is for terminal"
  endif
endfunction

if !hasmapto('<SID>ToggleMouse()')
  noremap <F6> :call <SID>ToggleMouse()<CR>
  inoremap <F6> <Esc>:call <SID>ToggleMouse()<CR>a
endif

cmap w!! w !sudo tee % >/dev/null

let g:ycm_semantic_triggers =  {
      \ 'rust' : ['.', '::'],
      \ }
"}}}

" Plugins Options {{{

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': [] }

let g:syntastic_python_checkers = ["python", "flake8"]
let g:syntastic_python_flake8_args = ''
let g:syntastic_check_on_wq = 0
nnoremap <silent> <F5> :SyntasticCheck<CR>

let g:go_fmt_command = 'goimports'
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

let g:delimitMate_expand_cr = 1

let g:UltiSnipsExpandTrigger="ý"
let g:UltiSnipsJumpForwardTrigger="ý"
let g:UltiSnipsJumpBackwardTrigger="û"

let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file,file_rec', 'ignore_pattern', 'node_modules')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:sneak#streak = 1
" }}}

" Mappings {{{
command! Q quit
nnoremap W :w<cr>
nnoremap Q :bd<cr>
nnoremap <leader><space> i <esc>
nnoremap <leader><cr> mzi<cr><esc>`z
nmap <silent> <leader>" cs'`cs"'cs`"

inoremap <c-c> <esc>
" inoremap <c-c> <esc>:w<CR>
inoremap <c-e> <c-o>A
inoremap <c-a> <c-o>I
inoremap <c-k> <c-o>D

" nnoremap <c-k> mzO<esc>`z
" nnoremap <c-j> mzo<esc>`z
nmap <c-k> [<space>
nmap <c-j> ]<space>

nnoremap <silent> ∆ <c-w>j
inoremap <A-j> <esc><c-w>j
inoremap <A-k> <esc><c-w>k
inoremap <A-h> <esc><c-w>h
inoremap <A-l> <esc><c-w>l
inoremap <A-s> <esc><c-w>s
inoremap <A-v> <esc><c-w>v
inoremap <A-o> <esc><c-w>o

" inoremap <A-;> <esc>:bprev<cr>
" inoremap <A-"> <esc>:bnext<cr>
" inoremap <A-'> <esc>:bnext<cr>

imap <A-;> <esc>[b
imap <A-"> <esc>]b
imap <A-'> <esc>]b

nmap <A-/> gcl
vnoremap <A-/> :norm gcl<CR>

nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-h> <c-w>h
nnoremap <A-l> <c-w>l
nnoremap <A-s> <c-w>s
nnoremap <A-v> <c-w>v
nnoremap <A-o> <c-w>o

nnoremap <A-0> <c-w>=
nnoremap <A-=> <c-w>+
nnoremap <A--> <c-w>-
nnoremap <A-<> <c-w><
nnoremap <A->> <c-w>>
nnoremap <A-q> <c-w>q
nnoremap <A-n> <c-w>n

nnoremap <A-z> <c-w>z
inoremap <A-z> <c-o><c-w>z

nnoremap <A-H> <c-w>H
inoremap <A-H> <c-o><c-w>H
nnoremap <A-L> <c-w>L
inoremap <A-L> <c-o><c-w>L
nnoremap <A-K> <c-w>K
inoremap <A-K> <c-o><c-w>K
nnoremap <A-J> <c-w>J
inoremap <A-J> <c-o><c-w>J

" nnoremap gp :bprev<cr>
" nnoremap gn :bnext<cr>
" nnoremap <A-;> :bprev<cr>
" nnoremap <A-"> :bnext<cr>
" nnoremap <A-'> :bnext<cr>

nmap <A-;> [b
nmap <A-"> ]b
nmap <A-'> ]b

nnoremap <A-c> :bd<cr>
inoremap <A-c> <esc>:bd<cr>

nnoremap <A-6> :b#<cr>


function! GoMapping()
  nmap <Leader>i <Plug>(go-info)
endfunc

augroup AuGo
  au!
  au FileType go call GoMapping()
augroup END

augroup AuVimrc
  au!
  au BufWritePost .nvimrc,.vimrc,vimrc,nvimrc nested so $MYVIMRC
augroup END

inoremap <c-s> <c-o>:w<cr>
nnoremap <c-s> :w<cr>

nmap [k [q
nmap ]k ]q

augroup AuUnite
  au!
  au FileType unite imap <buffer> <c-c> <c-c>q
augroup END

" nmap <a-s-b> :Unite -start-insert -prompt-direction=above -direction=below neomru/file<CR>
nnoremap <silent> <a-s-b> :Unite -start-insert -direction=below -prompt-direction=below -buffer-name=mru neomru/file<CR>
nnoremap <silent> <a-b> :Unite -start-insert -direction=below -prompt-direction=below -buffer-name=buffer buffer<CR>

imap <a-s-b> <esc><a-s-b>
imap <a-b> <esc><a-b>

nnoremap <a-t> :FZF!<CR>
imap <a-t> <esc><a-t>

inoremap <c-d> <delete>

nmap <c-down> ]e
nmap <c-up> [e
vmap <c-down> ]egv
vmap <c-up> [egv

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" Set search to word under cursor
nnoremap <silent> [, :let @/='\<'.expand("<cword>").'\>' \| set hlsearch<cr>
vnoremap <silent> [, :<C-u>let @/=<SID>get_visual_selection() \| set hlsearch \| norm gv<cr>

map <Nul> <C-space>
imap <Nul> <C-space>
vmap <Nul> <C-Space>
omap <Nul> <C-Space>
" vnoremap <silent> <c-space> :<C-u>set hlsearch! hlsearch? \| norm gv<CR>
" nnoremap <silent> <c-space> :set hlsearch! hlsearch?<CR>

nnoremap <silent> <leader>t :term<cr>

vnoremap > >gv
vnoremap < <gv
" }}}

" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

tmap <a-"> <c-\><c-n><a-">
tmap <a-'> <c-\><c-n><a-'>
tmap <a-;> <c-\><c-n><a-;>

tmap <a-{> <c-\><c-n><a-}>
tmap <a-}> <c-\><c-n><a-{>

nnoremap <a-u> <c-u>
nnoremap <a-d> <c-d>
tmap <a-u> <c-\><c-n><a-u>
tmap <a-d> <c-\><c-n><a-d>

nnoremap <a-{> :tabp<CR>
nnoremap <a-}> :tabn<CR>

tmap <a-l> <c-\><c-n><a-l>
tmap <a-h> <c-\><c-n><a-h>
tmap <a-k> <c-\><c-n><a-k>
tmap <a-j> <c-\><c-n><a-j>

fun! s:prelude(select, type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use gv command.
    silent exe "normal! gv"
  elseif a:type == 'line'
    silent exe "normal! '[V']"
  else
    silent exe "normal! `[v`]"
  endif
  return [sel_save, reg_save]
endfun

fun! s:suffix(save)
  let [sel_save, reg_save] = a:save
  let &selection = sel_save
  let @@ = reg_save
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DupComment(type, ...)
  let save = call("s:prelude", [1, a:type] + a:000)
  let save_cursor = getpos(".")
  normal! y
  let value = @@

  let linecount = len(split(value, '\n'))
  let save_cursor[1] += linecount

  normal gvgcgvy
  let @@ = @@ . value
  normal! gvp
  " exe "normal! ".linecount."j"
  call setpos(".", save_cursor)
  call s:suffix(save)
endfun

nnoremap <silent> ]c :set opfunc=DupComment<CR>g@
nmap <silent> ]cc V]c
vmap <silent> ]c :<C-U>call DupComment(visualmode(), 1)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Duplicate(type, ...)
  let save = call("s:prelude", [1, a:type] + a:000)
  let save_cursor = getpos(".")
  normal! y
  let @@ = @@ . @@
  normal! gvp
  call setpos(".", save_cursor)
  call s:suffix(save)
endfun

nnoremap <silent> ], :set opfunc=Duplicate<CR>g@
nmap <silent> ],, V],
vmap <silent> ], :<C-U>call Duplicate(visualmode(), 1)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! s:operator_insert_i(motion_wise)
function! s:operator_insert_i(type, ...)
  let save = call("s:prelude", [1, a:type] + a:000)
  " call cursor(getpos("'[")[1:])
  norm! o
  startinsert
  call s:suffix(save)
endfunction

function! s:operator_insert_a(motion_wise)
  call cursor(getpos("']")[1:])
  if col("']") >= col("$") - 1
    startinsert!
  else
    normal! l
    startinsert
  endif
endfunction

nnoremap <silent> <leader>i :set opfunc=<SID>operator_insert_i<CR>g@

function! ReplaceShit(type, ...)
  let save = call("s:prelude", [1, a:type] + a:000)
  norm! y
  let @/ = '\V' . substitute(escape(@@, '/\'), '\n', '\\n', 'g')
  call s:suffix(save)
endfun

nnoremap <silent> <A-r> :set hlsearch opfunc=ReplaceShit<CR>g@
nmap <silent> <A-r><A-r> <A-r>iwcgn
vmap <silent> <A-r> :<C-U>call ReplaceShit(visualmode(), 1)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Replace(type, ...)
  let save = call("s:prelude", [1, a:type] + a:000)
  if a:0
    normal! ""p
  else
    exe "normal! \"".g:_register."p"
  endif
  call s:suffix(save)
endfun

nnoremap <silent> ]r :let g:_register=v:register<cr>:set opfunc=Replace<CR>g@
nmap <silent> ]rr V]r
vmap <silent> ]r :<C-U>call Replace(visualmode(), 1)<CR>

omap <silent> il :<c-u>normal! $v^<CR>
omap <silent> al :<c-u>normal! V<CR>

omap <silent> ae :<c-u>normal! ggVG<CR>

nnoremap Y "+y
vnoremap Y "+y

nnoremap [P "+p
nmap ]P "+]p

vmap ) S)
vmap ( S(

vmap ] S]
vmap [ S[

vmap } S}
vmap { S{

" silent! unmap \\ \\u \\\

cnoremap <expr> %H expand("%:h")."/"
cnoremap <expr> %P expand("%:p")

set printoptions="bottom:1in"
