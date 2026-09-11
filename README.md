# Custom-Linux-Waybar — Nuclear Reactor HUD

<p align="center">
  <img src="waybar-preview.webp" alt="Green Nuclear Reactor Waybar preview" width="100%">
</p>

## Features

- ☢️ Nuclear reactor status indicator
- 🌡️ CPU & GPU temperatures
- 01–05 workspaces with clean indicators
- 🧰 System tray
- 🕒 Clock
- ⏻ Power menu
- 🌐 Network status
- 🎙️ Microphone status
- 🔗 VPN status
- 🔊 Volume with percentage indicator

Portable dotfiles for the green nuclear-reactor Waybar setup.

This package contains the **Waybar setup only**.

## Install

```bash
git clone https://github.com/marcottejkevin-art/Custom-Linux-Waybar.git
cd Custom-Linux-Waybar
bash install.sh
pkill waybar 2>/dev/null || true
waybar >/tmp/waybar.log 2>&1 &
```

The installer backs up an existing `~/.config/waybar` before replacing it and marks the installed helper scripts executable.

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
waybar-preview.webp
```

## Nuclear Rofi Theme

The Waybar theme is designed to pair with a matching **nuclear-green Rofi launcher**: black/dark background, radioactive green text, thin green borders, and a subtle green glow.

### 1. Install Rofi

On CachyOS / Arch:

```bash
sudo pacman -S rofi
```

### 2. Create the Rofi theme directory

```bash
mkdir -p ~/.config/rofi
```

Create the theme:

```bash
nano ~/.config/rofi/nuclear.rasi
```

Use the following:

```rasi
configuration {
    modi: "drun,run,window";
    show-icons: true;
    display-drun: "APPS";
    display-run: "RUN";
    display-window: "WINDOWS";
}

* {
    bg: #030a03;
    bg-alt: #071407;
    green: #39ff14;
    green-dark: #123d0d;
    text: #b6ff9c;
    border: #39ff14;
    font: "JetBrainsMono Nerd Font 12";
}

window {
    width: 700px;
    border: 2px;
    border-color: @border;
    border-radius: 10px;
    background-color: @bg;
    padding: 25px;
}

mainbox {
    children: [ inputbar, listview ];
    spacing: 15px;
}

inputbar {
    children: [ prompt, entry ];
    background-color: @bg-alt;
    border: 1px;
    border-color: @border;
    border-radius: 6px;
    padding: 10px;
}

prompt {
    text-color: @green;
    padding: 0 10px 0 0;
}

entry {
    text-color: @text;
    placeholder: "SEARCH...";
    placeholder-color: #238f16;
}

listview {
    columns: 1;
    lines: 8;
    spacing: 5px;
}

element {
    padding: 10px;
    border-radius: 5px;
}

element normal {
    text-color: @text;
}

element selected {
    background-color: @green;
    text-color: @bg;
}

element-text {
    text-color: inherit;
}

element-icon {
    size: 28px;
}
```

### 3. Launch the nuclear Rofi theme

```bash
rofi -show drun -theme ~/.config/rofi/nuclear.rasi
```

### 4. Add it to Hyprland

Add a keybind to `~/.config/hypr/hyprland.conf`:

```ini
bind = SUPER, R, exec, rofi -show drun -theme ~/.config/rofi/nuclear.rasi
```

Then reload Hyprland:

```bash
hyprctl reload
```

### Theme design

The Rofi theme follows the same visual language as the Waybar:

- ☢️ `#39ff14` nuclear-green accent
- 🖥️ `#030a03` near-black background
- 🟢 `#071407` dark green panels
- ✨ High-contrast green-on-black appearance
- 🔲 Thin green borders and rounded panels
- 🔤 JetBrainsMono Nerd Font for matching typography

This keeps the launcher and Waybar visually consistent as one **Nuclear Reactor Hyprland theme**.

## Uninstall

```bash
bash uninstall.sh
```

## GitHub

Repository name: `Custom-Linux-Waybar`

The repository name is intentionally not hard-coded into the installer, so the dotfiles can be cloned from any fork or renamed repository.
