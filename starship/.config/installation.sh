#!/bin/bash

# Asegurar que Homebrew está instalado
source ./utilities/check_homebrew.sh

# Verificar si Starship está instalado
if ! command -v starship &>/dev/null; then
    echo "Starship no está instalado. Instalándolo con Homebrew..."
    brew install starship
    echo "Starship instalado correctamente."
else
    echo "Starship ya está instalado."
fi

# Ejecutar Stow para Starship
echo "Ejecutando Stow para Starship..."
stow starship

# Confirmación final
echo "Instalación de Starship y configuración con Stow completada."