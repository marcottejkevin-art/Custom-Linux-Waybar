#!/usr/bin/env bash
set -euo pipefail

TARGET="$HOME/.config/waybar"
if [[ -d "$TARGET" ]]; then
  rm -rf "$TARGET"
  echo "Removed $TARGET"
else
  echo "Nothing to remove: $TARGET does not exist."
fi
