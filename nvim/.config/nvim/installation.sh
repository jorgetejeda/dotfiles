#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Neovim]"

instalar_brew "neovim"   "Neovim"
instalar_brew "ripgrep"  "ripgrep (búsqueda para Telescope)"
instalar_brew "lazygit"  "Lazygit"

# tree-sitter CLI (requerido por nvim-treesitter v1 para compilar parsers)
if ! command -v tree-sitter &>/dev/null; then
  if preguntar "tree-sitter CLI no está instalado. ¿Deseas instalarlo via npm?"; then
    # Cargar NVM si no está disponible en el shell actual
    if ! command -v npm &>/dev/null; then
      export NVM_DIR="$HOME/.nvm"
      [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    fi
    if command -v npm &>/dev/null; then
      npm install -g tree-sitter-cli
    else
      echo "  ERROR: npm no está disponible. Instala Node.js/NVM primero."
      echo "  Luego ejecuta: npm install -g tree-sitter-cli"
    fi
  fi
else
  echo "  [OK] tree-sitter CLI ya está instalado ($(tree-sitter --version))."
fi

aplicar_stow "nvim"

echo "  Listo."
