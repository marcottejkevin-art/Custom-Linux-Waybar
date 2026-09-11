#!/bin/bash

TEMPS="$("$HOME/.config/waybar/scripts/temps.sh")"

jq -cn \
  --arg temps "$TEMPS" \
  '{text: "<span size=\"18000\">☢</span> REACTOR ONLINE", class: "online", tooltip: $temps}'
