#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Starship]"

instalar_brew "starship" "Starship"

aplicar_stow "starship"

echo "  Listo."
