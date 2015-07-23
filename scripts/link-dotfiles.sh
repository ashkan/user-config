#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

realpath() {
	python -c "import os,sys; print os.path.realpath(sys.argv[1])" "$1"
}

BASE_DIR=$(dirname "$0" && cd .. && pwd)
RESOURCE_DIR="$BASE_DIR/scripts/resources/"
DOTFILES_PATH=$(realpath "$SCRIPT_DIR/../dotfiles")

ln -sf "$DOTFILES_PATH/vimrc" ~/.vimrc
ln -sf "$DOTFILES_PATH/vim" ~/.vim

ln -sf "$DOTFILES_PATH/vimrc" ~/.nvimrc
ln -sf "$DOTFILES_PATH/vim" ~/.nvim

ln -sf "$DOTFILES_PATH/slate/slate" ~/.slate

