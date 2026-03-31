#!/bin/bash

# Wallpaper script - change wallpaper using any rice theme's wallpapers
# Usage: wallpaper <theme-name>

availableThemes=("everforest" "gruvbox" "catppuccin" "comfyppuccin" "edgerunners" "dark_nord" "sky_theme" "neos" "cosmic" "spectrum" "acrylic" "moonlit" "soft_segment" "fluent" "minimal" "proto" "pillbox")

usage() {
  printf "
Wallpaper Script - change desktop wallpaper from any rice theme

Usage:
$(basename $0)\t[everforest]     \t Everforest - deep green, natural tones
\t[gruvbox]        \t Gruvbox Material Dark - warm brown/yellow
\t[catppuccin]     \t Catppuccin Mocha - classic blue/purple
\t[comfyppuccin]   \t Comfyppuccin - cozy warm purple
\t[edgerunners]    \t Edgerunners - cyberpunk neon
\t[dark_nord]      \t Dark Nord - Nordic deep blue
\t[sky_theme]      \t Sky Theme - blue/yellow pastel
\t[neos]           \t Neos - clean minimal design
\t[cosmic]         \t Cosmic Bar - dynamic colorful
\t[spectrum]       \t Spectrum Symphony - warm rich tones
\t[acrylic]        \t Acrylic - frosted glass blue
\t[moonlit]        \t Moonlit Harmony - warm and deep
\t[soft_segment]   \t Soft Segment - segmented soft design
\t[fluent]         \t Fluent Design - Windows 11 style
\t[minimal]        \t minimal but productive - ultra minimal
\t[proto]          \t Proto - minimal productive theme
\t[pillbox]        \t Pillbox - pill-shaped layout
"
}

# Set desktop wallpaper
set_desktop_wallpaper() {
  powershell ./wackground.ps1 ./rices/$theme/wallpapers --set-random
}

# Goes to this script location first
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

for theme in "${availableThemes[@]}"; do
  if [[ "$1" == "$theme" ]]; then
    echo "Changing wallpaper to $theme theme's wallpaper..."

    # # Apply configs
    set_desktop_wallpaper

    echo "Completed!"
    exit 0
  fi
done

usage
