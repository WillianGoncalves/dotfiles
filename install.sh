#!/bin/sh

#install dependencies
sudo apt-get install build-essential cmake

# install powerline fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

BASEDIR="$(cd "$( dirname "$0")" && pwd)"
#ln -sf $BASEDIR/vim ~/.vim
ln -sf $BASEDIR/vimrc ~/.vimrc
sudo vim +PlugInstall +qall

