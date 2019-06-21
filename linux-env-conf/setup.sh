#!/bin/bash
INFO_PREFIX="\e[1m\e[32mINFO\e[0m:"

EXEC_PATH=$(readlink -f $(dirname "$0"))

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
# Move Vim config
echo -e source $EXEC_PATH/vimrc > ~/.vimrc
echo -e $INFO_PREFIX "Moved $EXEC_PATH/vimrc ==> ~/.vimrc"
