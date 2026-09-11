#!/bin/bash

if tailscale status --json 2>/dev/null | jq -e '.BackendState == "Running"' >/dev/null; then
    tailscale down
else
    tailscale up
fi
