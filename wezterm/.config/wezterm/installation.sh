#!/bin/bash

# Asegurar que Homebrew está instalado
source ./utilities/check_homebrew.sh

# Verificar si WezTerm está instalado
if ! command -v wezterm &>/dev/null; then
    echo "WezTerm no está instalado. Instalándolo con Homebrew..."
    brew install --cask wezterm
    echo "WezTerm instalado correctamente."
else
    echo "WezTerm ya está instalado."
fi

# Ejecutar Stow para WezTerm
echo "Ejecutando Stow para WezTerm..."
stow wezterm

# Confirmación final
echo "Instalación de WezTerm y configuración con Stow completada."