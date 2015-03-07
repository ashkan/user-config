call plug#begin('~/.vim/plugged')

let lines = readfile(expand('~/.vim/plugins.json'))
if len(lines) > 0
  let contents = join(filter(lines, 'v:val !~ "\s*\/\/"'), "")
  let pluginData = eval(contents)
  for [name, options] in items(pluginData["plugins"])
    Plug name, options
    for [var, val] in items(get(options, "set", {}))
      let {var} = val
      unlet var  val
    endfor
    unlet name  options
  endfor
endif

" python <<EOF
" import vim
" def valid(x):
"   x = x.lstrip()
"   return x and not x.startswith("//")
" def loadData(filename):
"   with open(filename) as file:
"     contents = ''.join(x for x in (y.lstrip() for y in file.readlines()) if x and not x.startswith("//"))
"     return eval(contents)
" data = loadData('/Users/ashkan/.vim/plugins.json')
" vim.command(" | ".join("Plug '%s', %s" % (name, str(opts).replace("u'", "'")) for name, opts in data["plugins"].items()))
" EOF

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

call plug#end()
