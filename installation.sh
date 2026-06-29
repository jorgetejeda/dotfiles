#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

# ------------------------------------------------------------------------------
# Instala o actualiza los paquetes base definidos en instructions/installation.txt
# Solo procesa nombres de paquete limpios (sin espacios ni paréntesis).
# Las líneas con anotaciones inline como "(dont install)" se ignoran automáticamente.
# ------------------------------------------------------------------------------
instalar_paquetes_base() {
  local archivo="$DOTFILES_DIR/instructions/installation.txt"

  if [ ! -f "$archivo" ]; then
    echo "  No se encontró instructions/installation.txt"
    return
  fi

  local modo_cask=false

  while IFS= read -r linea; do
    # Ignorar líneas vacías
    [[ -z "$linea" ]] && continue

    # Detectar sección Cask antes de ignorar comentarios generales
    if [[ "$linea" == *"Homebrew Cask"* ]]; then
      modo_cask=true
      continue
    fi

    # Ignorar comentarios
    [[ "$linea" =~ ^# ]] && continue

    # Solo procesar nombres limpios (sin espacios ni caracteres especiales)
    [[ "$linea" =~ ^[a-zA-Z0-9_-]+$ ]] || continue

    if $modo_cask; then
      instalar_brew_cask "$linea"
    else
      instalar_brew "$linea"
    fi
  done < "$archivo"
}

# Instala o actualiza Claude Code via npm
instalar_claude_code() {
  if command -v claude &>/dev/null; then
    echo "  [OK] Claude Code ya está instalado ($(claude --version 2>/dev/null || echo 'versión desconocida'))."
    if preguntar "¿Deseas actualizarlo?"; then
      npm update -g @anthropic-ai/claude-code
    else
      echo "  Omitiendo actualización de Claude Code."
    fi
  else
    if preguntar "Claude Code no está instalado. ¿Deseas instalarlo via npm?"; then
      if ! command -v npm &>/dev/null; then
        echo "  npm no está disponible. Instala Node.js primero (está en los paquetes base)."
      else
        npm install -g @anthropic-ai/claude-code
      fi
    else
      echo "  Omitiendo Claude Code."
    fi
  fi
}

# Llama al script de instalación de una herramienta, preguntando antes
ejecutar_instalacion() {
  local nombre="$1"
  local script="$2"

  echo ""
  echo "--- $nombre ---"
  if preguntar "¿Deseas instalar/configurar $nombre?"; then
    bash "$script"
  else
    echo "  Omitiendo $nombre."
  fi
}

# ------------------------------------------------------------------------------
# Inicio
# ------------------------------------------------------------------------------
echo ""
echo "============================================"
echo "  Configuracion de entorno macOS desde cero"
echo "============================================"
echo ""

# Paso 1: Homebrew
echo "--- Homebrew ---"
check_homebrew

# Paso 2: Stow (requerido por todos los scripts de configuración)
echo ""
echo "--- Stow ---"
instalar_brew "stow" "GNU Stow"

# Paso 3: Paquetes base
echo ""
echo "--- Paquetes base ---"
if preguntar "¿Deseas revisar/instalar los paquetes base de Homebrew?"; then
  instalar_paquetes_base
fi

# Paso 4: Herramientas
echo ""
echo "--- Claude Code ---"
instalar_claude_code

ejecutar_instalacion "Zsh + Oh My Zsh"   "$DOTFILES_DIR/zsh/installation.sh"
ejecutar_instalacion "Neovim"            "$DOTFILES_DIR/nvim/.config/nvim/installation.sh"
ejecutar_instalacion "Starship"          "$DOTFILES_DIR/starship/.config/installation.sh"
ejecutar_instalacion "Zellij"            "$DOTFILES_DIR/zellij/.config/zellij/installation.sh"
ejecutar_instalacion "Alfred"            "$DOTFILES_DIR/alfred/installation.sh"

# Paso 5: Aplicar todos los symlinks de configuración
echo ""
echo "--- Symlinks de configuración (stow) ---"
if preguntar "¿Deseas aplicar todos los symlinks de configuración ahora?"; then
  for tool in zsh nvim starship zellij; do
    if [ -d "$DOTFILES_DIR/$tool" ]; then
      echo "  Aplicando $tool..."
      stow --restow --target="$HOME" -d "$DOTFILES_DIR" "$tool"
    fi
  done
  echo "  Symlinks aplicados."
fi

echo ""
echo "============================================"
echo "  Proceso completado."
echo "============================================"
echo ""
echo "  Pasos manuales después de instalar:"
echo "  1. Abre nvim → espera que lazy.nvim instale los plugins"
echo "  2. Ejecuta en nvim: :Lazy build nvim-treesitter"
echo "     (compila los parsers de treesitter, necesario para LSP y autotag)"
echo "  3. Reinicia nvim → los errores de plugins deberían desaparecer"
echo "  4. En nvim ejecuta: :MasonInstall ts-ls cssls html lua-language-server"
echo "     (instala los LSP servers manualmente si Mason no los instala solo)"
echo "============================================"
