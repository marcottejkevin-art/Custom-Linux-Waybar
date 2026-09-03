# Custom-Linux-Waybar — Nuclear Reactor HUD

Portable dotfiles for the green nuclear-reactor Waybar setup.

This package contains the **Waybar setup only**. EWW and its scripts are intentionally excluded.

## Install

```bash
cd Custom-Linux-Waybar
./install.sh
pkill waybar 2>/dev/null || true
waybar >/tmp/waybar.log 2>&1 &
```

The installer backs up an existing `~/.config/waybar` before replacing it.

## Recommended Arch packages

```bash
sudo pacman -S waybar jq lm_sensors networkmanager network-manager-applet bluez bluez-utils blueman pavucontrol brightnessctl wlogout
```

Optional for the VPN module:

```bash
sudo pacman -S tailscale
```

## Dependencies used by the config

- Waybar
- Hyprland / `hyprctl` for workspace clicks
- `jq` for JSON custom modules
- `lm_sensors` / `sensors` for CPU temperatures
- `nvidia-utils` / `nvidia-smi` when using an NVIDIA GPU
- `wpctl` (WirePlumber) for microphone/audio controls
- NetworkManager / `nmcli` for network and fallback VPN status
- Tailscale for the preferred VPN toggle
- `pavucontrol` for the audio click action
- `brightnessctl` for brightness scrolling
- `blueman-manager` for Bluetooth
- `wlogout` for the power button
- JetBrainsMono Nerd Font for the intended appearance

## Portability

The temperature scripts do not hard-code the Ryzen 7 9800X3D or RTX 5080. They use `sensors` and `nvidia-smi`, so they should adapt to another compatible machine.

If the second machine has no NVIDIA GPU, the GPU script falls back to an `edge` sensor when one is available.

## Files

```text
.config/waybar/config.jsonc
.config/waybar/style.css
.config/waybar/scripts/
├── cpu-status.sh
├── gpu-status.sh
├── mic.sh
├── reactor.sh
├── temps.sh
└── vpn.sh
.config/waybar/tailscale.sh
.config/waybar/tailscale-toggle.sh
install.sh
uninstall.sh
README.md
```

## GitHub

Repository name: `Custom-Linux-Waybar`

The repository name is intentionally not hard-coded into the installer, so the dotfiles can be cloned from any fork or renamed repository.
