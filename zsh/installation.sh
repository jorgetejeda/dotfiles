#!/bin/bash

# Asegurar que Homebrew está instalado
source ./utilities/check_homebrew.sh

# Instalar Zsh y Oh My Zsh
echo "Instalando Zsh..."
brew install zsh

echo "Instalando Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh ya está instalado."
fi

# Eliminar ~/.zshrc si existe, sin salir de dotfiles/zsh
echo "Eliminando ~/.zshrc si existe..."
[ -f ~/.zshrc ] && rm ~/.zshrc

# Volver a la raíz de dotfiles y ejecutar stow
cd ..
echo "Ejecutando stow para Zsh..."
stow zsh

# Recargar configuraciones
echo "Recargando configuración de Zsh..."
source ~/.zshrc
source ~/.alias.zsh

echo "¡Instalación completada!"
