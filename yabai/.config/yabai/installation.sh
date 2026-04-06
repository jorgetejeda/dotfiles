#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Yabai]"

# Yabai usa un tap propio
if brew list yabai &>/dev/null; then
  echo "  [OK] Yabai ya está instalado."
  if preguntar "¿Deseas actualizar Yabai?"; then
    brew upgrade yabai
  else
    echo "  Omitiendo actualización de Yabai."
  fi
else
  if preguntar "Yabai no está instalado. ¿Deseas instalarlo?"; then
    brew tap koekeishiya/formulae
    brew install yabai
  else
    echo "  Omitiendo Yabai."
  fi
fi

if brew list yabai &>/dev/null; then
  if preguntar "¿Deseas iniciar/reiniciar el servicio de Yabai?"; then
    yabai --start-service || brew services restart yabai
    echo "  NOTA: Si aparece un dialogo del sistema, acepta los permisos en"
    echo "        Ajustes > Privacidad y seguridad > General."
  fi
fi

echo ""
echo "  [Skhd]"

if brew list skhd &>/dev/null; then
  echo "  [OK] Skhd ya está instalado."
  if preguntar "¿Deseas actualizar Skhd?"; then
    brew upgrade skhd
  else
    echo "  Omitiendo actualización de Skhd."
  fi
else
  if preguntar "Skhd no está instalado. ¿Deseas instalarlo?"; then
    brew tap koekeishiya/formulae
    brew install skhd
  else
    echo "  Omitiendo Skhd."
  fi
fi

if brew list skhd &>/dev/null; then
  if preguntar "¿Deseas iniciar/reiniciar el servicio de Skhd?"; then
    skhd --start-service || brew services restart skhd
    echo "  NOTA: Si aparece un dialogo del sistema, acepta los permisos en"
    echo "        Ajustes > Privacidad y seguridad > General."
  fi
fi

# Symlinks
aplicar_stow "yabai"
aplicar_stow "skhd"

echo "  Listo."
