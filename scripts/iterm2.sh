#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

realpath() {
	python -c "import os,sys; print os.path.realpath(sys.argv[1])" "$1"
}

BASE_DIR=$(dirname "$0" && cd .. && pwd)
RESOURCE_DIR="$BASE_DIR/scripts/resources/"

git submodule init && git submodule update || exit 1
# git clone https://github.com/chriskempson/base16-iterm2.git resources/base16-iterm2
open $RESOURCE_DIR/base16-iterm2/base16-default.dark.256.itermcolors
# https://gist.github.com/baopham/1838072#file-monaco-for-powerline-otf
# open $RESOURCE_DIR/Monaco+for+Powerline.otf
defaults import com.googlecode.iterm2 $RESOURCE_DIR/com.googlecode.iterm2.plist

$RESOURCE_DIR/powerline-fonts/install.sh

