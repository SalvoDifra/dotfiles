#!/bin/bash

# Controlla pacchetti ufficiali
# checkupdates fa parte di pacman-contrib
pacman=$(checkupdates 2>/dev/null | wc -l)

# Controlla pacchetti AUR
if command -v yay >/dev/null 2>&1; then
    aur=$(yay -Qua 2>/dev/null | wc -l)
else
    aur=0
fi

total=$((pacman + aur))

# Genera l'output JSON
if [ "$total" -gt 0 ]; then
    # Usiamo il newline reale dentro la variabile per il tooltip
    # Waybar lo interpreterà correttamente come riga successiva
    tooltip="📦 Pacman: $pacman
✨ AUR: $aur"

    jq -cn --arg text "󱑤  $total" --arg tooltip "$tooltip" '{"text": $text, "tooltip": $tooltip, "class": "pending"}'
else
    # Se il totale è 0, lo script non stampa nulla.
    # Waybar nasconde il modulo automaticamente se l'output è vuoto.
    exit 0
fi
