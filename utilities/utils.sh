#!/bin/bash

# Pregunta al usuario y devuelve 0 (sí) o 1 (no)
preguntar() {
  local pregunta="$1"
  local respuesta
  while true; do
    printf "  > %s [s/n]: " "$pregunta"
    IFS= read -r respuesta </dev/tty
    respuesta=$(echo "$respuesta" | tr -d '[:space:]')
    case "$respuesta" in
      [sS]|[sS][iI]) return 0 ;;
      [nN]|[nN][oO]) return 1 ;;
      *) echo "    Responde 's' (sí) o 'n' (no)." ;;
    esac
  done
}

# Instala o actualiza un paquete de Homebrew de forma interactiva
instalar_brew() {
  local paquete="$1"
  local nombre="${2:-$paquete}"

  if brew list "$paquete" &>/dev/null; then
    # Instalado via Homebrew
    echo "  [OK] $nombre ya está instalado (Homebrew)."
    if preguntar "¿Deseas actualizarlo?"; then
      brew upgrade "$paquete" || echo "  (Ya está en la versión más reciente.)"
    else
      echo "  Omitiendo actualización de $nombre."
    fi
  elif command -v "$paquete" &>/dev/null; then
    # Instalado en el sistema (no via Homebrew, ej: macOS lo incluye)
    echo "  [OK] $nombre ya está disponible en el sistema (no via Homebrew)."
    if preguntar "¿Deseas instalarlo también via Homebrew (versión más reciente)?"; then
      brew install "$paquete"
    else
      echo "  Omitiendo $nombre."
    fi
  else
    if preguntar "$nombre no está instalado. ¿Deseas instalarlo?"; then
      brew install "$paquete"
    else
      echo "  Omitiendo $nombre."
    fi
  fi
}

# Instala o actualiza un paquete de Homebrew Cask de forma interactiva
instalar_brew_cask() {
  local paquete="$1"
  local nombre="${2:-$paquete}"

  if brew list --cask "$paquete" &>/dev/null; then
    echo "  [OK] $nombre ya está instalado (Cask)."
    if preguntar "¿Deseas actualizarlo?"; then
      brew upgrade --cask "$paquete" || echo "  (Ya está en la versión más reciente.)"
    else
      echo "  Omitiendo actualización de $nombre."
    fi
  else
    if preguntar "$nombre no está instalado. ¿Deseas instalarlo vía Cask?"; then
      brew install --cask "$paquete"
    else
      echo "  Omitiendo $nombre."
    fi
  fi
}

# Aplica stow para un directorio de configuración de forma interactiva
aplicar_stow() {
  local tool="$1"
  if preguntar "¿Deseas aplicar los symlinks de configuración para $tool?"; then
    stow --restow --target="$HOME" "$tool"
    echo "  Configuración de $tool aplicada."
  else
    echo "  Omitiendo symlinks de $tool."
  fi
}
