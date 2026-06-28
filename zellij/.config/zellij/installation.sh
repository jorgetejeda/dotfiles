#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Zellij]"

instalar_brew "zellij" "Zellij"

aplicar_stow "zellij"

echo "  Listo."
