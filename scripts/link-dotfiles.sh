#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

realpath() {
	python -c "import os,sys; print os.path.realpath(sys.argv[1])" "$1"
}

link() {
  source="$DOTFILES_PATH/$1" 
  test -z "$2" && target=~/.$1 || target="$2"
  unlink "$target"
  ln -sf "$source" "$target"
}

BASE_DIR=$(dirname "$0" && cd .. && pwd)
RESOURCE_DIR="$BASE_DIR/scripts/resources/"
DOTFILES_PATH=$(realpath "$SCRIPT_DIR/../dotfiles")

link vim ~/.config/nvim
link zshrc

# rm ~/.vim ~/.vimrc ~/.nvim ~/.nvimrc ~/.slate ~/Library/Application\ Support/Karabiner/private.xml
# ln -sf "$DOTFILES_PATH/vimrc" ~/.vimrc
# ln -sf "$DOTFILES_PATH/vim" ~/.vim

# ln -sf "$DOTFILES_PATH/vimrc" ~/.nvimrc
# ln -sf "$DOTFILES_PATH/vim" ~/.nvim

test $(uname) = "Darwin" && {
  link slate/slate ~/.slate
  link karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml
}
