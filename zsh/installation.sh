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

# Symlinks
if preguntar "¿Deseas sobrescribir ~/.zshrc con el de este repositorio?"; then
  [ -f "$HOME/.zshrc" ] && rm "$HOME/.zshrc"
fi

aplicar_stow "zsh"

echo "  Listo."
