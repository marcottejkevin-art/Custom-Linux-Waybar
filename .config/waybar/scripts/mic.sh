#!/bin/bash

MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null)

if echo "$MUTE" | grep -q MUTED; then
    printf '{"text":"󰍭 MIC OFF","class":"muted","tooltip":"Microphone muted"}\n'
else
    VOLUME=$(echo "$MUTE" | awk '{printf "%.0f", $2 * 100}')
    printf '{"text":"󰍬 MIC %s%%","class":"active","tooltip":"Microphone active: %s%%"}\n' "$VOLUME" "$VOLUME"
fi
