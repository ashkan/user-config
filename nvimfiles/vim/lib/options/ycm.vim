let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_semantic_triggers =  {
      \   'html' : ['<', '{'],
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::'],
      \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \ }
