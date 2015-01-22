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
let meta_map = split('p P R x H J K L T = - + < > gf gF f F o q z n h j k l v s t r b')
" let meta_map = split('p P R x H J K L T = - + < > gf gF f F o q c z n h j k l v s t r b')

for x in meta_map
	execute "nnoremap <silent> <esc>".x." <C-w>".x
endfor

nnoremap <silent> <esc>; :bprev<cr>
nnoremap <silent> <esc>' :bnext<cr>
nnoremap <silent> <Esc>c :bp<bar>sp<bar>bn<bar>bd<CR>
" }}}
