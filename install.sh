#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "SKIP $dst (exists and is not a symlink)"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
  echo "LINK $dst -> $src"
}

link "$DOTFILES/nvim"            "$HOME/.config/nvim"
link "$DOTFILES/zsh/.zshrc"      "$HOME/.zshrc"
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
