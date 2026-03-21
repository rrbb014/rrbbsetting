#!/bin/bash
EXEC_PATH=$(readlink -f $(dirname "$0"))
MARKER="# rrbbsetting"

# install zsh and oh-my-zsh
sudo apt-get install zsh curl -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-syntax-highlighting (skip if already cloned)
if [ ! -d "$EXEC_PATH/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$EXEC_PATH/zsh-syntax-highlighting"
fi

# append config only once (guard with marker)
if ! grep -q "$MARKER" ~/.zshrc; then
    echo "" >> ~/.zshrc
    echo "$MARKER" >> ~/.zshrc
    echo "source $EXEC_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
    cat "$EXEC_PATH/zshrc" >> ~/.zshrc
fi
