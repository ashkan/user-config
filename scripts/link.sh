#!/bin/bash
test -z "$1" && {
	echo "Usage: $0 <name>"
	exit 1
}
rm ~/.nvi*
rm ~/.vi*

ln -sf $PWD/$1/vim ~/.vim
echo ln -sf $PWD/$1/vim ~/.vim
ln -sf $PWD/$1/vimrc ~/.vimrc
echo ln -sf $PWD/$1/vimrc ~/.vimrc
ln -sf $PWD/$1/vim ~/.nvim
echo ln -sf $PWD/$1/vim ~/.nvim
ln -sf $PWD/$1/vimrc ~/.nvimrc
echo ln -sf $PWD/$1/vimrc ~/.nvimrc

