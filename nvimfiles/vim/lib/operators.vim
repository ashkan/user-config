" vim:fdm=marker
fun! s:SID(...)
  if a:0 > 0
    return matchstr(expand('<sfile>'), '\zs<SNR>\d\+_\zeSID$').a:1
  end
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endf

fun! s:skeleton(type) "{{{
  let [wview, n, r, v] = [winsaveview(), v:count1, v:register, operator#user#visual_command_from_wise_name(a:type)]
  let saved = [@@, @z]

  execute 'normal `[' . v . '`]"zy'

  call winrestview(wview)
  let [@@, @z] = saved
endf "}}}

fun! s:wrap(type) "{{{
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let [wview, n, r, v] = [winsaveview(), v:count1, v:register, operator#user#visual_command_from_wise_name(a:type)]
  let saved = [@@, @z]
  let prefix = input('> ')
  let suffix = input('< ')

  " echo "Wrap: ".v
  execute 'normal! `[' . v . '`]"zy'
  if v ==# 'V'
    let @z = prefix."\n".@z.suffix
  else
    let @z = prefix.@z.suffix
  end
  " let @z = prefix.@z.suffix
  normal! gv"zp
  if v ==# 'V'
    normal! gv=
  end

  let &clipboard = cb_save
  call winrestview(wview)
  let [@@, @z] = saved
endf "}}}

fun! s:duplicate(type) " {{{
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let [wview, n, r, v] = [winsaveview(), v:count1, v:register, operator#user#visual_command_from_wise_name(a:type)]
  let saved = [@@, @z]

  " TODO: Make block duplication work properly.
  " Save visual position for later
  let pos = getpos("']")
  execute 'normal! `[' . v . '`]"zy'
  " let @z = repeat(@z, n+1)
  let @z .= @z
  normal! gv"zp

  " Make sure visual is set to the original selection
  call setpos("'>", pos)

  let &clipboard = cb_save
  call winrestview(wview)
  let [@@, @z] = saved
endf " }}}

fun! s:split(type) " {{{
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let [wview, n, r, v] = [winsaveview(), v:count1, v:register, operator#user#visual_command_from_wise_name(a:type)]
  let saved = [@@, @z]
  let tosplit = input('')

  execute 'normal! `[' . v . '`]"zy'
  " let @z = repeat(@z, n+1)
  let @z = substitute(@z, tosplit, "\n", "g")
  normal! gv"zp
  normal! gv=

  let &clipboard = cb_save
  call winrestview(wview)
  let [@@, @z] = saved
endf " }}}

call operator#user#define('duplicate', <SID>SID('duplicate'))
call operator#user#define('wrap', <SID>SID('wrap'))
call operator#user#define('split', <SID>SID('split'))

map <space>r <Plug>(operator-replace)
map <space>w <Plug>(operator-wrap)
map <space>d <Plug>(operator-duplicate)
map <space>s <Plug>(operator-split)
