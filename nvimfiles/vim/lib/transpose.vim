" vim:fdm=marker
fun! s:getc()
  let c = getchar()
  return type(c) == type(0) ? nr2char(c) : c
endf

fun! s:transposeInnerImpl(c, post)
  return '"zyi'.a:c.'va'.a:c.a:post.'"zp'
endf

fun! s:transposeInner(c)
  if a:c !~ '[[:print:]]'
    return ''
  end
  if a:c ==# '0'
    return '"zdibdabvB"zp'
    " return s:transposeInnerImpl('b', "dB")
  elseif a:c ==# 's'
    " return 'mz"zyibvabc<Space><Esc>"zp`z'
    return s:transposeInnerImpl('b', "c \<Esc>")
  elseif a:c ==# '.'
    let l:c = a:c.<SID>getc()
    " return 'mz"zyibvabc<Space><Esc>"zp`z'
    return s:transposeInnerImpl(l:c, "")
  elseif a:c ==# '"'
    return s:transposeInnerImpl(a:c, "c \<Esc>")
  elseif a:c ==# "'"
    return s:transposeInnerImpl(a:c, "c \<Esc>")
  end
  " return 'mzvi'.a:c.'"zyva'.a:c.'"zp`z'
  return s:transposeInnerImpl(a:c, "")
  " return '"zyi'.a:c.'va'.a:c.'"zp'
endf

fun! s:transposeMotion(c)
  if len(a:c) == 1
    return 'vi'.a:c.'"zyva'.a:c.'"zp'
  end
  return ''
endf

nmap <expr> ti <SID>transposeInner(<SID>getc())

"" Transposing {{{
" Swap characters (next and prev, resp.)
nnoremap <silent> tl xph
nnoremap <silent> th hxp

" Swap current word with next (across lines)
nnoremap <silent> tw mz"_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`z
" nnoremap <silent> tw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

"" This one doesn't go across lines
" nnoremap <silent> tw mz"_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR>`z

" Transpose words forwards and backwards (pushing)
" nnoremap <silent> te "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
nnoremap <silent> te "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR>
vnoremap <silent> te "_y:s/\(\%V\_.*\%V.\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR>
" nnoremap <silent> tb "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <silent> tb "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>
vnoremap <silent> tb "_y?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\%V\_.*\%V.\)/\3\2\1/<CR><c-o>

" Transpose lines
nmap <silent> tn mz<C-Down>`zk
nmap <silent> tp mz<C-Up>`zj

" Transpose block contents
" " nnoremap tif "zdibdabdiw"zp
" nnoremap tif "zyibdabviw"zp
" " nnoremap tib "zdibdab"zP
" nnoremap tib "zyibvab"zp
" nnoremap tis mz"zyibvabc<Space><EsC>"zp`z
" " nnoremap tic "zyibvab"zp
" nnoremap tiB "zdiBvaB"zp
" nnoremap ti" "zdi"vi""zp
" nnoremap ti' "zdi'va'"zp
" nnoremap ti] "zdi]va]"zp
" nnoremap ti< "zdi<va<"zp
" nnoremap ti[ "zdi[va["zp
"" }}}
