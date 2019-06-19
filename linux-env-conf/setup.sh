#!/bin/bash
INFO_PREFIX="\e[1m\e[32mINFO\e[0m:"

EXEC_PATH=$(readlink -f $(dirname "$0"))

# TMUX
sudo apt-get update
sudo apt-get install tmux 

# TMUX-resurrect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-resurrect
echo -e $INFO_PREFIX "tmux-resurrect repository cloned to ~/tmux-resurrect"

# cp ~/junhosetting/tmux.conf ~/.tmux.conf
echo -e source $EXEC_PATH/tmux.conf > ~/.tmux.conf
echo -e $INFO_PREFIX "Moved $EXEC_PATH/tmux.conf ==> ~/.tmux.conf"
tmux source ~/.tmux.conf
