#!/bin/bash

# Verificar si Homebrew está instalado
source ./utilities/check_homebrew.sh

# Función para instalar Neovim y sus dependencias
install_neovim_dependencies() {
  echo "Instalando dependencias para Neovim..."

  # Instalar neovim
  brew install neovim

  # Instalar ripgrep
  brew install ripgrep

  # Instalar lazygit
  brew install lazygit

  # Instalar lazgit desde el repositorio jesseduffield
  # brew install jesseduffield/lazygit/lazygit

  echo "Dependencias de Neovim instaladas correctamente."
}

# Ejecutar la instalación de dependencias
install_neovim_dependencies

echo "Ejecutando stow para nvim..."
stow nvim

echo "¡Instalación de Neovim y sus dependencias completada!"
