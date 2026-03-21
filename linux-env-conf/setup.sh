#!/bin/bash
set -e
INFO="\e[1m\e[32mINFO\e[0m:"
EXEC_PATH=$(readlink -f $(dirname "$0"))

# ─────────────────────────────────────────
# System packages
# ─────────────────────────────────────────
echo -e $INFO "Installing system packages"
sudo apt-get update
sudo apt-get install -y git curl wget unzip xclip wl-clipboard fzf tmux exuberant-ctags cscope

# ─────────────────────────────────────────
# Nerd Fonts (JetBrainsMono, D2Coding)
# ─────────────────────────────────────────
echo -e $INFO "Installing Nerd Fonts"
NERD_FONTS_VERSION=$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | grep '"tag_name"' | cut -d'"' -f4)
FONTS_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONTS_DIR"

for FONT in JetBrainsMono D2Coding; do
    echo -e $INFO "  Downloading $FONT Nerd Font"
    wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_VERSION}/${FONT}.zip" \
        -O "/tmp/${FONT}.zip"
    unzip -o -q "/tmp/${FONT}.zip" "*.ttf" -d "$FONTS_DIR"
    rm "/tmp/${FONT}.zip"
done

fc-cache -f "$FONTS_DIR"
echo -e $INFO "Nerd Fonts installed → $FONTS_DIR (select in terminal settings)"

# ─────────────────────────────────────────
# ZSH
# ─────────────────────────────────────────
bash "$EXEC_PATH/setup-zsh.sh"

# ─────────────────────────────────────────
# tmux-resurrect
# ─────────────────────────────────────────
echo -e $INFO "Installing tmux-resurrect"
rm -rf ~/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-resurrect

echo "source $EXEC_PATH/tmux.conf" > ~/.tmux.conf
echo "source $EXEC_PATH/tmux-theme.conf" >> ~/.tmux.conf
echo -e $INFO "Linked tmux config: $EXEC_PATH/tmux.conf + tmux-theme.conf -> ~/.tmux.conf"
tmux source ~/.tmux.conf 2>/dev/null || true

# ─────────────────────────────────────────
# Neovim
# ─────────────────────────────────────────
echo -e $INFO "Installing Neovim"
NVIM_VERSION="v0.11.0"
wget -q "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz" -O /tmp/nvim.tar.gz
sudo tar -C /usr/local -xzf /tmp/nvim.tar.gz --strip-components=1
rm /tmp/nvim.tar.gz

# LazyVim starter config (skip if already customized)
if [ ! -d ~/.config/nvim ]; then
    echo -e $INFO "Setting up LazyVim"
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
fi

# ─────────────────────────────────────────
# pyenv
# ─────────────────────────────────────────
echo -e $INFO "Installing pyenv"
if [ ! -d "$HOME/.pyenv" ]; then
    curl https://pyenv.run | bash
fi

# ─────────────────────────────────────────
# nvm
# ─────────────────────────────────────────
echo -e $INFO "Installing nvm"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi

# ─────────────────────────────────────────
# Go
# ─────────────────────────────────────────
echo -e $INFO "Installing Go"
GO_VERSION="1.22.0"
wget -q "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" -O /tmp/go.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf /tmp/go.tar.gz
rm /tmp/go.tar.gz
mkdir -p "$HOME/go"

# ─────────────────────────────────────────
# lazygit
# ─────────────────────────────────────────
echo -e $INFO "Installing lazygit"
LAZYGIT_VERSION="0.44.1"
wget -q "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" -O /tmp/lazygit.tar.gz
sudo tar -C /usr/local/bin -xzf /tmp/lazygit.tar.gz lazygit
rm /tmp/lazygit.tar.gz

echo -e $INFO "Setup complete. Restart your shell."
