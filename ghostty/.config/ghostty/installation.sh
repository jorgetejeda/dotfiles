#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Ghostty]"

instalar_brew_cask "ghostty" "Ghostty"
instalar_brew_cask "font-jetbrains-mono-nerd-font" "JetBrainsMono Nerd Font"

aplicar_stow "ghostty"

echo "  Listo."
