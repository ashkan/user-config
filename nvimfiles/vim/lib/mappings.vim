" Escape(s) {{{
vnoremap v <Esc>

call arpeggio#map('c', '', 0, 'jk', '<c-c>')
call arpeggio#map('v', '', 0, 'jk', '<Esc>')
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
" }}}

nnoremap W :w<cr>
nnoremap Q :bd<cr>

" Insert blank line before and after {{{
nnoremap <silent> <C-k> :<C-u>call append(line('.')-1, '')<CR>
nnoremap <silent> <C-j> :<C-u>call append('.', '')<CR>
" }}}

" Searching
" C-Space Toggles highlight search
nnoremap <silent> <Nul> :set hlsearch! hlsearch?<CR>

" Set search to word under cursor
nnoremap <silent> <space><space> :let @/=expand("<cword>") \| set hlsearch<cr>

" Insert enter
nnoremap <silent> ,<cr> mzi<cr><esc>`z

" Commenting
nmap <silent> <esc>/ mzgcil`z
vmap <silent> <esc>/ gc

ab teh the

cnoremap <expr> %P expand("%:p")
cnoremap <expr> %H expand("%:h")
cnoremap <expr> %T expand("%:t")
cnoremap <expr> %R expand("%:t:r")

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

xnoremap <silent> <C-Down> :call MoveVisualDown()
xnoremap <silent> <C-Up> :call MoveVisualUp()
nnoremap <silent> <C-Down> :call MoveLineDown()
nnoremap <silent> <C-Up> :call MoveLineUp()
xnoremap <silent> <C-S-Down> :call MoveVisualDown()
xnoremap <silent> <C-S-Up> :call MoveVisualUp()
nnoremap <silent> <C-S-Down> :call MoveLineDown()
nnoremap <silent> <C-S-Up> :call MoveLineUp()
nmap <C-S-Right> mz>>`zll
vmap <C-S-Right> mz>gv`zll
nmap <C-S-Left> mz<<`zhh
vmap <C-S-Left> mz<gv`zhh
vmap <S-Up> <Up>
nmap <S-Up> v<Up>
vmap <S-Down> <Down>
nmap <S-Down> v<Down>
nnoremap <silent> <C-Space> :set hlsearch! hlsearch?
map <S-Tab> <S-Tab>
vmap <Nul> <C-Space>
omap <Nul> <C-Space>

set pastetoggle=<F2>


" Caveats:
" - Only works on single line
" - Doesn't work if the cursor is on the start quote, but does work if the
"   cursor is on the end quote.
function! ToggleQuotes() "{{{
  let [buf, row, col, off] = getpos(".") 
  let line = getline('.')

  let sqStart = strridx(strpart(line, 0, col-1), "'")
  let sqEnd = stridx(line, "'", col-1)

  let dqStart = strridx(strpart(line, 0, col-1), '"')
  let dqEnd = stridx(line, '"', col-1)
  " echo printf("D(%d,%d), S(%d, %d)\n", dqStart, dqEnd, sqStart, sqEnd)

  if sqStart < 0 || sqEnd < 0
    if dqStart < 0 || dqEnd < 0
      silent! s/\k\+\%#\k*\|\k*\%#\k\+/"&"/
      return
    else
      call setline('.', printf("%s'%s'%s", line[0:dqStart-1], line[dqStart+1:dqEnd-1],line[dqEnd+1:]))
    endif
  elseif dqStart < 0 || dqEnd < 0
    if sqStart < 0 || sqEnd < 0
      silent! s/\k\+\%#\k*\|\k*\%#\k\+/"&"/
      return
    else
      call setline('.', printf('%s"%s"%s', line[0:sqStart-1], line[sqStart+1:sqEnd-1],line[sqEnd+1:]))
    endif
  elseif (sqEnd - sqStart) > (dqEnd - dqStart)
    call setline('.', printf("%s'%s'%s", line[0:dqStart-1], line[dqStart+1:dqEnd-1],line[dqEnd+1:]))
  else
    call setline('.', printf('%s"%s"%s', line[0:sqStart-1], line[sqStart+1:sqEnd-1],line[sqEnd+1:]))
  endif
endfunction "}}}

nnoremap <silent> <leader>' mz:<C-u>call ToggleQuotes()<cr>`z

" Remap <C-w>+{key} bindings to Alt+{key} {{{
let meta_map = split("+ c|:bp<BAR>sp<BAR>bn<BAR>bd<CR> '|:bnext<CR> ;|:bprev<CR> u|<C-u> d|<C-d> b r t s v l k j h n z q o F f gF gf > < 6|:<C-u>b#<CR> e|:<C-u>Color<CR> 0|= = - T L K J H x R P p <C-T>|:<C-u>TagbarToggle<cr>")
" let meta_map = split('p P R x H J K L T = - + < > gf gF f F o q z n h j k l v s t r b')
" let meta_map = split('p P R x H J K L T = - + < > gf gF f F o q c z n h j k l v s t r b')

for x in meta_map
  let a = split(x, '|')
  let mapping = a[0]
  if len(a) == 1
    let command = "<C-w>".x
  else
    let command = a[1]
  endif
	execute "nnoremap <silent> <esc>".mapping." ".command
endfor

nnoremap <silent> <esc>; :bprev<cr>
nnoremap <silent> <esc>' :bnext<cr>
nnoremap <silent> <Esc>c :bp<bar>sp<bar>bn<bar>bd<CR>
" }}}
