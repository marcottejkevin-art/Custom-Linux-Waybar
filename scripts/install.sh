#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$HOME/.config"
bash "$ROOT_DIR/scripts/link-dotfiles.sh"

chmod +x "$ROOT_DIR"/dotfiles/waybar/scripts/*.sh
chmod +x "$ROOT_DIR"/dotfiles/waybar/*.sh

echo
echo "☢ Nuclear Reactor dotfiles installed."
echo "Waybar:    ~/.config/waybar"
echo "Rofi:      ~/.config/rofi/nuclear.rasi"
echo "Hyprland:  ~/.config/hypr"
echo "Kitty:     ~/.config/kitty/kitty.conf"
echo "Fastfetch: ~/.config/fastfetch/config.jsonc"
echo "btop:      ~/.config/btop"
echo "wlogout:   ~/.config/wlogout"
echo
echo "Restart Waybar with: pkill waybar; waybar &"
