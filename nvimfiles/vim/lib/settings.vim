" Tabs bro
set shiftwidth=2 tabstop=2 expandtab

" filetype indent on
set foldcolumn=1
set foldmethod=marker

set laststatus=2

" let g:ycm_filetype_specific_completion_to_disable = {
"       \  "elixir": 1
"       \}

" For case insensitive filenames
" http://stackoverflow.com/questions/3686841/vim-case-insensitive-filename-completion
set wildignorecase


set updatetime=1500

set timeout timeoutlen=400 ttimeoutlen=10
set lazyredraw "Don't redraw while executing macros
set hidden splitbelow
set colorcolumn=100
set ignorecase smartcase incsearch

" Base16 256 colors setup {{{
set t_Co=256
colorscheme base16-default
if g:colors_name == "base16-default"
  hi Normal ctermbg=none
endif
" }}}

" " complete to longest match, then list possibilities
" set wildmode=longest,list

" For tab completion in menus
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
" First tab hit will complete as much as possible
" Second tab hit will provide a list
" The third and subsequent tabs will cycle
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,.git
let &viminfo .= ',"500'

set completeopt+=longest

" turn off swap files
set noswapfile

" options for diff mode
set diffopt=filler
set diffopt+=context:4
set diffopt+=iwhite
set diffopt+=vertical

" show number column
set nonumber
set numberwidth=3
