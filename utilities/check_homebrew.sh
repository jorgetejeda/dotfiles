#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

check_homebrew() {
  if ! command -v brew &>/dev/null; then
    if preguntar "Homebrew no está instalado (es necesario para continuar). ¿Deseas instalarlo?"; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo "  Homebrew instalado correctamente."
    else
      echo "  Homebrew es obligatorio. Abortando."
      return 1
    fi
  else
    echo "  [OK] Homebrew ya está instalado."
    if preguntar "¿Deseas actualizar Homebrew (brew update)?"; then
      brew update
    fi
  fi
}
