#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Zsh + Oh My Zsh]"

# Zsh (puede venir preinstalado en macOS, no necesariamente via Homebrew)
if command -v zsh &>/dev/null; then
  echo "  [OK] Zsh ya está instalado ($(zsh --version))."
  if preguntar "¿Deseas instalar/actualizar Zsh también via Homebrew?"; then
    instalar_brew "zsh" "Zsh"
  fi
else
  if preguntar "Zsh no está instalado. ¿Deseas instalarlo via Homebrew?"; then
    brew install zsh
  else
    echo "  Omitiendo Zsh."
  fi
fi

# Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "  [OK] Oh My Zsh ya está instalado."
  if preguntar "¿Deseas actualizar Oh My Zsh?"; then
    bash "$HOME/.oh-my-zsh/tools/upgrade.sh"
  else
    echo "  Omitiendo actualización de Oh My Zsh."
  fi
else
  if preguntar "Oh My Zsh no está instalado. ¿Deseas instalarlo?"; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "  Omitiendo Oh My Zsh."
  fi
fi

# Plugins (deben clonarse en el directorio custom de oh-my-zsh)
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "  [OK] zsh-autosuggestions ya está instalado."
else
  if preguntar "zsh-autosuggestions no está instalado. ¿Deseas instalarlo?"; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  fi
fi

if [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "  [OK] zsh-syntax-highlighting ya está instalado."
else
  if preguntar "zsh-syntax-highlighting no está instalado. ¿Deseas instalarlo?"; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  fi
fi

# Symlink Docker socket para compatibilidad con ctop y otras herramientas
# Colima expone el socket en $HOME/.colima/default/docker.sock, pero muchas
# herramientas asumen /var/run/docker.sock.
COLIMA_SOCK="${HOME}/.colima/default/docker.sock"
DOCKER_SOCK="/var/run/docker.sock"

if [ -L "$DOCKER_SOCK" ] && [ "$(readlink "$DOCKER_SOCK")" = "$COLIMA_SOCK" ]; then
  echo "  [OK] Symlink $DOCKER_SOCK ya existe y apunta a Colima."
else
  if preguntar "¿Deseas crear el symlink $DOCKER_SOCK → Colima? (requiere sudo)"; then
    sudo ln -sf "$COLIMA_SOCK" "$DOCKER_SOCK"
    echo "  Symlink creado: $DOCKER_SOCK → $COLIMA_SOCK"
  else
    echo "  Omitiendo symlink de Docker."
  fi
fi

# Symlinks
if preguntar "¿Deseas sobrescribir ~/.zshrc con el de este repositorio?"; then
  [ -f "$HOME/.zshrc" ] && rm "$HOME/.zshrc"
fi

aplicar_stow "zsh"

echo "  Listo."
