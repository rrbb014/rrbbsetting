# rrbbsetting

Ubuntu 24.04 기반 ML/데이터 엔지니어링 워크스테이션 개인 dotfiles.

## 구성

| 디렉토리 | 내용 |
|---|---|
| `linux-env-conf/` | zsh, neovim, tmux 설정 |
| `docker/` | ML 인프라용 Docker 이미지 및 compose |
| `scripts/` | 데이터 처리 및 파이프라인 유틸 스크립트 |

## 셋업

새 머신에 전체 환경 설치:

```bash
cd linux-env-conf
bash setup.sh       # 시스템 패키지, tmux, neovim(LazyVim), pyenv, nvm, Go, lazygit, Nerd Fonts 설치
bash setup-zsh.sh   # oh-my-zsh + zsh-syntax-highlighting 설치 (멱등, 재실행 안전)
```

설정 파일은 복사 없이 repo에서 직접 source하므로 수정 즉시 반영됨.

## tmux

prefix: `Ctrl+a`

| 키 | 동작 |
|---|---|
| `Ctrl+a y` | Claude Code popup (세션 유지, 재접속 가능) |
| `Ctrl+a q` | Popup 닫기 |
| `Ctrl+a D` | Dev layout — 좌우 분할 (왼쪽: claude, 오른쪽: btop) |
| `Ctrl+a g` | lazygit popup |
| `Ctrl+a e` | 빠른 쉘 popup |
| `Ctrl+a u` | URL fzf 선택 후 브라우저 열기 |
| `Ctrl+a r` | 설정 리로드 |
| `Ctrl+a \|` / `-` | 수직 / 수평 분할 |
| `Ctrl+a h/j/k/l` | pane 이동 (vim 키) |
| `Ctrl+a Ctrl+v` | 시스템 클립보드 붙여넣기 (wl-clipboard) |

설정 파일:
- `linux-env-conf/tmux.conf` — 키바인딩 및 동작
- `linux-env-conf/tmux-theme.conf` — Tokyo Night 스타일 테마

`~/.tmux.conf`는 두 파일을 모두 source하는 단일 라인으로 구성됨.

## neovim

LazyVim starter (`~/.config/nvim/`). 플러그인 매니저: lazy.nvim (첫 실행 시 자동 부트스트랩).

## zsh

테마: `miloshadzic`. pyenv, nvm, Go, CUDA 경로 포함.
`vim`/`vi`는 `nvim`으로 alias됨.

## 폰트

JetBrainsMono Nerd Font (기본), D2Coding Nerd Font 설치됨.
Ghostty 설정: `~/.config/ghostty/config`에서 `font-family`로 전환.

## Docker

ML 디버그 이미지 빌드 (Python 3.5 + numpy/pandas/scipy/kazoo/hdfs):

```bash
cd docker/build && sudo docker build -t rrbb_ml rrbb-ml
```

HDFS + Zookeeper 스택 실행:

```bash
sudo docker-compose -f docker/compose/hdfs_zookeeper.yml up -d
```

## 참고

- tmux 3.6+ 필요 (`pane-scrollbars on`)
- 클립보드 연동: `wl-clipboard` (Wayland 환경)
- tmux-resurrect: `~/tmux-resurrect/`
