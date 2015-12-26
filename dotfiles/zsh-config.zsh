# vim:fdm=syntax
# Customize to your needs...
dash() { open "dash://$(echo "$*" | tr -d ' ')"; }

# vim/editor config {{{
alias vim=nvim
alias :e=vim
export EDITOR=nvim
export VISUAL=nvim
# }}}

test -n "$NVIM_LISTEN_ADDRESS" && {
  alias nvim="~/user-config/scripts/nvas"
  alias ncd="~/user-config/scripts/ncd"
}

# Go variables {{{
export GOPATH=$HOME/Workspace/golang
export GOBIN=$GOPATH/bin
path+=( $GOBIN )
# }}}

# multirust {{{
test -x ~/.multirust/bin/multirust && path+=(
  "/Users/ashkan/.multirust/bin"
  "/Users/ashkan/.multirust/cargo/bin"
)
# }}}

# Zsh settings config {{{
unsetopt CORRECT
setopt CLOBBER
unsetopt HIST_VERIFY
setopt autocd
# }}}

# TODO.txt {{{
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d ~/.todo/config'
# }}}

# Path extras {{{
path+=( $HOME/Workspace/bin )
test -e /opt/local/bin && path+=/opt/local/bin
# }}}

test $(uname) = "Linux" && alias ls='ls --color'
test $(uname) = "Darwin" && alias ls='ls -G'

function chpwd() {
  emulate -L zsh
  ls
  # dirn=${PWD##*/}
  # test -e "$WORKON_HOME/$dirn" && workon "$dirn"
  test -f .zsh && source .zsh
}

alias http-serve='python3 -m http.server'
test $+commands[rmtrash] -ne 0 && alias rm=rmtrash
alias l1="ls -1"
# export COLORTERM=xterm-256color

# Megashares client
msc() {
  curl -C - -O "$(megashares-client "$@")"
}


# (mk)virtualenv {{{
# source /usr/local/bin/virtualenvwrapper_lazy.sh
workon() {
  source $WORKON_HOME/$1/bin/activate
}

mkv() {
  test -z "$1" && {
    echo "Usage: mkv <directory>"
    return
  }
  mkvirtualenv "$1"
  cat <<EOF > ~/.virtualenvs/$1/bin/postactivate
#!/usr/bin/env zsh
cd $PWD/$1
EOF
}

# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export WORKON_HOME=$HOME/.virtualenvs
# }}}

# # Base16 Shell
# BASE16_SCHEME="default"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
# [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

path=( $^path(N) )

