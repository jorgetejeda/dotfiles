#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Alfred]"

instalar_brew_cask "alfred" "Alfred"

# Alfred (Powerpack) sincroniza sus preferencias mediante una "sync folder".
# Apuntamos esa carpeta a este repo para versionar la configuración.
# El bundle Alfred.alfredpreferences vive en alfred/ dentro del repo.
SYNC_DIR="$DOTFILES_DIR/alfred"

if preguntar "¿Deseas apuntar la sync folder de Alfred a $SYNC_DIR? (requiere Powerpack)"; then
  defaults write com.runningwithcrocodiles.Alfred syncfolder -string "$SYNC_DIR"
  echo "  Sync folder configurada: $SYNC_DIR"
  echo "  NOTA: abre Alfred (con Powerpack activo) para que adopte la carpeta."
  echo "        Verifica en Alfred → Preferences → Advanced → 'Set preferences folder'."
else
  echo "  Omitiendo configuración de la sync folder de Alfred."
fi

echo "  Listo."
