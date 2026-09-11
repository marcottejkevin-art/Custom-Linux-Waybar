#!/bin/bash

# Prefer Tailscale when installed; otherwise report NetworkManager VPN state.
if command -v tailscale >/dev/null 2>&1; then
    STATE=$(tailscale status --json 2>/dev/null | jq -r '.BackendState // empty')
    if [ "$STATE" = "Running" ]; then
        echo '{"text":"🔗 VPN ON","class":"online","tooltip":"Tailscale is ON — click to turn OFF"}'
    else
        echo '{"text":"🔗 VPN OFF","class":"offline","tooltip":"Tailscale is OFF — click to turn ON"}'
    fi
    exit 0
fi

if command -v nmcli >/dev/null 2>&1; then
    VPN=$(nmcli -t -f TYPE,NAME,STATE connection show --active 2>/dev/null | grep '^vpn:' | head -n1)
    if [ -n "$VPN" ]; then
        NAME=$(echo "$VPN" | cut -d: -f2)
        printf '{"text":"🔒 VPN ON","class":"online","tooltip":"VPN connected: %s"}\n' "$NAME"
    else
        echo '{"text":"🔓 VPN OFF","class":"offline","tooltip":"VPN disconnected"}'
    fi
    exit 0
fi

echo '{"text":"🔓 VPN --","class":"offline","tooltip":"No VPN backend detected"}'
