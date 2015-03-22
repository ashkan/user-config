let s:noInsertContext = {
      \ 'start_insert' : 0
      \ }

" nnoremap [unite] <Nop>
" nmap , [unite]

function! UniteWithDir(directory, context, sources)
" function! UniteWithDir(directory, command)
  call PushDir(expand(a:directory))
  let a:context.path = GitRoot()
  call PopDir()
  " let a:context.path = expand(a:directory)
  call unite#start(a:sources, a:context)
  " execute a:command
endfunction

" function! MapUnite(key, directory, buffer_name, context, sources)
function! MapUnite(key, directory, buffer_name, options, sources)
  let l:command = printf('Unite -buffer-name=%s %s %s',
        \ a:buffer_name, join(a:options), join(a:sources))
  let mapping = printf('nnoremap <expr> [unite]%s UniteWithDir(%s, "%s")',
        \ a:key, a:directory, l:command)
  echo mapping
  execute mapping
  " let mapping = printf('nnoremap [unite]%s 
endfunction

" call MapUnite('aa', "'.'", 'git_grep', [], ['vcs_grep/git'])
" nnoremap ,aa :<C-u>call UniteWithDir('%:p:h', {'buffer_name': 'git_grep'}, ['vcs_grep/git'])<cr>
" nnoremap <expr> ,aa unite#start(['file'], {})

" " Buffer
" nnoremap [unite]b :<C-u>Unite -buffer-name=buffer buffer<cr>
" " Files
" nnoremap [unite]ff :<C-u>Unite -buffer-name=files file<cr>
" nnoremap [unite]fr :<C-u>Unite -buffer-name=files file_rec/async<cr>
" nnoremap [unite]fg :<C-u>Unite -buffer-name=files git_tree<cr>

" " Current directory variants
" nnoremap [unite]cf :<C-u>UniteWithBufferDir -buffer-name=files file<cr>
" nnoremap [unite]cr :<C-u>UniteWithBufferDir -buffer-name=files file_rec/async<cr>
" nnoremap [unite]cg :<C-u>UniteWithBufferDir -buffer-name=files git_tree<cr>

" nnoremap <silent> [unite]@ :<C-u>Unite -buffer-name=register register<CR>

" " MRU
" nnoremap [unite]r :<C-u>Unite -buffer-name=mru file_mru<cr>
" " Outline
" nnoremap [unite]o :<C-u>Unite -buffer-name=outline outline<cr>
" " Yank
" nnoremap [unite]y :<C-u>Unite -buffer-name=yank -no-start-insert history/yank<cr>
" " Session
" nnoremap [unite]ss :<C-u>Unite -buffer-name=session session/new<cr>
" nnoremap [unite]sl :<C-u>Unite -buffer-name=session session<cr>
" " Grep (with Ag)
" nnoremap [unite]a :<C-u>Unite -buffer-name=ag grep:.:-SC2<cr>
" nnoremap [unite]ag :<C-u>Unite-buffer-name=ag_root vcs_grep/ag_root<cr>
" nnoremap [unite]gg :<C-u>Unite -buffer-name=git_grep vcs_grep/git:-i<cr>
" nnoremap [unite]w :<C-u>UniteWithCursorWord -buffer-name=ag grep:.:-SC2<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:unite_map = [
      \  ["b",   "",                "buffer",    "",                  "buffer"],
      \  ["ff",  "",                "files",     "",                  "file"],
      \  ["fr",  "",                "files",     "",                  "file_rec/async"],
      \  ["fg",  "",                "files",     "",                  "git_tree"],
      \  ["cf",  "WithBufferDir",   "files",     "",                  "file"],
      \  ["cr",  "WithBufferDir",   "files",     "",                  "file_rec/async"],
      \  ["cg",  "WithBufferDir",   "files",     "",                  "git_tree"],
      \  ["@",   "",                "register",  "",                  "register"],
      \  ["r",   "",                "mru",       "",                  "file_mru"],
      \  ["o",   "",                "outline",   "",                  "outline"],
      \  ["y",   "",                "yank",      "-no-start-insert",  "history/yank"],
      \  ["ss",  "",                "session",   "",                  "session/new"],
      \  ["sl",  "",                "session",   "",                  "session"],
      \  ["a",   "",                "ag",        "",                  "grep:.:-SC2"],
      \  ["ag",  "",                "ag_root",   "",                  "vcs_grep/ag_root"],
      \  ["gg",  "",                "git_grep",  "",                  "vcs_grep/git:-i"],
      \  ["w",   "WithCursorWord",  "ag",        "",                  "grep:.:-SC2"]
      \]

