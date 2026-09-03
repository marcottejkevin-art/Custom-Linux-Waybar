#!/bin/bash

STATE=$(tailscale status --json 2>/dev/null | jq -r '.BackendState')

if [ "$STATE" = "Running" ]; then
    echo '{"text":"🔗 VPN ON","class":"on","tooltip":"Tailscale is ON — click to turn OFF"}'
else
    echo '{"text":"🔗 VPN OFF","class":"off","tooltip":"Tailscale is OFF — click to turn ON"}'
fi
