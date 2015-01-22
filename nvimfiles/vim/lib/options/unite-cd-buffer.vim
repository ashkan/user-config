" vim: foldmethod=marker

let s:source = {
			\ 'name'           : 'cd/buffer',
			\ 'filters'    : [],
			\ 'hooks'    : {}
			\ }

let s:messages = []
let s:root = ''
function! s:source.hooks.on_init(args, context)"{{{
  call add(s:messages, getcwd())
  call PushDir(BufferDir())
  call add(s:messages, getcwd())
endfunction"}}}

function! s:source.hooks.on_close(args, context)"{{{
  call PopDir()
endfunction"}}}

function! s:source.gather_candidates(args, context)"{{{
  return map(reverse(s:messages), '{"abbr": v:val, "word": v:val}')
endfunction"}}}

call unite#define_source(s:source)
