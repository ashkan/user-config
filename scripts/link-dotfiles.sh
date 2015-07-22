#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

realpath() {
	python -c "import os,sys; print os.path.realpath(sys.argv[1])" "$1"
}

BASE_DIR=$(dirname "$0" && cd .. && pwd)
RESOURCE_DIR="$BASE_DIR/scripts/resources/"

ln -sf $(realpath "$SCRIPT_DIR/../dotfiles/vimrc") ~/.vimrc
ln -sf $(realpath "$SCRIPT_DIR/../dotfiles/vim") ~/.vim

ln -sf $(realpath "$SCRIPT_DIR/../dotfiles/vimrc") ~/.nvimrc
ln -sf $(realpath "$SCRIPT_DIR/../dotfiles/vim") ~/.nvim

