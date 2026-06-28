# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a macOS dotfiles repository using [GNU Stow](https://www.gnu.org/software/stow/) to symlink configuration files into `~/.config/` and `$HOME`. Each tool has its own subdirectory that mirrors the target directory structure.

## Installation

All scripts are interactive — they check if each tool/package is already installed and ask before installing, updating, or applying symlinks.

**Full setup from scratch (siempre desde la raíz del repo):**
```bash
chmod +x ./installation.sh && ./installation.sh
```

**Individual tool installations** (también desde la raíz del repo):
```bash
bash ./zsh/installation.sh
bash ./nvim/.config/nvim/installation.sh
bash ./starship/.config/installation.sh
bash ./wezterm/.config/wezterm/installation.sh
bash ./zellij/.config/zellij/installation.sh
bash ./yabai/.config/yabai/installation.sh   # handles both yabai and skhd
```

**Stow manual de un config específico:**
```bash
stow --restow --target=$HOME <tool-dir>   # e.g., stow --restow --target=$HOME nvim
```

**Homebrew packages** are listed in `instructions/installation.txt`. Lines under `# Normal applications` install via `brew install`; lines under `# Installation using Homebrew Cask` via `brew install --cask`. Lines with inline annotations (e.g., `"dont install"`) are skipped — the parser only processes bare names matching `[a-zA-Z0-9_-]+`.

## Shared Utilities

- `utilities/utils.sh` — core helpers: `preguntar()` (y/n prompt), `instalar_brew()`, `instalar_brew_cask()`, `aplicar_stow()`
- `utilities/check_homebrew.sh` — sources `utils.sh`, exposes `check_homebrew()`
- All tool scripts source `check_homebrew.sh` (which pulls in `utils.sh`)

## Architecture

### Stow Layout
Each tool directory mirrors the filesystem tree rooted at `$HOME`. For example:
- `nvim/.config/nvim/` → `~/.config/nvim/`
- `zsh/.zshrc` → `~/.zshrc`
- `starship/.config/starship/starship.toml` → `~/.config/starship/starship.toml`

### Neovim (nvim/)
- **Plugin manager**: Lazy.nvim (`nvim/.config/nvim/lua/*/lazy/`)
- **Dual profiles**: `jtejeda/` and `may/` under `lua/`. The active profile is set in `init.lua` by switching which `require()` calls are active. Currently `may` profile is active.
- Each profile has `core/` (options, keymaps, autocmds) and `lazy/` (plugin specs) subdirectories.
- LSP managed by Mason + nvim-lspconfig; formatting via conform.nvim; linting via nvim-lint.

### Zsh (zsh/)
- `.zshrc` — Oh-My-Zsh setup, NVM init, Starship prompt, Android/Java paths
- `.alias.zsh` — All aliases (git shortcuts, eza as `ls`, DB management, SSH helpers)
- Plugins: git, zsh-autosuggestions, zsh-syntax-highlighting, web-search

### Window Management (yabai/ + skhd/)
- **Yabai**: BSP tiling layout with 12px gaps/padding. Excludes System Settings, Calculator, Alfred from management.
- **Skhd**: Hotkeys use `Alt` as base modifier — `Alt+hjkl` for focus, `Shift+Alt` for window operations, `Ctrl+Alt` for warp/move.
- Both require macOS security permissions and run as background services. Their installation script is shared at `yabai/.config/yabai/installation.sh`.

### WezTerm (wezterm/)
- Lua config at `wezterm/.config/wezterm/wezterm.lua`
- Tokyo Night theme, FiraCode Nerd Font size 16, animated GIF background (`blob.gif`), window opacity 0.85, blur 30

### Starship (starship/)
- TOML config at `starship/.config/starship/starship.toml`
- Custom prompt symbols, directory truncation (3 levels), git status indicators

### Zellij (zellij/)
- KDL config at `zellij/.config/zellij/config.kdl`
- Kanagawa theme; `Ctrl+g` toggles locked mode; `Alt+f` toggles floating panes; `Ctrl+o` enters session mode (`w` = session manager)
- Installed via `instalar_brew "zellij"` from its own `installation.sh`

## Notes

- Installation scripts are written in Spanish.
- All scripts must be run from the dotfiles root directory (relative paths depend on it).
- Yabai and skhd installations trigger macOS security permission dialogs — the scripts will prompt to accept them manually.
