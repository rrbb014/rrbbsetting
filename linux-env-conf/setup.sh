#!/bin/bash
INFO_PREFIX="\e[1m\e[32mINFO\e[0m:"

EXEC_PATH=$(readlink -f $(dirname "$0"))

# GIT
sudo apt-get install -y git

# ZSH
sh setup-zsh.sh

# TMUX
sudo apt-get remove -y tmux
sudo apt-get update
sudo apt-get install -y tmux

# TMUX-resurrect
echo -e $INFO_PREFIX "Install TMUX-resurrect"
rm -fr ~/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-resurrect
echo -e $INFO_PREFIX "tmux-resurrect repository cloned to ~/tmux-resurrect"

# move TMUX config
echo -e source $EXEC_PATH/tmux.conf > ~/.tmux.conf
echo -e $INFO_PREFIX "Moved $EXEC_PATH/tmux.conf ==> ~/.tmux.conf"

tmux source ~/.tmux.conf

# VIM

# Install Vim 
git clone https://github.com/vim/vim.git 
cd vim
make distclean
./configure --enable-pythoninterp=yes --enable-python3interp=yes
make && sudo make install
cd ../

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Exuberant-ctags for Tagbar plugin
sudo apt-get install exuberant-ctags

# Install CScope
sudo apt-get install cscope

# For YouCompleteMe 

# Install Go
wget https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
sudo tar -xvf go1.14.1.linux-amd64.tar.gz
sudo mv go /usr/local

mkdir -p $HOME/go

# Install npm and nodejs 
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt-get install nodejs

cd $HOME/.vim/bundle/YouCompleteMe
python3 install.py --all

# Move Vim config
echo -e source $EXEC_PATH/vimrc > ~/.vimrc
echo -e $INFO_PREFIX "Moved $EXEC_PATH/vimrc ==> ~/.vimrc"
