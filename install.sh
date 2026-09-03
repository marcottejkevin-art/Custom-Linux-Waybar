#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.config/waybar"
BACKUP="$HOME/.config/waybar.backup-$(date +%Y%m%d-%H%M%S)"

if [[ -d "$TARGET" ]]; then
  echo "Backing up existing Waybar config to: $BACKUP"
  cp -a "$TARGET" "$BACKUP"
fi

mkdir -p "$TARGET/scripts"
cp -a "$ROOT_DIR/.config/waybar/." "$TARGET/"
chmod +x "$TARGET/scripts/"*.sh "$TARGET/"*.sh 2>/dev/null || true

echo
printf '%s\n' 'Nuclear Waybar installed.'
echo "Config: $TARGET/config.jsonc"
echo "Style:  $TARGET/style.css"
echo
if command -v waybar >/dev/null 2>&1; then
  echo "Waybar detected. Restart it with: pkill waybar; waybar &"
else
  echo "Waybar is not installed. Install it with your distro package manager."
fi
