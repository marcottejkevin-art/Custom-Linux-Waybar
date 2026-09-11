#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="$HOME/.config"

link_file() {
    local source="$1"
    local target="$2"
    local target_dir

    target_dir="$(dirname "$target")"
    mkdir -p "$target_dir"

    if [[ -e "$target" || -L "$target" ]]; then
        if [[ "$(readlink -f "$target" 2>/dev/null || true)" == "$source" ]]; then
            return
        fi
        local backup="${target}.backup-$(date +%Y%m%d-%H%M%S)"
        echo "Backing up $target -> $backup"
        mv "$target" "$backup"
    fi

    ln -s "$source" "$target"
    echo "Linked $target"
}

link_file "$ROOT_DIR/dotfiles/waybar/config.jsonc" "$CONFIG_DIR/waybar/config.jsonc"
link_file "$ROOT_DIR/dotfiles/waybar/style.css" "$CONFIG_DIR/waybar/style.css"
for script in "$ROOT_DIR"/dotfiles/waybar/scripts/*.sh; do
    link_file "$script" "$CONFIG_DIR/waybar/scripts/$(basename "$script")"
done
link_file "$ROOT_DIR/dotfiles/waybar/tailscale.sh" "$CONFIG_DIR/waybar/tailscale.sh"
link_file "$ROOT_DIR/dotfiles/waybar/tailscale-toggle.sh" "$CONFIG_DIR/waybar/tailscale-toggle.sh"

link_file "$ROOT_DIR/dotfiles/rofi/nuclear.rasi" "$CONFIG_DIR/rofi/nuclear.rasi"
link_file "$ROOT_DIR/dotfiles/hypr/hyprland.conf" "$CONFIG_DIR/hypr/hyprland.conf"
link_file "$ROOT_DIR/dotfiles/hypr/hyprlock.conf" "$CONFIG_DIR/hypr/hyprlock.conf"
link_file "$ROOT_DIR/dotfiles/hypr/hypridle.conf" "$CONFIG_DIR/hypr/hypridle.conf"
link_file "$ROOT_DIR/dotfiles/kitty/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"
link_file "$ROOT_DIR/dotfiles/fastfetch/config.jsonc" "$CONFIG_DIR/fastfetch/config.jsonc"
link_file "$ROOT_DIR/dotfiles/btop/btop.conf" "$CONFIG_DIR/btop/btop.conf"
link_file "$ROOT_DIR/dotfiles/btop/themes/nuclear.theme" "$CONFIG_DIR/btop/themes/nuclear.theme"
link_file "$ROOT_DIR/dotfiles/wlogout/layout" "$CONFIG_DIR/wlogout/layout"
link_file "$ROOT_DIR/dotfiles/wlogout/style.css" "$CONFIG_DIR/wlogout/style.css"
