#!/bin/bash

DATA=$(~/.config/waybar/scripts/temps.sh)

TEMP=$(echo "$DATA" | cut -d'|' -f2 | grep -oE '[0-9]+([.][0-9]+)?' | head -n1)

if [ -z "$TEMP" ]; then
    echo '{"text":"GPU --°C","class":"unknown"}'
    exit
fi

if (( $(awk "BEGIN {print ($TEMP >= 90)}") )); then
    CLASS="critical"
elif (( $(awk "BEGIN {print ($TEMP >= 80)}") )); then
    CLASS="warning"
else
    CLASS="normal"
fi

printf '{"text":"GPU %s°C","class":"%s","tooltip":"GPU temperature: %s°C"}\n' "$TEMP" "$CLASS" "$TEMP"
