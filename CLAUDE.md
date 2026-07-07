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
bash ./ghostty/.config/ghostty/installation.sh
bash ./zellij/.config/zellij/installation.sh
bash ./alfred/installation.sh   # installs Alfred + points its sync folder at the repo
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

### Starship (starship/)
- TOML config at `starship/.config/starship/starship.toml`
- Custom prompt symbols, directory truncation (3 levels), git status indicators

### Ghostty (ghostty/)
- Config at `ghostty/.config/ghostty/config`
- JetBrainsMono Nerd Font size 14, gruvbox-ish palette, `background-opacity = 0.75`, blur 10, `macos-option-as-alt = true`
- Installed via `instalar_brew_cask "ghostty"` from its own `installation.sh`

### Zellij (zellij/)
- KDL config at `zellij/.config/zellij/config.kdl`
- Kanagawa theme; `Ctrl+g` toggles locked mode; `Alt+f` toggles floating panes; `Ctrl+o` enters session mode (`w` = session manager)
- **Accidental-close guards** (zellij has no native confirmation dialog, so each uses a floating `bash` pane that prompts for `y` and, on confirm, runs a `zellij action`/`kill-session` — there is no `zellij action quit`):
  - `Ctrl+q` (quit) → confirm → `zellij kill-session $ZELLIJ_SESSION_NAME`.
  - Session/tmux mode detach rebound from `d` to `D` (Shift) + confirm → `zellij action detach` (session survives; reattach with `zellij attach`).
  - Tab-mode close `x` → confirm → `zellij action close-tab`.
  - Pane-mode close rebound from `x` to `X` (Shift), no prompt — a floating confirm pane would steal focus and `zellij action close-pane` would close the confirm pane itself, so a deliberate Shift key is used instead.
- Installed via `instalar_brew "zellij"` from its own `installation.sh`
- **zellij-attention plugin**: versioned `.wasm` at `zellij/.config/zellij/plugins/zellij-attention.wasm`, loaded via the `load_plugins` block in `config.kdl`. It adds ⏳/✅ icons to tab names. The plugin only has two states (`waiting`/⏳ and `completed`/✅), so "working" reuses ⏳. Claude Code hooks (registered idempotently into `~/.claude/settings.json` by the zellij `installation.sh` via `jq`): `UserPromptSubmit` + `Notification` → ⏳ (working/waiting), `Stop` → ✅ (done). Requires `jq`.

### Alfred (alfred/)
- Not stow-managed. The `Alfred.alfredpreferences` bundle lives at `alfred/Alfred.alfredpreferences` and Alfred is pointed at it via its **sync folder** setting (requires Alfred Powerpack).
- `alfred/installation.sh` installs the Alfred cask and runs `defaults write com.runningwithcrocodiles.Alfred syncfolder -string "$DOTFILES_DIR/alfred"`. Alfred must be launched once (and Powerpack active) to adopt it.

## Notes

- Installation scripts are written in Spanish.
- All scripts must be run from the dotfiles root directory (relative paths depend on it).
