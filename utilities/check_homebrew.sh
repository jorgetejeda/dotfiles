#!/bin/bash

# Función para verificar si Homebrew está instalado
check_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew no está instalado. Instalando Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew instalado correctamente."
  else
    echo "Homebrew ya está instalado."
  fi
}
