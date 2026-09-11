#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$HOME/.config"

remove_link() {
    local path="$1"
    if [[ -L "$path" ]]; then
        rm "$path"
        echo "Removed $path"
    fi
}

remove_link "$CONFIG_DIR/waybar/config.jsonc"
remove_link "$CONFIG_DIR/waybar/style.css"
for path in "$CONFIG_DIR"/waybar/scripts/*.sh; do [[ -L "$path" ]] && remove_link "$path"; done
remove_link "$CONFIG_DIR/waybar/tailscale.sh"
remove_link "$CONFIG_DIR/waybar/tailscale-toggle.sh"
remove_link "$CONFIG_DIR/rofi/nuclear.rasi"
remove_link "$CONFIG_DIR/hypr/hyprland.conf"
remove_link "$CONFIG_DIR/hypr/hyprlock.conf"
remove_link "$CONFIG_DIR/hypr/hypridle.conf"
remove_link "$CONFIG_DIR/kitty/kitty.conf"
remove_link "$CONFIG_DIR/fastfetch/config.jsonc"
remove_link "$CONFIG_DIR/btop/btop.conf"
remove_link "$CONFIG_DIR/btop/themes/nuclear.theme"
remove_link "$CONFIG_DIR/wlogout/layout"
remove_link "$CONFIG_DIR/wlogout/style.css"

echo
echo "☢ Nuclear Reactor dotfile links removed."
echo "Backups created by the installer are left in place."
