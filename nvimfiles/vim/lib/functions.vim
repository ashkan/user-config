" vim:fdm=marker

" Find Last (Match) {{{
function! FindLastBefore(line, pattern, pos)
  let dotpos = strridx(a:line, a:pattern, a:pos)
  while dotpos >= a:pos
    let dotpos = strridx(a:line, a:pattern, dotpos-1)
  endwhile
  return dotpos
endfunction

function! FindLastMatchBefore(line, pattern, pos)
  " let previous = 0
  " let dotpos = match(a:line, a:pattern, previous)
  " while dotpos < a:pos && dotpos > 0
  "   let previous = dotpos
  "   let dotpos = match(a:line, a:pattern, previous+1)
  " endwhile
  " return previous
  let idx = 0
  let previous = -1
  let dotpos = match(a:line, a:pattern, 0, 0)
  while dotpos < a:pos && dotpos > 0
    let idx += 1
    let previous = dotpos
    let dotpos = match(a:line, a:pattern, 0, idx)
  endwhile
  return previous
endfunction

" }}}

" Trim {{{
function! Trim(s)
  return substitute(a:s, '^\s\+\|\s\+$', '', '')
endfunction

function! TrimEnd(s)
  return substitute(a:s, '\s\+$', '', '')
endfunction

function! TrimNewline(str)
  return substitute(str, '[\n]\+$', '', '')
endfunction
" }}}

" Push/Pop Dir {{{
let s:oldPwd = ''
function! SaveCwd() " {{{
  let s:oldPwd = getcwd()
endfunction "}}}

function! RestoreCwd()"{{{
  execute 'cd '.s:oldPwd
endfunction"}}}

let s:dirStack = []
function! PushDir(dir)
  call add(s:dirStack, getcwd())
  execute 'cd '.a:dir
  return a:dir
endfunction

function! PopDir()
  if len(s:dirStack) > 0
    let dir = remove(s:dirStack, -1)
    execute 'cd '.dir
    return dir
  else
    return ''
  endif
endfunction

function! PopAllDir()
  if len(s:dirStack) > 0
    let dir = remove(s:dirStack, 0)
    let s:dirStack = []
    execute 'cd '.dir
    return dir
  else
    return ''
  endif
endfunction
" }}}

function! BufferDir()
  return expand('%:p:h')
endfunction

function! GitCheck() "{{{
	call unite#util#system('git rev-parse')
	return (unite#util#get_last_status() == 0)? 1 : 0
endfunction "}}}

function! GitRoot()
  let l:root = substitute(unite#util#system('git root'), '[\n]\+$', '', '')
  return l:root
endfunction

function! PushGitRoot()
  let l:root = GitRoot()
  call PushDir(l:root)
  return l:root
endfunction

" Fast Keycodes {{{

" MapFastKeycode: helper for fast keycode mappings
" makes use of unused vim keycodes <[S-]F15> to <[S-]F37>
" function! <SID>MapFastKeycode(key, keycode)
function! MapFastKeycode(key, keycode)
  if s:fast_i == 46
    echohl WarningMsg
    echomsg "Unable to map ".a:key.": out of spare keycodes"
    echohl None
    return
  endif
  let vkeycode = '<'.(s:fast_i/23==0 ? '' : 'S-').'F'.(15+s:fast_i%23).'>'
  exec 'set '.vkeycode.'='.a:keycode
  exec 'map '.vkeycode.' '.a:key
  let s:fast_i += 1
endfunction
let s:fast_i = 0
" }}}

" Meta Key Helpers {{{
if &term =~ 'xterm'
  function! MetaPlus(key)
    if a:key =~? '^[csd]-'
      return '<Esc><'.a:key.'>'
    endif
    return '<Esc>'.a:key
  endfunction

  fun! PreMapMeta(fromCombo, toCombo)
    execute printf("set <M-%s>=%s", fromCombo, toCombo)
  endf
else
  function! MetaPlus(key)
    return '<M-'.a:key.'>'
  endfunction

  fun! PreMapMeta(key)
    return
  endf
endif

function! MapMeta(mode, flags, key, to, noremap)
  let l:noremap = a:noremap == 0 ? '' : 'nore'
  let l:command = a:mode.l:noremap.'map'
  let l:metaKey = '<M-'.a:key.'>'
  if &term =~ 'xterm'
    " call MapFastKeycode(l:metaKey, "\e".a:key)
    execute printf("map %s %s", a:key, l:metaKey)
  endif
  execute l:command.' '.a:flags.' '.l:metaKey.' '.a:to
endfunction
" }}}

" Move line functions {{{
function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction
" }}}

function! CopyText(start, end) "{{{
  let l:startLine = line(a:start)
  let l:line = l:startLine+1
  let l:endLine = line(a:end)

  if l:startLine == l:endLine
    let l:beg = col(a:start)-1
    let l:end = col(a:end)
    return strpart(getline(l:startLine), l:beg, l:end-l:beg)
  endif
  let l:text = strpart(getline(l:startLine), col(a:start)-1)
  while l:line < l:endLine
    let l:text .= "\n"
    let l:text .= getline(l:line)
    let l:line += 1
  endwhile
  let l:text .= "\n"
  let l:text .= strpart(getline(l:endLine), 0, col(a:end))
  return l:text
endfunction " }}}

function! DuplicateLine(count) range "{{{
  let l:count = max([a:count, 1])
  while l:count > 0
    let l:count -= 1
    execute a:firstline . ',' . a:lastline . 't' . a:lastline
  endw
endfunction "}}}

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

function! DeleteInactiveBufs() " {{{
  "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor

  "Below originally inspired by Hara Krishna Dara and Keith Roberts
  "http://tech.groups.yahoo.com/group/vim/message/56425
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
    if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
      "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
      silent exec 'bwipeout' i
      let nWipeouts = nWipeouts + 1
    endif
  endfor
  echomsg nWipeouts . ' buffer(s) wiped out'
endfunction "}}}

function! SetLight()
  set bg=light
endfunction

function! SetDark()
  set bg=dark
endfunction

