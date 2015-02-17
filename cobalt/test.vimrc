version 6.0
let s:cpo_save=&cpo
set cpo&vim
inoremap <Nul> 
inoremap <expr> <Up> pumvisible() ? "\" : "\<Up>"
map! <S-Tab> <S-Tab>
inoremap <expr> <Down> pumvisible() ? "\" : "\<Down>"
inoremap <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
inoremap <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
inoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
inoremap <silent> <F19> =UltiSnips#ExpandSnippetOrJump()
inoremap <silent> <C-Down> :call MoveLineDown()
inoremap <silent> <C-Up> :call MoveLineUp()
inoremap <silent> <C-S-Down> :call MoveLineDown()
inoremap <silent> <C-S-Up> :call MoveLineUp()
map! <S-Left> <S-Left>
map! <S-Right> <S-Right>
inoremap <SNR>29_success:kj 
inoremap <SNR>29_success:jk 
inoremap <Plug>(arpeggio-default:k) k
inoremap <Plug>(arpeggio-default:j) j
cnoremap <SNR>29_success:kj 
cnoremap <SNR>29_success:jk 
cnoremap <Plug>(arpeggio-default:k) k
cnoremap <Plug>(arpeggio-default:j) j
snoremap <silent>  c
nnoremap <silent> <NL> :call append('.', '')
nnoremap <silent>  :call append(line('.')-1, '')
nnoremap <silent>  :nohlsearch
nnoremap <silent>  :call repeat#wrap("\<C-R>",v:count)
snoremap  "_c
vmap c <Plug>(emmet-code-pretty)
vmap m <Plug>(emmet-merge-lines)
nmap A <Plug>(emmet-anchorize-summary)
nmap a <Plug>(emmet-anchorize-url)
nmap k <Plug>(emmet-remove-tag)
nmap j <Plug>(emmet-split-join-tag)
nmap / <Plug>(emmet-toggle-comment)
nmap i <Plug>(emmet-image-size)
nmap N <Plug>(emmet-move-prev)
nmap n <Plug>(emmet-move-next)
vmap D <Plug>(emmet-balance-tag-outword)
nmap D <Plug>(emmet-balance-tag-outword)
vmap d <Plug>(emmet-balance-tag-inward)
nmap d <Plug>(emmet-balance-tag-inward)
nmap u <Plug>(emmet-update-tag)
nmap ; <Plug>(emmet-expand-word)
vmap , <Plug>(emmet-expand-abbr)
nmap , <Plug>(emmet-expand-abbr)


snoremap <silent> <expr> <esc>( UltiSnips#JumpBackwards()
snoremap <silent> <expr> <esc>) UltiSnips#JumpForwards()

"+ c|:bp<BAR>sp<BAR>bn<BAR>bd<CR> '|:bnext<CR> ;|:bprev<CR> u|<C-u> d|<C-d> b r t s v l k j h n z q o F f gF gf > < 6|:<C-u>b#<CR> e|:<C-u>Color<CR> 0|= = - T L K J H x R P p <C-T>|:<C-u>TagbarToggle<cr>"

vmap <silent> / gc
nmap <silent> / mzgcil`z
map [1;6D <C-S-Left>
map [1;6C <C-S-Right>
map [1;6B <C-S-Down>
map [1;6A <C-S-Up>
map [1;5D <C-Left>
map [1;5C <C-Right>
map [1;5B <C-Down>
map [1;5A <C-Up>
map [1;2B <S-Down>
map [1;2A <S-Up>
vnoremap <silent>    :let @/=escape(CopyText("'<","'>"), '"\') | set hlsearchgv
nnoremap <silent>    :let @/=expand("<cword>") | set hlsearch
map  s <Plug>(operator-split)
map  d <Plug>(operator-duplicate)
map  w <Plug>(operator-wrap)
map  r <Plug>(operator-replace)
nnoremap ,d :YcmShowDetailedDiagnostic
nmap ,hp <Plug>GitGutterPreviewHunk
nmap ,hr <Plug>GitGutterRevertHunk
nmap ,hs <Plug>GitGutterStageHunk
nmap , [unite]
nnoremap <silent> ,' mz:call ToggleQuotes()`z
nnoremap ,mm :make
nnoremap <silent> , mzi`z
nnoremap <silent> . :call repeat#run(v:count)
xmap ; <Plug>SneakNext
omap ; <Plug>SneakNext
nmap ; <Plug>SneakNext
nnoremap Q :bd
xmap S <Plug>VSurround
nmap S <Plug>Sneak_S
nnoremap <silent> U :call repeat#wrap('U',v:count)
nnoremap W :w
xmap Z <Plug>Sneak_S
omap Z <Plug>Sneak_S
nmap [xx <Plug>unimpaired_line_xml_encode
xmap [x <Plug>unimpaired_xml_encode
nmap [x <Plug>unimpaired_xml_encode
nmap [uu <Plug>unimpaired_line_url_encode
xmap [u <Plug>unimpaired_url_encode
nmap [u <Plug>unimpaired_url_encode
nmap [yy <Plug>unimpaired_line_string_encode
xmap [y <Plug>unimpaired_string_encode
nmap [y <Plug>unimpaired_string_encode
nmap [p <Plug>unimpairedPutAbove
nnoremap [ov :set virtualedit+=all
nnoremap [ox :set cursorline cursorcolumn
nnoremap [ow :set wrap
nnoremap [os :set spell
nnoremap [or :set relativenumber
nnoremap [on :set number
nnoremap [ol :set list
nnoremap [oi :set ignorecase
nnoremap [oh :set hlsearch
nnoremap [od :diffthis
nnoremap [ou :set cursorcolumn
nnoremap [oc :set cursorline
nnoremap [ob :set background=light
xmap [e <Plug>unimpairedMoveSelectionUp
nmap [e <Plug>unimpairedMoveUp
nmap [  <Plug>unimpairedBlankUp
omap [n <Plug>unimpairedContextPrevious
nmap [n <Plug>unimpairedContextPrevious
nmap [o <Plug>unimpairedOPrevious
nmap [f <Plug>unimpairedDirectoryPrevious
nmap <silent> [T <Plug>unimpairedTFirst
nmap <silent> [t <Plug>unimpairedTPrevious
nmap <silent> [ <Plug>unimpairedQPFile
nmap <silent> [Q <Plug>unimpairedQFirst
nmap <silent> [q <Plug>unimpairedQPrevious
nmap <silent> [ <Plug>unimpairedLPFile
nmap <silent> [L <Plug>unimpairedLFirst
nmap <silent> [l <Plug>unimpairedLPrevious
nmap <silent> [B <Plug>unimpairedBFirst
nmap <silent> [b <Plug>unimpairedBPrevious
nmap <silent> [A <Plug>unimpairedAFirst
nmap <silent> [a <Plug>unimpairedAPrevious
nmap [c <Plug>GitGutterPrevHunk
nnoremap [unite]w :UniteWithCursorWord -buffer-name=ag grep:.:-SC2
nnoremap [unite]gg :Unite -buffer-name=git_grep vcs_grep/git:-i
nnoremap [unite]ag :Unite-buffer-name=ag_root vcs_grep/ag_root
nnoremap [unite]a :Unite -buffer-name=ag grep:.:-SC2
nnoremap [unite]sl :Unite -buffer-name=session session
nnoremap [unite]ss :Unite -buffer-name=session session/new
nnoremap [unite]y :Unite -buffer-name=yank -no-start-insert history/yank
nnoremap [unite]o :Unite -buffer-name=outline outline
nnoremap [unite]r :Unite -buffer-name=mru file_mru
nnoremap <silent> [unite]@ :Unite -buffer-name=register register
nnoremap [unite]cg :UniteWithBufferDir -buffer-name=files git_tree
nnoremap [unite]cr :UniteWithBufferDir -buffer-name=files file_rec/async
nnoremap [unite]cf :UniteWithBufferDir -buffer-name=files file
nnoremap [unite]fg :Unite -buffer-name=files git_tree
nnoremap [unite]fr :Unite -buffer-name=files file_rec/async
nnoremap [unite]ff :Unite -buffer-name=files file
nnoremap [unite]b :Unite -buffer-name=buffer buffer
nnoremap [unite] <Nop>
xmap [% [%m'gv``
xmap \ <Plug>SneakPrevious
omap \ <Plug>SneakPrevious
nmap \ <Plug>SneakPrevious
nmap ]xx <Plug>unimpaired_line_xml_decode
xmap ]x <Plug>unimpaired_xml_decode
nmap ]x <Plug>unimpaired_xml_decode
nmap ]uu <Plug>unimpaired_line_url_decode
xmap ]u <Plug>unimpaired_url_decode
nmap ]u <Plug>unimpaired_url_decode
nmap ]yy <Plug>unimpaired_line_string_decode
xmap ]y <Plug>unimpaired_string_decode
nmap ]y <Plug>unimpaired_string_decode
nmap ]p <Plug>unimpairedPutBelow
nnoremap ]ov :set virtualedit-=all
nnoremap ]ox :set nocursorline nocursorcolumn
nnoremap ]ow :set nowrap
nnoremap ]os :set nospell
nnoremap ]or :set norelativenumber
nnoremap ]on :set nonumber
nnoremap ]ol :set nolist
nnoremap ]oi :set noignorecase
nnoremap ]oh :set nohlsearch
nnoremap ]od :diffoff
nnoremap ]ou :set nocursorcolumn
nnoremap ]oc :set nocursorline
nnoremap ]ob :set background=dark
xmap ]e <Plug>unimpairedMoveSelectionDown
nmap ]e <Plug>unimpairedMoveDown
nmap ]  <Plug>unimpairedBlankDown
omap ]n <Plug>unimpairedContextNext
nmap ]n <Plug>unimpairedContextNext
nmap ]o <Plug>unimpairedONext
nmap ]f <Plug>unimpairedDirectoryNext
nmap <silent> ]T <Plug>unimpairedTLast
nmap <silent> ]t <Plug>unimpairedTNext
nmap <silent> ] <Plug>unimpairedQNFile
nmap <silent> ]Q <Plug>unimpairedQLast
nmap <silent> ]q <Plug>unimpairedQNext
nmap <silent> ] <Plug>unimpairedLNFile
nmap <silent> ]L <Plug>unimpairedLLast
nmap <silent> ]l <Plug>unimpairedLNext
nmap <silent> ]B <Plug>unimpairedBLast
nmap <silent> ]b <Plug>unimpairedBNext
nmap <silent> ]A <Plug>unimpairedALast
nmap <silent> ]a <Plug>unimpairedANext
nmap ]c <Plug>GitGutterNextHunk
xmap ]% ]%m'gv``
omap al <Plug>(textobj-line-a)
xmap al <Plug>(textobj-line-a)
omap a/ <Plug>(textobj-lastpat-n)
xmap a/ <Plug>(textobj-lastpat-n)
omap a? <Plug>(textobj-lastpat-N)
xmap a? <Plug>(textobj-lastpat-N)
omap ai <Plug>(textobj-indent-a)
xmap ai <Plug>(textobj-indent-a)
omap aI <Plug>(textobj-indent-same-a)
xmap aI <Plug>(textobj-indent-same-a)
omap ae <Plug>(textobj-entire-a)
xmap ae <Plug>(textobj-entire-a)
onoremap <silent> aC :call TextObjWordBasedColumn("aW")
onoremap <silent> ac :call TextObjWordBasedColumn("aw")
xnoremap <silent> aC :call TextObjWordBasedColumn("aW")
xnoremap <silent> ac :call TextObjWordBasedColumn("aw")
omap aq <Plug>(textobj-quote-a)
xmap aq <Plug>(textobj-quote-a)
omap aj <Plug>(textobj-brace-a)
xmap aj <Plug>(textobj-brace-a)
xmap a% [%v]%
nnoremap cov :set =(&virtualedit =~# "all") ? 'virtualedit-=all' : 'virtualedit+=all'
nnoremap cox :set =&cursorline && &cursorcolumn ? 'nocursorline nocursorcolumn' : 'cursorline cursorcolumn'
nnoremap cod :=&diff ? 'diffoff' : 'diffthis'
nnoremap cob :set background==&background == 'dark' ? 'light' : 'dark'
nmap cs <Plug>Csurround
nmap cgc <Plug>ChangeCommentary
nmap cr <Plug>Coerce
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
omap ih <Plug>(textobj-gitgutter-i)
xmap ih <Plug>(textobj-gitgutter-i)
omap il <Plug>(textobj-line-i)
xmap il <Plug>(textobj-line-i)
omap i/ <Plug>(textobj-lastpat-n)
xmap i/ <Plug>(textobj-lastpat-n)
omap i? <Plug>(textobj-lastpat-N)
xmap i? <Plug>(textobj-lastpat-N)
omap ii <Plug>(textobj-indent-i)
xmap ii <Plug>(textobj-indent-i)
omap iI <Plug>(textobj-indent-same-i)
xmap iI <Plug>(textobj-indent-same-i)
omap ie <Plug>(textobj-entire-i)
xmap ie <Plug>(textobj-entire-i)
onoremap <silent> iC :call TextObjWordBasedColumn("iW")
onoremap <silent> ic :call TextObjWordBasedColumn("iw")
xnoremap <silent> iC :call TextObjWordBasedColumn("iW")
xnoremap <silent> ic :call TextObjWordBasedColumn("iw")
omap iq <Plug>(textobj-quote-i)
xmap iq <Plug>(textobj-quote-i)
omap ij <Plug>(textobj-brace-i)
xmap ij <Plug>(textobj-brace-i)
xmap s <Plug>Sneak_s
nmap s <Plug>Sneak_s
nmap <silent> tp mz<C-Up>`zj
nmap <silent> tn mz<C-Down>`zk
vnoremap <silent> tb "_y?\w\+\_W\+\%#:s/\(\%#\w\+\)\(\_W\+\)\(\%V\_.*\%V.\)/\3\2\1/
nnoremap <silent> tb "_yiw?\w\+\_W\+\%#:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/
vnoremap <silent> te "_y:s/\(\%V\_.*\%V.\)\(\_W\+\)\(\w\+\)/\3\2\1//\w\+\_W\+
nnoremap <silent> te "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1//\w\+\_W\+
nnoremap <silent> tw mz"_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/`z
nnoremap <silent> th hxp
nnoremap <silent> tl xph
nnoremap <silent> u :call repeat#wrap('u',v:count)
vnoremap v 
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
omap z <Plug>Sneak_s
nnoremap <silent> <Nul> :set hlsearch! hlsearch?
map <S-Right> <S-Right>
map <S-Left> <S-Left>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
nmap <silent> <Plug>unimpairedOPrevious <Plug>unimpairedDirectoryPrevious:echohl WarningMSG|echo "[o is deprecated. Use [f"|echohl NONE
nmap <silent> <Plug>unimpairedONext <Plug>unimpairedDirectoryNext:echohl WarningMSG|echo "]o is deprecated. Use ]f"|echohl NONE
nnoremap <silent> <Plug>unimpairedTLast :exe "".(v:count ? v:count : "")."tlast"
nnoremap <silent> <Plug>unimpairedTFirst :exe "".(v:count ? v:count : "")."tfirst"
nnoremap <silent> <Plug>unimpairedTNext :exe "".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPrevious :exe "".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>unimpairedQNFile :exe "".(v:count ? v:count : "")."cnfile"zv
nnoremap <silent> <Plug>unimpairedQPFile :exe "".(v:count ? v:count : "")."cpfile"zv
nnoremap <silent> <Plug>unimpairedQLast :exe "".(v:count ? v:count : "")."clast"zv
nnoremap <silent> <Plug>unimpairedQFirst :exe "".(v:count ? v:count : "")."cfirst"zv
nnoremap <silent> <Plug>unimpairedQNext :exe "".(v:count ? v:count : "")."cnext"zv
nnoremap <silent> <Plug>unimpairedQPrevious :exe "".(v:count ? v:count : "")."cprevious"zv
nnoremap <silent> <Plug>unimpairedLNFile :exe "".(v:count ? v:count : "")."lnfile"zv
nnoremap <silent> <Plug>unimpairedLPFile :exe "".(v:count ? v:count : "")."lpfile"zv
nnoremap <silent> <Plug>unimpairedLLast :exe "".(v:count ? v:count : "")."llast"zv
nnoremap <silent> <Plug>unimpairedLFirst :exe "".(v:count ? v:count : "")."lfirst"zv
nnoremap <silent> <Plug>unimpairedLNext :exe "".(v:count ? v:count : "")."lnext"zv
nnoremap <silent> <Plug>unimpairedLPrevious :exe "".(v:count ? v:count : "")."lprevious"zv
nnoremap <silent> <Plug>unimpairedBLast :exe "".(v:count ? v:count : "")."blast"
nnoremap <silent> <Plug>unimpairedBFirst :exe "".(v:count ? v:count : "")."bfirst"
nnoremap <silent> <Plug>unimpairedBNext :exe "".(v:count ? v:count : "")."bnext"
nnoremap <silent> <Plug>unimpairedBPrevious :exe "".(v:count ? v:count : "")."bprevious"
nnoremap <silent> <Plug>unimpairedALast :exe "".(v:count ? v:count : "")."last"
nnoremap <silent> <Plug>unimpairedAFirst :exe "".(v:count ? v:count : "")."first"
nnoremap <silent> <Plug>unimpairedANext :exe "".(v:count ? v:count : "")."next"
nnoremap <silent> <Plug>unimpairedAPrevious :exe "".(v:count ? v:count : "")."previous"
nnoremap <silent> <Plug>SurroundRepeat .
nmap <silent> <Plug>CommentaryUndo <Plug>Commentary<Plug>Commentary
onoremap <silent> <Plug>(textobj-gitgutter-i) :call g:__textobj_gitgutter.do_by_function("select-i","-","o")
vnoremap <silent> <Plug>(textobj-gitgutter-i) :call g:__textobj_gitgutter.do_by_function("select-i","-","v")
vnoremap <Plug>(emmet-code-pretty) :call emmet#codePretty()
vnoremap <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-2)
nnoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(2)
nnoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
onoremap <silent> <Plug>(textobj-line-i) :call g:__textobj_line.do_by_function("select-i","-","o")
vnoremap <silent> <Plug>(textobj-line-i) :call g:__textobj_line.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-line-a) :call g:__textobj_line.do_by_function("select-a","-","o")
vnoremap <silent> <Plug>(textobj-line-a) :call g:__textobj_line.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-lastpat-n) :call g:__textobj_lastpat.do_by_function("select","n","o")
vnoremap <silent> <Plug>(textobj-lastpat-n) :call g:__textobj_lastpat.do_by_function("select","n","v")
onoremap <silent> <Plug>(textobj-lastpat-N) :call g:__textobj_lastpat.do_by_function("select","N","o")
vnoremap <silent> <Plug>(textobj-lastpat-N) :call g:__textobj_lastpat.do_by_function("select","N","v")
onoremap <silent> <Plug>(textobj-indent-i) :call g:__textobj_indent.do_by_function("select-i","-","o")
vnoremap <silent> <Plug>(textobj-indent-i) :call g:__textobj_indent.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-indent-a) :call g:__textobj_indent.do_by_function("select-a","-","o")
vnoremap <silent> <Plug>(textobj-indent-a) :call g:__textobj_indent.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-indent-same-i) :call g:__textobj_indent.do_by_function("select-i","same","o")
vnoremap <silent> <Plug>(textobj-indent-same-i) :call g:__textobj_indent.do_by_function("select-i","same","v")
onoremap <silent> <Plug>(textobj-indent-same-a) :call g:__textobj_indent.do_by_function("select-a","same","o")
vnoremap <silent> <Plug>(textobj-indent-same-a) :call g:__textobj_indent.do_by_function("select-a","same","v")
onoremap <silent> <Plug>(textobj-entire-i) :call g:__textobj_entire.do_by_function("select-i","-","o")
vnoremap <silent> <Plug>(textobj-entire-i) :call g:__textobj_entire.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-entire-a) :call g:__textobj_entire.do_by_function("select-a","-","o")
vnoremap <silent> <Plug>(textobj-entire-a) :call g:__textobj_entire.do_by_function("select-a","-","v")
onoremap <Plug>(operator-replace) g@
xmap <Plug>VSneakPrevious <Plug>SneakPrevious
xmap <Plug>VSneakNext <Plug>SneakNext
xmap <Plug>VSneakBackward <Plug>Sneak_S
xmap <Plug>VSneakForward <Plug>Sneak_s
nmap <Plug>SneakBackward <Plug>Sneak_S
nmap <Plug>SneakForward <Plug>Sneak_s
onoremap <silent> <Plug>(SneakStreakBackward) :call sneak#wrap(v:operator, 2, 1, 2, 2)
onoremap <silent> <Plug>(SneakStreak) :call sneak#wrap(v:operator, 2, 0, 2, 2)
xnoremap <silent> <Plug>(SneakStreakBackward) :call sneak#wrap(visualmode(), 2, 1, 2, 2)
xnoremap <silent> <Plug>(SneakStreak) :call sneak#wrap(visualmode(), 2, 0, 2, 2)
nnoremap <silent> <Plug>(SneakStreakBackward) :call sneak#wrap('', 2, 1, 2, 2)
nnoremap <silent> <Plug>(SneakStreak) :call sneak#wrap('', 2, 0, 2, 2)
onoremap <silent> <Plug>Sneak_T :call sneak#wrap(v:operator, 1, 1, 0, 0)
onoremap <silent> <Plug>Sneak_t :call sneak#wrap(v:operator, 1, 0, 0, 0)
xnoremap <silent> <Plug>Sneak_T :call sneak#wrap(visualmode(), 1, 1, 0, 0)
xnoremap <silent> <Plug>Sneak_t :call sneak#wrap(visualmode(), 1, 0, 0, 0)
nnoremap <silent> <Plug>Sneak_T :call sneak#wrap('', 1, 1, 0, 0)
nnoremap <silent> <Plug>Sneak_t :call sneak#wrap('', 1, 0, 0, 0)
onoremap <silent> <Plug>Sneak_F :call sneak#wrap(v:operator, 1, 1, 1, 0)
onoremap <silent> <Plug>Sneak_f :call sneak#wrap(v:operator, 1, 0, 1, 0)
xnoremap <silent> <Plug>Sneak_F :call sneak#wrap(visualmode(), 1, 1, 1, 0)
xnoremap <silent> <Plug>Sneak_f :call sneak#wrap(visualmode(), 1, 0, 1, 0)
nnoremap <silent> <Plug>Sneak_F :call sneak#wrap('', 1, 1, 1, 0)
nnoremap <silent> <Plug>Sneak_f :call sneak#wrap('', 1, 0, 1, 0)
onoremap <silent> <Plug>SneakPrevious :call sneak#rpt(v:operator, 1)
onoremap <silent> <Plug>SneakNext :call sneak#rpt(v:operator, 0)
xnoremap <silent> <Plug>SneakPrevious :call sneak#rpt(visualmode(), 1)
xnoremap <silent> <Plug>SneakNext :call sneak#rpt(visualmode(), 0)
nnoremap <silent> <Plug>SneakPrevious :call sneak#rpt('', 1)
nnoremap <silent> <Plug>SneakNext :call sneak#rpt('', 0)
onoremap <silent> <Plug>SneakRepeat :call sneak#wrap(v:operator, sneak#util#getc(), sneak#util#getc(), sneak#util#getc(), sneak#util#getc())
onoremap <silent> <Plug>Sneak_S :call sneak#wrap(v:operator, 2, 1, 2, 1)
onoremap <silent> <Plug>Sneak_s :call sneak#wrap(v:operator, 2, 0, 2, 1)
xnoremap <silent> <Plug>Sneak_S :call sneak#wrap(visualmode(), 2, 1, 2, 1)
xnoremap <silent> <Plug>Sneak_s :call sneak#wrap(visualmode(), 2, 0, 2, 1)
nnoremap <silent> <Plug>Sneak_S :call sneak#wrap('', 2, 1, 2, 1)
nnoremap <silent> <Plug>Sneak_s :call sneak#wrap('', 2, 0, 2, 1)
xnoremap <Plug>ColorFgBg :ColorSwapFgBg
nnoremap <Plug>ColorFgBg :ColorSwapFgBg
xnoremap <Plug>ColorContrast :ColorContrast
nnoremap <Plug>ColorContrast :ColorContrast
xnoremap <Plug>Colorizer :ColorHighlight
nnoremap <Plug>Colorizer :ColorToggle
onoremap <silent> <Plug>(textobj-quote-i) :call g:__textobj_quote.do_by_function("select-i","-","o")
vnoremap <silent> <Plug>(textobj-quote-i) :call g:__textobj_quote.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-quote-a) :call g:__textobj_quote.do_by_function("select-a","-","o")
vnoremap <silent> <Plug>(textobj-quote-a) :call g:__textobj_quote.do_by_function("select-a","-","v")
nnoremap <silent> <Plug>GitGutterPreviewHunk :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterRevertHunk :GitGutterRevertHunk
nnoremap <silent> <Plug>GitGutterStageHunk :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
snoremap <silent> <Del> c
snoremap <silent> <BS> c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
xnoremap <silent> <F19> :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> <F19> :call UltiSnips#ExpandSnippetOrJump()
onoremap <silent> <Plug>(textobj-brace-i) :call g:__textobj_brace.do_by_function("select-i","-","o")
vnoremap <silent> <Plug>(textobj-brace-i) :call g:__textobj_brace.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-brace-a) :call g:__textobj_brace.do_by_function("select-a","-","o")
vnoremap <silent> <Plug>(textobj-brace-a) :call g:__textobj_brace.do_by_function("select-a","-","v")
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
vnoremap <SNR>29_success:kj 
vnoremap <SNR>29_success:jk 
vnoremap <Plug>(arpeggio-default:k) k
vnoremap <Plug>(arpeggio-default:j) j
onoremap <Plug>(operator-split) g@
onoremap <Plug>(operator-wrap) g@
onoremap <Plug>(operator-duplicate) g@
inoremap  <Del>
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap  <Left>
inoremap <expr> 	 pumvisible() ? "\" : "\	"
inoremap <NL> <Down>
inoremap  <Up>
inoremap  <Right>
imap  <Plug>Isurround
inoremap  u
imap A <Plug>(emmet-anchorize-summary)
imap a <Plug>(emmet-anchorize-url)
imap k <Plug>(emmet-remove-tag)
imap j <Plug>(emmet-split-join-tag)
imap / <Plug>(emmet-toggle-comment)
imap i <Plug>(emmet-image-size)
imap N <Plug>(emmet-move-prev)
imap n <Plug>(emmet-move-next)
imap D <Plug>(emmet-balance-tag-outword)
imap d <Plug>(emmet-balance-tag-inward)
imap u <Plug>(emmet-update-tag)
imap ; <Plug>(emmet-expand-word)
imap , <Plug>(emmet-expand-abbr)
inoremap <silent> ( =UltiSnips#JumpBackwards()
inoremap <silent> ) =UltiSnips#ExpandSnippetOrJump()
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
cnoremap <expr> %R expand("%:t:r")
cnoremap <expr> %T expand("%:t")
cnoremap <expr> %H expand("%:h")
cnoremap <expr> %P expand("%:p")
cmap w!! w !sudo tee > /dev/null %
abbr teh the
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set commentstring=#\ %s
set complete=.,w,b,u,t
set completefunc=youcompleteme#Complete
set completeopt=preview,menuone
set cpoptions=aAceFsB
set diffopt=filler,context:4,iwhite,vertical
set display=lastline
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set foldlevelstart=1
set formatoptions=tcqj
set grepprg=ag\ --nogroup\ --nocolor
set helplang=en
set hidden
set history=1000
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set nrformats=hex
set omnifunc=youcompleteme#OmniComplete
set operatorfunc=<SNR>25_duplicate
set pastetoggle=<F2>
set ruler
set runtimepath=~/.nvim,~/.nvim/cobalt/Julian.vim-textobj-brace,~/.nvim/cobalt/Peeja.vim-cdo,~/.nvim/cobalt/Shougo.neomru.vim,~/.nvim/cobalt/Shougo.unite-session,~/.nvim/cobalt/Shougo.unite.vim,~/.nvim/cobalt/Shougo.vimproc.vim,~/.nvim/cobalt/SirVer.ultisnips,~/.nvim/cobalt/Valloric.YouCompleteMe,~/.nvim/cobalt/airblade.vim-gitgutter,~/.nvim/cobalt/awetzel.vim-elixir,~/.nvim/cobalt/beloglazov.vim-textobj-quotes,~/.nvim/cobalt/bling.vim-airline,~/.nvim/cobalt/bogado.file-line,~/.nvim/cobalt/cakebaker.scss-syntax.vim,~/.nvim/cobalt/cespare.vim-go-templates,~/.nvim/cobalt/chrisbra.Colorizer,~/.nvim/cobalt/chriskempson.base16-vim,~/.nvim/cobalt/christoomey.vim-conflicted,~/.nvim/cobalt/coderifous.textobj-word-column.vim,~/.nvim/cobalt/davidhalter.jedi-vim,~/.nvim/cobalt/fatih.vim-go,~/.nvim/cobalt/gaving.vim-textobj-argument,~/.nvim/cobalt/gkz.vim-ls,~/.nvim/cobalt/godlygeek.tabular,~/.nvim/cobalt/gorkunov.smartgf.vim,~/.nvim/cobalt/honza.vim-snippets,~/.nvim/cobalt/iandoe.vim-osx-colorpicker,~/.nvim/cobalt/justinmk.vim-sneak,~
set scrolloff=1
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set shiftwidth=2
set shortmess=filnxtToOc
set showcmd
set showtabline=2
set sidescrolloff=5
set smartcase
set smarttab
set splitbelow
set noswapfile
set tabline=%!airline#extensions#tabline#get()
set tabpagemax=50
set tabstop=2
set tags=./tags;,tags
set timeoutlen=400
set ttimeout
set ttimeoutlen=10
set updatetime=1500
set viminfo=!,'100,<50,s10,h
set wildignore=*.pyc
set wildmenu
set wildmode=longest,list
" vim: set ft=vim :
