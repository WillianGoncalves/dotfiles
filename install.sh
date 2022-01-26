#!/bin/sh

BASEDIR=$(pwd)

#install dependencies
sudo apt-get install build-essential cmake
yarn global add diagnostic-languageserver

# create neovim config folder
mkdir -p ~/.config/nvim/

# install powerline fonts
mkdir -p ~/.local/share/fonts
cp $BASEDIR/vim/fonts/* ~/.local/share/fonts

echo Creating symlink for $BASEDIR/vim/vimrc
ln -sf $BASEDIR/vim/vimrc ~/.vimrc
ln -sf $BASEDIR/vim/vimrc ~/.config/nvim/init.vim # Neovim
ln -sf $BASEDIR/vim/rcplugins ~/.vim/rcplugins
ln -sf $BASEDIR/vim/rcfiles ~/.vim/rcfiles
# Using configuration file for COC plugin: https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file
ln -sf $BASEDIR/vim/coc-settings.json ~/.vim/coc-settings.json
ln -sf $BASEDIR/vim/coc-settings.json ~/.config/nvim/coc-settings.json # Neovim
sudo vim +PlugInstall +qall

ln -sf $BASEDIR/tmux/.tmux.conf ~/.tmux.conf
ln -sf $BASEDIR/zsh/.zshrc ~/.zshrc
