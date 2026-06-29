#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

source "$DOTFILES_DIR/utilities/check_homebrew.sh"

echo ""
echo "  [Zellij]"

instalar_brew "zellij" "Zellij"

aplicar_stow "zellij"

# zellij-attention: indicador de actividad de Claude Code en los tabs.
# El plugin .wasm ya viene versionado en el repo y se symlinkea via stow a
# ~/.config/zellij/plugins/. Aqui solo registramos los hooks de Claude Code
# que le envian eventos por 'zellij pipe' (Notification = esperando, Stop = listo).
SETTINGS="$HOME/.claude/settings.json"
if [ -f "$SETTINGS" ] && command -v jq >/dev/null 2>&1; then
  if preguntar "¿Registrar los hooks de zellij-attention en ~/.claude/settings.json?"; then
    NOTIF_CMD='[ -n "$ZELLIJ_PANE_ID" ] && zellij pipe --name "zellij-attention::waiting::$ZELLIJ_PANE_ID" || true'
    STOP_CMD='[ -n "$ZELLIJ_PANE_ID" ] && zellij pipe --name "zellij-attention::completed::$ZELLIJ_PANE_ID" || true'
    tmp="$(mktemp)"
    if jq --arg notif "$NOTIF_CMD" --arg stop "$STOP_CMD" '
        .hooks //= {}
        | .hooks.Notification = (((.hooks.Notification // []) | map(select((.hooks // []) | any((.command // "") | contains("zellij-attention")) | not))) + [{matcher:"", hooks:[{type:"command", command:$notif}]}])
        | .hooks.Stop        = (((.hooks.Stop // [])        | map(select((.hooks // []) | any((.command // "") | contains("zellij-attention")) | not))) + [{hooks:[{type:"command", command:$stop}]}])
      ' "$SETTINGS" > "$tmp"; then
      mv "$tmp" "$SETTINGS"
      echo "  Hooks de zellij-attention registrados. Reinicia Claude Code para que tomen efecto."
    else
      rm -f "$tmp"
      echo "  ERROR: no se pudo actualizar $SETTINGS"
    fi
  else
    echo "  Omitiendo hooks de zellij-attention."
  fi
else
  echo "  (Saltando hooks de zellij-attention: falta ~/.claude/settings.json o jq.)"
fi

echo "  Listo."
