call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim', {}

Plug 'bling/vim-airline', {}
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'airblade/vim-gitgutter', {}
Plug 'kana/vim-arpeggio', {}

Plug 'iandoe/vim-osx-colorpicker', {
      \  'on': 'Color'
      \}
let g:colorpicker_app = 'iTerm.app'

Plug 'Shougo/unite.vim', {}
Plug 'Shougo/neomru.vim', { }
Plug 'Shougo/unite-session', { }
Plug 'Shougo/vimproc.vim', {
      \  'do': 'make'
      \}
Plug 'davidhalter/jedi-vim', {
      \  'do': 'pip install --upgrade jedi'
      \}
let g:jedi#auto_vim_configuration = 0
let g:jedi#auto_initialization = 0

Plug 'rking/ag.vim', {}
Plug 'christoomey/vim-conflicted', {
      \  'on': 'Conflicted'
      \}
Plug 'mattn/emmet-vim', {
      \  'for': 'html'
      \}
Plug 'godlygeek/tabular', {
      \  'on': ['Tabularize']
      \}
Plug 'SirVer/ultisnips', {
      \  'on': []
      \}
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = "<M-)>"
let g:UltiSnipsJumpForwardTrigger = "<M-)>"
let g:UltiSnipsJumpBackwardTrigger = "<M-(>"

Plug 'majutsushi/tagbar', { }
Plug 'marijnh/tern_for_vim', {
      \  'for': 'javascript'
      \}
Plug 'Peeja/vim-cdo', {
      \  'on': ['Ldo', 'Cdo']
      \}
Plug 'bogado/file-line', {}
Plug 'artnez/vim-wipeout', {
      \  'on': 'Wipeout'
      \}


Plug 'Valloric/YouCompleteMe', {
      \  'on': [],
      \  'do': './install.sh'
      \}

Plug 'tpope/vim-commentary', {}
Plug 'tpope/vim-fugitive', {}
Plug 'tpope/vim-unimpaired', {}
Plug 'tpope/vim-sensible', {}
Plug 'tpope/vim-surround', {}
Plug 'tpope/vim-repeat', {}
Plug 'tpope/vim-abolish', {}

Plug 'justinmk/vim-sneak', {}
Plug 'gorkunov/smartgf.vim', {}
let g:smartgf_extensions = ['.vim', '.ls', '.coffee', '.js']

Plug 'kana/vim-textobj-user', {}
Plug 'kana/vim-textobj-indent', {}
Plug 'kana/vim-textobj-entire', {}
Plug 'kana/vim-textobj-lastpat', {}
Plug 'norcalli/textobj-gitgutter', {}
Plug 'gaving/vim-textobj-argument', {}
Plug 'Julian/vim-textobj-brace', {}
Plug 'coderifous/textobj-word-column.vim', {}
Plug 'beloglazov/vim-textobj-quotes', {}

Plug 'kana/vim-operator-user', {}
Plug 'kana/vim-operator-replace', {}

Plug 'cakebaker/scss-syntax.vim', {
      \  'for': 'scss'
      \}
Plug 'cespare/vim-go-templates', {
      \  'for': 'go'
      \}
Plug 'chrisbra/Colorizer', {}
Plug 'fatih/vim-go', {
      \  'for': 'go'
      \}
Plug 'gkz/vim-ls', {
      \  'for': 'ls'
      \}
Plug 'honza/vim-snippets', {}
Plug 'pangloss/vim-javascript', {
      \  'for': 'javascript'
      \}
Plug 'othree/javascript-libraries-syntax.vim', {
      \  'for': 'javascript'
      \}
Plug 'awetzel/vim-elixir', {
      \  'for': 'elixir',
      \  'dir': '~/.vim/cobalt/awetzel.vim-elixir/'
      \}
let g:elixir_load_remote = 0

Plug 'zah/nimrod.vim', {
      \  'for': 'nim'
      \}

" augroup load_us_ycm
"   autocmd!
"   autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
"\               | call youcompleteme#Enable() | autocmd! load_us_ycm
" augroup END

call plug#end()
