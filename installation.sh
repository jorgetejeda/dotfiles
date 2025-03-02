#!/bin/bash

# Importar la función check_homebrew desde el archivo de utilities
source ./utilities/check_homebrew.sh

# Función para instalar dependencias de Homebrew y Homebrew Cask
install_brew_dependencies() {
  if [ -f ./instructions/installation.txt ]; then
    echo "Instalando dependencias de Homebrew..."

    # Separar las dependencias normales de las de Cask
    normal_dependencies=()
    cask_dependencies=()

    while IFS= read -r package; do
      # Si la línea empieza con #, ignorarla (es un comentario)
      if [[ "$package" =~ ^# ]]; then
        continue
      fi

      # Si la línea contiene 'Installation using Homebrew Cask', identificar que son dependencias Cask
      if [[ "$package" == "Installation using Homebrew Cask"* ]]; then
        continue
      fi

      # Clasificar las dependencias
      if [[ "$package" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        if [[ "$package" == *"/"* ]]; then
          # Paquete de Homebrew Cask (contiene '/')
          cask_dependencies+=("$package")
        else
          # Paquete de Homebrew normal
          normal_dependencies+=("$package")
        fi
      fi
    done < ./instructions/installation.txt

    # Instalar dependencias normales de Homebrew
    for package in "${normal_dependencies[@]}"; do
      if ! brew list "$package" &>/dev/null; then
        echo "Instalando $package..."
        brew install "$package"
      else
        echo "$package ya está instalado."
      fi
    done

    # Instalar dependencias usando Homebrew Cask
    for package in "${cask_dependencies[@]}"; do
      if ! brew list --cask "$package" &>/dev/null; then
        echo "Instalando $package con Cask..."
        brew install --cask "$package"
      else
        echo "$package ya está instalado con Cask."
      fi
    done

  else
    echo "No se encontró el archivo de dependencias installation.txt en el directorio 'instructions'."
  fi
}


# Mover archivo descargador (si es necesario)
move_downloader_script() {
  echo "Moviendo el archivo descargador a ~..."
  mv ./download_script.sh ~/
}

# Ejecutar instalación
run_installation() {
  echo "Ejecutando chmod +x ./installation.sh && ./installation.sh..."
  chmod +x ./installation.sh && ./installation.sh
}

# Ejecuciones adicionales de instalación de zsh, nvim, starship, wezterm, etc.
run_additional_installations() {
  echo "Ejecutando chmod +x ./zsh/installation.sh && ./zsh/installation.sh..."
  chmod +x ./zsh/installation.sh && ./zsh/installation.sh

  echo "Ejecutando chmod +x ./nvim/.config/nvim/installation.sh && ./nvim/.config/nvim/installation.sh..."
  chmod +x ./nvim/.config/nvim/installation.sh && ./nvim/.config/nvim/installation.sh

  echo "Ejecutando chmod +x ./starship/.config/starship/installation.sh && ./starship/.config/starship/installation.sh..."
  chmod +x ./starship/.config/starship/installation.sh && ./starship/.config/starship/installation.sh

  echo "Ejecutando chmod +x ./wezterm/.config/wezterm/installation.sh && ./wezterm/.config/wezterm/installation.sh..."
  chmod +x ./wezterm/.config/wezterm/installation.sh && ./wezterm/.config/wezterm/installation.sh

  echo "Ejecutando chmod +x ./yabai/.config/yabai/installation.sh && ./yabai/.config/yabai/installation.sh..."
  chmod +x ./yabai/.config/yabai/installation.sh && ./yabai/.config/yabai/installation.sh
}

# Comenzar la instalación
echo "Iniciando instalación..."

# Paso 1: Verificar si Homebrew está instalado
# Paso 2: Mover el archivo descargador a ~/
move_downloader_script
# Paso 3: Instalar dependencias de Home
install_brew_dependencies
# Paso 4: Ejecutar la instalación
run_installation
# Paso 5: Ejecutar instalaciones adicionales
run_additional_installations

echo "¡Instalación completada!"
