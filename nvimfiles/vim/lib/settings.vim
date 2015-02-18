" Tabs bro
set shiftwidth=2 tabstop=2 expandtab

" filetype indent on
set foldcolumn=1
set foldmethod=marker

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:smartgf_extensions = ['.vim', '.ls', '.coffee', '.js']

set updatetime=1500

set timeout timeoutlen=400 ttimeoutlen=10
set lazyredraw "Don't redraw while executing macros
set hidden splitbelow
set colorcolumn=100
set ignorecase smartcase incsearch

" Base16 256 colors setup {{{
set t_Co=256
let base16colorspace=256 
colorscheme base16-default
" }}}

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger = ")"
let g:UltiSnipsJumpForwardTrigger = ")"
let g:UltiSnipsJumpBackwardTrigger = "("

" complete to longest match, then list possibilities
set wildmode=longest,list

" turn off swap files
set noswapfile

" options for diff mode
set diffopt=filler
set diffopt+=context:4
set diffopt+=iwhite
set diffopt+=vertical

" show number column
set number
set numberwidth=3
