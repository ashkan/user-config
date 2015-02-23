" Escape(s) {{{
vnoremap v <Esc>

inoremap  <esc>
cnoremap  <c-c>
vnoremap  <esc>

call arpeggio#map('c', '', 0, 'jk', '<c-c>')
call arpeggio#map('v', '', 0, 'jk', '<Esc>')
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
" }}}

nnoremap W :w<cr>
nnoremap Q :bd<cr>
nnoremap mm :make<CR>

" Terminal fixes {{{
map <Nul> <C-space>
vmap <Nul> <C-Space>
omap <Nul> <C-Space>
map! [1;6D <C-S-Left>
map! [1;6C <C-S-Right>
map! [1;6B <C-S-Down>
map! [1;6A <C-S-Up>
map! [1;5D <C-Left>
map! [1;5C <C-Right>
map! [1;5B <C-Down>
map! [1;5A <C-Up>
map! [1;2B <S-Down>
map! [1;2A <S-Up>
" map <S-Tab> <S-Tab>
" }}}

" Insert blank line before and after {{{
nnoremap <silent> <C-k> :<C-u>call append(line('.')-1, '')<CR>
nnoremap <silent> <C-j> :<C-u>call append('.', '')<CR>
" }}}

" Searching {{{
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
nnoremap <silent> <space><space> :let @/='\<'.expand("<cword>").'\>' \| set hlsearch<cr>
vnoremap <silent> <space><space> :<C-u>let @/=<SID>get_visual_selection() \| set hlsearch \| norm gv<cr>

" C-Space Toggles highlight search
nnoremap <silent> <c-space> :set hlsearch! hlsearch?<CR>
vnoremap <silent> <c-space> :<C-u>set hlsearch! hlsearch? \| norm gv<CR>
" }}}

" Quick inserts (space, enter) {{{
nnoremap <silent> ,<cr> mzi<cr><esc>`z
nnoremap <silent> ,<space> mzi<space><esc>`z
" }}}

" Insert mode {{{
inoremap <C-d> <DEL>
inoremap <C-l> <Right>
inoremap <C-a> <home>
inoremap <C-e> <end>
" }}}

ab teh the

" Command mode abbreviations {{{
cnoremap <expr> %P expand("%:p")
cnoremap <expr> %H expand("%:h")
cnoremap <expr> %T expand("%:t")
cnoremap <expr> %R expand("%:t:r")
" }}}

" C- + {Up, Down} Move lines {{{
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv
" xnoremap <silent> <C-Down> :call MoveVisualDown()
" xnoremap <silent> <C-Up> :call MoveVisualUp()
" nnoremap <silent> <C-Down> :call MoveLineDown()
" nnoremap <silent> <C-Up> :call MoveLineUp()
" xnoremap <silent> <C-S-Down> :call MoveVisualDown()
" xnoremap <silent> <C-S-Up> :call MoveVisualUp()
" nnoremap <silent> <C-S-Down> :call MoveLineDown()
" nnoremap <silent> <C-S-Up> :call MoveLineUp()
" }}}

" C-S + {Left, Right} to indent {{{
nmap <C-S-Right> mz>>`zll
vmap <C-S-Right> mz>gv`zll
nmap <C-S-Left> mz<<`zhh
vmap <C-S-Left> mz<gv`zhh
" }}}

" Arrow key highlighting {{{
vmap <S-Up> <Up>
nmap <S-Up> v<Up>
vmap <S-Down> <Down>
nmap <S-Down> v<Down>
" }}}

" set pastetoggle=<F2>

" Toggle quotes {{{
nnoremap <silent> <leader>' mz:<C-u>call ToggleQuotes()<cr>`z
nnoremap <silent> <leader>" mz:<C-u>call ToggleQuotes()<cr>`z
" }}}

" let s:meta_map = split("b r t s v l k j h n z q o F f gF gf > < - T L K J H x R P p =|<C-w>+ 0|<C-w>="
let s:meta_map = split("b r t s v l k j h n z q o F f > < - T L K J H x R P p =|<C-w>+ 0|<C-w>="
      \ ." u|<C-u> d|<C-d>"
      \ ." \"|:bnext<CR> '|:bnext<CR> ;|:bprev<CR> 6|:<C-u>b#<CR> c|:bp<BAR>sp<BAR>bn<BAR>bd<CR>"
      \ ." e|:<C-u>Color<CR>"
      \ ." /|nmap|mzgcl`z /|vmap|gc"
      \ ." <C-T>|:<C-u>TagbarToggle<cr>"
      \ )

" Remap <C-w>+{key} bindings to Alt+{key} {{{
" let meta_map = split("+ c|:bp<BAR>sp<BAR>bn<BAR>bd<CR> \"|:bnext<CR> ;|:bprev<CR> u|<C-u> d|<C-d> b r t s v l k j h n z q o F f gF gf > < 6|:<C-u>b#<CR> e|:<C-u>Color<CR> 0|= = - T L K J H x R P p <C-T>|:<C-u>TagbarToggle<cr>")
" let meta_map = split('p P R x H J K L T = - + < > gf gF f F o q z n h j k l v s t r b')
" let meta_map = split('p P R x H J K L T = - + < > gf gF f F o q c z n h j k l v s t r b')

for x in s:meta_map
  let a = split(x, '|')
  let mapping = a[0]
  let mapper = "nnoremap"
  if len(a) == 1
    let command = "<C-w>".x
  elseif len(a) == 2
    let command = a[1]
  else
    let mapper = a[1]
    let command = a[2]
  endif

  if len(mapping) > 1
    if mapping =~ '<.*>'
      let key = "<M-".mapping[1:]
    else
      let key = join(map(split(mapping, '\zs'), '"<M-".v:val.">"'))
    endif
  else
    let key = "<M-".mapping.">"
  endif
  execute mapper." <silent> ".key." ".command
endfor
" }}}

xnoremap il :<C-u>silent! normal! ^v$h<CR>
omap il :normal vil<CR>

xnoremap al :<C-u>silent! normal! 0v$h<CR>
omap al :normal val<CR>

