" Escape(s) {{{
vnoremap v <Esc>

inoremap  <esc>
nnoremap  <c-c>
vnoremap  <esc>
xnoremap  <esc>
snoremap  <esc>
cmap  <C-C>

vnoremap <c-c> <c-c>`<

" call arpeggio#map('c', '', 0, 'jk', '<c-c>')
" call arpeggio#map('v', '', 0, 'jk', '<Esc>')
" call arpeggio#map('i', '', 0, 'jk', '<Esc>')
" }}}

nnoremap W :w<cr>
nnoremap Q :bd<cr>
nnoremap mm :make<CR>

" Terminal fixes {{{
map <Nul> <C-space>
vmap <Nul> <C-Space>
omap <Nul> <C-Space>
" map! [1;6D <C-S-Left>
" map! [1;6C <C-S-Right>
" map! [1;6B <C-S-Down>
" map! [1;6A <C-S-Up>
" map! [1;5D <C-Left>
" map! [1;5C <C-Right>
" map! [1;5B <C-Down>
" map! [1;5A <C-Up>
" map! [1;2B <S-Down>
" map! [1;2A <S-Up>
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
" Text movement
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
inoremap <C-k> D
inoremap <C-d> <Del>
inoremap <C-a> <c-o>^
inoremap <C-e> <End>
inoremap <M-f> <c-o>E
inoremap <M-b> <c-o>B

" Editing
fun! s:comment_savepos()
  let line = getline(".")
  norm gcl
  let pline = getline(".")
  let offset = len(pline) - len(line)
  if offset > 0
    execute "norm! ".offset."l"
  else
    execute "norm! ".-offset."h"
  endif
endfun

inoremap <M-/> <c-o>:call <SID>comment_savepos()<CR>
nnoremap <M-/> :call <SID>comment_savepos()<CR>
vmap <M-/> gc

" Window management
imap <M-j> <esc><M-j>
imap <M-l> <esc><M-l>
imap <M-h> <esc><M-h>
imap <M-k> <esc><M-k>

imap <M->> <esc><M->>
imap <M-<> <esc><M-<>
" }}}

ab teh the

function! SaveMap(key, mode)
  call append(line("."), a:mode."map ".a:key." ".maparg(a:key, a:mode[0]))
endfun

" Command mode abbreviations {{{
cnoremap <c-k> <C-F>DA<C-C>

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
      \ ." }|:tabnext<CR> {|:tabprev<CR>"
      \ ." \"|:bnext<CR> '|:bnext<CR> ;|:bprev<CR> 6|:<C-u>b#<CR> c|:Bdelete<CR>"
      \ ." e|:<C-u>Color<CR>"
      \ )
      " \ ." <C-T>|:TagbarToggle<cr>"

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

" Line textobj {{{
xnoremap <silent> il :<C-u>silent! normal! ^v$h<CR>
omap <silent> il :normal vil<CR>

xnoremap <silent> al :<C-u>silent! normal! 0v$h<CR>
omap <silent> al :normal val<CR>
" }}}

" Entire textobj {{{
xnoremap ie :<C-u>silent! normal! ggVG<CR>
omap ie :normal vie<CR>

xnoremap ae :<C-u>silent! normal! ggVG<CR>
omap ae :normal vae<CR>
" }}}

function! GetCursorChar()
  return matchstr(getline('.'), '\%' . col('.') . 'c.')
endfunction

" Brace textobj {{{
let s:match = { "(": ")", ")": "(", "[": "]", "]": "[", "{": "}", "}": "{" }

function! s:highlight_brace(inner)
  call search('[\|(\|{', 'bce')
  let open = GetCursorChar()
  normal! %
  let end = GetCursorChar()
  if s:match[open] != end
    return 0
  endif
  if a:inner
    normal! v%loh
  else
    normal! v%
  endif
endfunction

xnoremap ij :<C-u>silent! call <SID>highlight_brace(1)<CR>
omap <silent> ij :silent! normal vij<CR>

xnoremap aj :<C-u>silent! call <SID>highlight_brace(0)<CR>
omap <silent> aj :silent! normal vaj<CR>
" }}}

" Pattern textobj {{{
function! s:highlight_next_pattern(opposite_p)
  let forward_p = (v:searchforward && !a:opposite_p)
        \ || (!v:searchforward && a:opposite_p)

  if search(@/, 'ce' . (forward_p ? '' : 'b')) == 0
    return 0
  endif
  norm v

  if search(@/, 'bc') == 0
    return 0
  endif
endfunction

xnoremap a/ :<C-u>silent! call <SID>highlight_next_pattern(0)<CR>
omap <silent> a/ :silent! normal va/<CR>

xnoremap a? :<C-u>silent! call <SID>highlight_next_pattern(1)<CR>
omap <silent> a? :silent! normal va?<CR>
" }}}

" " quote {{{
" function! s:quote_regex(quote)
"   if &filetype ==# 'vim'
"     return '\v(\\|^\s*' . a:quote . '*)@<!' . a:quote
"   else
"     return '\v(\\)@<!' . a:quote
"   endif
" endfunction

" function! s:get_quotes(str)
"   let unescaped = substitute(a:str, '\v\\+(''|"|`)', '', 'g')
"   return substitute(unescaped, '\v[^''"`]', '', 'g')
" endfunction

" function! s:get_buffer_head()
"   let s:line = line('.')
"   let s:col = col('.') - 2
"   if s:col < 0
"     let s:line -= 1
"     if s:line < 1
"       let s:line = 1
"       let s:col = 0
"     else
"       let s:col = strlen(getline(s:line))
"     endif
"   endif
"   let lines = getline(0, s:line)
"   let lines[-1] = lines[-1][: s:col]
"   if &filetype ==# 'vim'
"     let n = len(lines)
"     let i = 0
"     while i < n
"       let lines[i] = substitute(lines[i], '\v^\s*"+', '', 'g')
"       let i += 1
"     endwhile
"   endif
"   return join(lines, '')
" endfunction

" function! s:get_buffer_tail()
"   let s:col = col('.')
"   let lines = getline('.', '$')
"   let lines[0] = lines[0][s:col - 1 :]
"   return join(lines, '')
" endfunction

" function! s:parse_quotes(str)
"   let opened = []
"   let len = strlen(a:str)
"   let i = 0
"   while i < len
"     let c = a:str[i]
"     let pos = index(opened, c)
"     if pos == -1
"       call add(opened, c)
"     elseif pos == 0
"       let opened = []
"     else
"       let opened = opened[:(pos - 1)]
"     endif
"     let i += 1
"   endwhile
"   return opened
" endfunction

" function! s:get_first_closing_quote(str, opened)
"   let len = strlen(a:str)
"   let i = 0
"   while i < len
"     let c = a:str[i]
"     let pos = index(a:opened, c)
"     if pos != -1
"       return c
"     endif
"     let i += 1
"   endwhile
"   return ''
" endfunction

" " function! s:format_output(object_type, start_pos, end_pos)
" "     let start_pos = a:start_pos
" "     let end_pos = a:end_pos
" "     if a:object_type ==? 'i'
" "         let start_pos[2] += 1
" "         if end_pos[2] == 1
" "             let end_pos[1] -= 1
" "             let end_pos[2] = strlen(getline(end_pos[1])) + 1
" "         else
" "             let end_pos[2] -= 1
" "         endif
" "     endif
" "     return ['v', start_pos, end_pos]
" " endfunction

" function! s:select(inner)
"   let head = s:get_quotes(s:get_buffer_head())
"   let opened = s:parse_quotes(head)

"   " the inside case
"   if len(opened) > 0
"     let tail = s:get_quotes(s:get_buffer_tail())
"     let first_closing = s:get_first_closing_quote(tail, opened)
"     let regex = s:quote_regex(first_closing)
"     call search(regex, 'Wbe')
"     normal! v
"     " let start_pos = getpos('.')
"     call search(regex, 'We')
"     if a:inner
"       normal! holo
"     endif
"     return
"     " let end_pos = getpos('.')

"     " return s:format_output(a:object_type, start_pos, end_pos)
"   endif

"   " the in front case current line
"   let regex_any = s:quote_regex('(''|\"|`)')
"   let is_infront = search(regex_any, 'Wce', line('.'))
"   if is_infront
"     let quote = getline('.')[col('.') - 1]
"     " let start_pos = getpos('.')
"     normal! v
"     call search(s:quote_regex(quote), 'We')
"     if a:inner
"       normal! holo
"     endif
"     return
"     " let end_pos = getpos('.')

"     " return s:format_output(a:object_type, start_pos, end_pos)
"   else
"     let is_behind = search(regex_any, 'Wbce', line('.'))
"     " the behind case current line
"     if is_behind
"       let quote = getline('.')[col('.') - 1]
"       " let end_pos = getpos('.')
"       normal! v
"       call search(s:quote_regex(quote), 'Wbe')
"       if a:inner
"         normal! holo
"       endif
"       return
"       " let start_pos = getpos('.')

"       " return s:format_output(a:object_type, start_pos, end_pos)
"     endif
"   endif

"   " the in front case whole buffer
"   let regex_any = s:quote_regex('(''|\"|`)')
"   let is_infront = search(regex_any, 'Wce')
"   if is_infront
"     let quote = getline('.')[col('.') - 1]
"     " let start_pos = getpos('.')
"     normal! v
"     call search(s:quote_regex(quote), 'We')
"     if a:inner
"       normal! holo
"     endif
"     return
"     " let end_pos = getpos('.')

"     " return s:format_output(a:object_type, start_pos, end_pos)
"   else
"     let is_behind = search(regex_any, 'Wbce')
"     " the behind case whole buffer
"     if is_behind
"       let quote = getline('.')[col('.') - 1]
"       " let end_pos = getpos('.')
"       normal! v
"       call search(s:quote_regex(quote), 'Wbe')
"       if a:inner
"         normal! holo
"       endif
"       return
"       " let start_pos = getpos('.')

"       " return s:format_output(a:object_type, start_pos, end_pos)
"     endif
"   endif

" endfunction
" " }}}

" xnoremap aq :<C-u>silent! call <SID>select(0)<CR>
" omap <silent> aq :silent! normal vaq<CR>

" xnoremap iq :<C-u>silent! call <SID>select(1)<CR>
" omap <silent> iq :silent! normal viq<CR>
xmap q iq
omap q iq

" TODO: gv operator?

nmap <Space>D :call append(line("."), getline("."))<CR>
nmap <Space>dd :call append(line("."), getline("."))<CR>
nmap <Space>c <space>Dgclj
" vmap <Space>c <space>dgvgc
" Extracts the highlighted information from the line, pastes it afterword, and
" comments the original selection.
vmap <Space>c y'>]pgvgc'>j

" Clipboard operator {{{
map Y "+y
" map Y <Plug>(operator-clipboard)

" call operator#user#define("clipboard", 'Operator_clipboard')
" function! Operator_clipboard(motion_wiseness)
"   if a:motion_wiseness == "line"
"     normal! '["+y']
"   else
"     normal! `["+y`]
"   endif
" endfunction
" }}}

" Wrap operator (<Space>w) {{{
call operator#user#define("wrap", 'Operator_wrap')
function! Operator_wrap(motion_wiseness)
  let save = @a
  if a:motion_wiseness == "line"
    let opt = "\n"
    let mark = "'"
  else
    let opt = ""
    let mark = "`"
  endif
  let x = getpos("']")
  let x[2] += 1
  call setpos("']", x)
  execute 'normal! '.mark.'["ay'.mark.']'
  let @a = input("start: ").opt .@a. input("end: ") .opt
  execute 'normal '.mark.'["a r'.mark.']'
  let @a = save
endfunction

map <space>w <Plug>(operator-wrap)
" }}}

vmap <C-k> <c-c><C-k>
vmap <C-j> <c-c><C-j>

" imap © ý
" imap ¨ ý

" map © ý
" map ¨ ý

" cmap w!! w !sudo tee > /dev/null %
command! W w !sudo tee % > /dev/null

" If I remap leader to ",", then I still want to be able to use quote.
if mapleader == ','
  nnoremap ,, ,
endif

" I deal with the clipboard a lot and almost never refer to "" when I can just
" leave it out.
nnoremap "" "+

" " Swap quote and double quote for greater good.
" nnoremap " '
" nnoremap ' "
" inoremap " '
" inoremap ' "
" cnoremap " '
" cnoremap ' "
" xnoremap " '
" xnoremap ' "
" onoremap " '
" onoremap ' "

vnoremap > >gv
vnoremap < <gv

" nnoremap [unite] <Nop>
" nmap , [unite]

" inoremap {<cr> {<cr>}<c-o>O
" inoremap [<cr> [<cr>]<c-o>O

tmap <c-a-j> <c-\><c-n><A-j>
tmap <c-a-k> <c-\><c-n><A-k>
tmap <c-a-h> <c-\><c-n><A-h>
tmap <c-a-l> <c-\><c-n><A-l>
tmap <c-a-"> <c-\><c-n><A-">
tmap <c-a-'> <c-\><c-n><A-'>
tmap <c-a-;> <c-\><c-n><A-;>
tnoremap <s-space> <space>

nmap <c-a-j> <A-j>
nmap <c-a-k> <A-k>
nmap <c-a-h> <A-h>
nmap <c-a-l> <A-l>
nmap <c-a-"> <A-">
nmap <c-a-'> <A-'>
nmap <c-a-;> <A-;>

" FUCK SHIT UP. Useful for terminal. Pray you never misuse it.
nnoremap <c-a-c> :bd!<CR>
tnoremap <c-a-c> <c-\><c-n>:bd!<CR>
" tnoremap <c-a-c> <C-D><CR>
tnoremap <c-space> <space>
tnoremap <s-backspace> <backspace>

tmap <a-j> <c-\><c-n><A-j>
tmap <a-k> <c-\><c-n><A-k>
tmap <a-h> <c-\><c-n><A-h>
tmap <a-l> <c-\><c-n><A-l>
tmap <a-"> <c-\><c-n><A-">
tmap <a-'> <c-\><c-n><A-'>
tmap <a-;> <c-\><c-n><A-;>

tmap <a-u> <c-\><c-n><A-u>
tmap <a-d> <c-\><c-n><A-d>

tmap <a-{> <c-\><c-n><A-{>
tmap <a-}> <c-\><c-n><A-}>

imap <a-j> <esc><A-j>
imap <a-k> <esc><A-k>
imap <a-h> <esc><A-h>
imap <a-l> <esc><A-l>
imap <a-"> <esc><A-">
imap <a-'> <esc><A-'>
imap <a-;> <esc><A-;>
imap <a-z> <c-o><A-z>
imap <a-s> <esc><a-s>

nmap ]k ]q
nmap [k [q

function! s:dash(query)
  " call jobstart(["open", "-g", "dash://<args>". expand("<cword>")])
  call jobstart(["dashAlfredWorkflow", a:query])
endfun

command! -nargs=+ DashDef call <SID>dash("", <q-args>)
command! -nargs=? DashCword call <SID>dash(<q-args>. expand("<cword>"))
nnoremap <silent> K :DashCword<CR>

function! s:get_data()
  let saved = @z
  normal `<v`>"zygv
  let result = @z
  let @z = saved
  return result
endfun

let g:dash_tag = ""

vnoremap <silent> K :<C-u>call <SID>dash(<SID>get_data())<CR>

nnoremap <silent> <leader><Tab> :VimFilerBufferDir -split -simple -winwidth=35 -winminwidth=35 -no-quit<cr>
nnoremap <silent> <S-Tab> :VimFiler -split -simple -winwidth=35 -winminwidth=35 -no-quit<cr>
