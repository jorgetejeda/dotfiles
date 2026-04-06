#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [WezTerm]"

instalar_brew_cask "wezterm" "WezTerm"
instalar_brew_cask "font-fira-code-nerd-font" "FiraCode Nerd Font"

aplicar_stow "wezterm"

echo "  Listo."
