#!/bin/bash

# Importar la función check_homebrew desde el archivo de utilities
source ./utilities/check_homebrew.sh

# Función para verificar si una dependencia está instalada
check_dependency() {
  command -v $1 &>/dev/null
  if [[ $? -ne 0 ]]; then
    echo "$1 no está instalado. Instalando..."
    brew install $1
  else
    echo "$1 ya está instalado."
  fi
}

# Función para instalar yabai
install_yabai() {
  echo "Instalando yabai..."
  check_dependency "koekeishiya/formulae/yabai"  # Verificar si yabai está instalado
  brew reinstall yabai

  # Iniciar el servicio de yabai
  echo "Iniciando el servicio de yabai..."
  brew services start yabai

  # Si ocurre un error relacionado con plist/service
  echo "Si ves un error relacionado con plist/service, prueba lo siguiente:"
  echo "yabai --start-service"
  yabai --start-service

  echo "Una ventana aparecerá pidiendo permisos, haz clic en 'Allow' en 'Seguridad y Privacidad' -> 'General'."

  # Reiniciar el servicio de yabai
  echo "Reiniciando el servicio de yabai..."
  brew services restart yabai

  # Si el error persiste, reiniciar el servicio
  echo "Si aún ves un error, ejecuta: yabai --restart-service"
  yabai --restart-service
}

# Función para instalar skhd
install_skhd() {
  echo "Instalando skhd..."
  check_dependency "koekeishiya/formulae/skhd"  # Verificar si skhd está instalado
  brew reinstall skhd

  # Iniciar el servicio de skhd
  echo "Iniciando el servicio de skhd..."
  brew services start skhd

  # Si ocurre un error relacionado con plist/service
  echo "Si ves un error relacionado con plist/service, prueba lo siguiente:"
  echo "skhd --start-service"
  skhd --start-service

  echo "Una ventana aparecerá pidiendo permisos, haz clic en 'Allow' en 'Seguridad y Privacidad' -> 'General'."

  # Reiniciar el servicio de skhd
  echo "Reiniciando el servicio de skhd..."
  brew services restart skhd

  # Si el error persiste, reiniciar el servicio
  echo "Si aún ves un error, ejecuta: skhd --restart-service"
  skhd --restart-service
}

# Comprobar si Homebrew está instalado
check_homebrew

# Verificar dependencias y realizar la instalación de Yabai y Skhd
install_yabai
install_skhd

# Ejecutar stow para crear los symlinks de los archivos de configuración de yabai y skhd
echo "Ejecutando stow para yabai y skhd..."
stow yabai
stow skhd

echo "¡Instalación completada de Yabai y Skhd!"
