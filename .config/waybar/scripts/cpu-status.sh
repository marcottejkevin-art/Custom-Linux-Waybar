#!/bin/bash

DATA=$(~/.config/waybar/scripts/temps.sh)

TEMP=$(echo "$DATA" | cut -d'|' -f1 | grep -oE '[0-9]+([.][0-9]+)?' | head -n1)

if [ -z "$TEMP" ]; then
    echo '{"text":"CPU --°C","class":"unknown"}'
    exit
fi

if (( $(awk "BEGIN {print ($TEMP >= 90)}") )); then
    CLASS="critical"
elif (( $(awk "BEGIN {print ($TEMP >= 80)}") )); then
    CLASS="warning"
else
    CLASS="normal"
fi

printf '{"text":"CPU %s°C","class":"%s","tooltip":"CPU temperature: %s°C"}\n' "$TEMP" "$CLASS" "$TEMP"
