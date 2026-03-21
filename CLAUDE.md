# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles and environment configuration for a Linux ML/data engineering workstation (Ubuntu 24.04). The repo contains three main areas:

| Directory | Purpose |
|-----------|---------|
| `linux-env-conf/` | Shell, editor, and terminal configs (zsh, neovim, tmux) |
| `docker/` | Docker images and compose files for ML infrastructure |
| `scripts/` | Utility scripts for data processing and pipeline management |

## Setup

Apply all configs to a new machine:

```bash
cd linux-env-conf
bash setup.sh        # installs system packages, tmux, neovim (LazyVim), pyenv, nvm, Go, lazygit
bash setup-zsh.sh    # installs oh-my-zsh + zsh-syntax-highlighting (idempotent, safe to re-run)
```

Configs are installed by sourcing from the repo rather than copying, so edits here take effect immediately.

## Config Files

- `linux-env-conf/tmux.conf` — prefix is `Ctrl+a`; vim-style pane navigation; Claude Code popup via `Ctrl+a + y` (session-persistent, nesting-safe); lazygit via `Ctrl+a + g`; tmux-resurrect enabled
- `linux-env-conf/zshrc` — theme `miloshadzic`; pyenv, nvm, Go, CUDA paths; `vim`/`vi` aliased to `nvim`; appended to `~/.zshrc` once (guarded by marker)
- `linux-env-conf/vimrc` — kept for reference only, no longer used (replaced by neovim+LazyVim)

## Neovim

LazyVim starter (`~/.config/nvim/`). Plugin manager: lazy.nvim (auto-bootstrapped on first launch). Vundle is **not** used.

## Docker

Build ML debug image (Python 3.5 + numpy/pandas/scipy/kazoo/hdfs):

```bash
cd docker/build && sudo docker build -t rrbb_ml rrbb-ml
```

Start HDFS + Zookeeper stack:

```bash
sudo docker-compose -f docker/compose/hdfs_zookeeper.yml up -d
```

Both services use `network_mode: host`.

## Key Notes

- tmux config targets tmux 3.6+ (`pane-scrollbars on` requires 3.6+); current system runs 3.6a
- Clipboard integration requires `xclip` installed on the host
- tmux-resurrect path: `~/tmux-resurrect/` (cloned by setup.sh)
- `~/.tmux.conf` is a single source line pointing into this repo
- `~/.zshrc` duplicate guard: marker `# rrbbsetting` prevents re-appending on repeated runs of setup-zsh.sh
