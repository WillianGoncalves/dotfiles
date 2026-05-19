# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commit Convention

Prefix commits with the tool being changed in square brackets. Use `[vim]` for Neovim changes (not `[nvim]`):

```
[vim] Update plugins
[zsh] Add fzf alias
[tmux] Fix clipboard for Wayland
```

## Symlink Setup

There is no install script. Symlinks are created manually:
- `~/.config/nvim` → `dotfiles/nvim/`
- Zsh functions are auto-loaded from `dotfiles/zsh/functions/` (sourced via `fpath` in `.zshrc`)

## Neovim Config

Entry point: `nvim/init.lua`, which requires five modules from `nvim/lua/`:
- `settings.lua` — vim options
- `keymaps.lua` — key mappings (leader: Space)
- `autocommands.lua` — auto commands
- `usercommands.lua` — custom commands (`FormatJson`, `Q`, `Qr`)
- `plugins.lua` — lazy.nvim plugin list and bootstrap

Individual plugin configs live in `nvim/lua/plugins/`. Plugin lock file: `nvim/lazy-lock.json`.

## Gotchas

- **Hardcoded Node path** in `nvim/lua/settings.lua`: `vim.g.node_host_prog` points to a specific NVM node version. When editing this file, do not silently change or remove that line — update the version string explicitly if needed.
- **blink.cmp** has a Rust build step; lazy.nvim handles this automatically on install/update.
