#!/bin/bash

# Rice script for Komorebi + Yasb with Catppuccin themes
# Komorebi: tiling window manager with Catppuccin border colors
# Yasb: status bar with hot-reload (watch_config + watch_stylesheet)

availableThemes=("everforest" "gruvbox" "catppuccin" "comfyppuccin" "edgerunners" "dark_nord" "sky_theme" "neos" "cosmic" "spectrum" "acrylic" "moonlit" "soft_segment" "fluent" "minimal" "proto" "pillbox")

usage() {
  printf "
Rice Script for Komorebi + Yasb

Usage:
$(basename $0)\t[everforest]    \t Everforest - deep green, natural tones
\t[gruvbox]       \t Gruvbox Material Dark - warm brown/yellow
\t[catppuccin]    \t Catppuccin Mocha - classic blue/purple
\t[comfyppuccin]  \t Comfyppuccin - cozy warm purple
\t[edgerunners]   \t Edgerunners - cyberpunk neon
\t[dark_nord]     \t Dark Nord - Nordic deep blue
\t[sky_theme]     \t Sky Theme - blue/yellow pastel, transparent
\t[neos]          \t Neos - clean minimal design
\t[cosmic]        \t Cosmic Bar - dynamic colorful
\t[spectrum]      \t Spectrum Symphony - warm rich tones
\t[acrylic]       \t Acrylic - frosted glass blue
\t[moonlit]       \t Moonlit Harmony - warm and deep
\t[soft_segment]  \t Soft Segment - segmented soft design
\t[fluent]        \t Fluent Design - Windows 11 style
\t[minimal]       \t minimal but productive - ultra minimal
\t[proto]         \t Proto - minimal productive theme
\t[pillbox]       \t Pillbox - pill-shaped layout
"
}

# Default komorebi.json for fresh installs
create_default_komorebi_config() {
  cat > "$1" <<'DEFAULT'
{
  "$schema": "https://komorebi.lgug2z.com/schema.json",
  "app_specific_configuration_path": "$Env:USERPROFILE/.config/komorebi/applications.json",
  "window_hiding_behaviour": "Cloak",
  "cross_monitor_move_behaviour": "Insert",
  "mouse_follows_focus": true,
  "default_workspace_padding": 4,
  "default_container_padding": 4,
  "global_work_area_offset": { "top": 0, "bottom": 0, "left": 0, "right": 0 },
  "border": true,
  "border_implementation": "Komorebi",
  "border_width": 4,
  "border_offset": -1,
  "border_style": "Rounded",
  "floating_applications": [
    { "kind": "Exe", "id": "QQ.exe", "matching_strategy": "Equals" },
    { "kind": "Exe", "id": "Weixin.exe", "matching_strategy": "Equals" },
    { "kind": "Exe", "id": "WeChatAppEx.exe", "matching_strategy": "Equals" },
    { "kind": "Title", "id": "QQ", "matching_strategy": "Contains" },
    { "kind": "Exe", "id": "WindowsTerminal.exe", "matching_strategy": "Equals" }
  ],
  "toggle_float_placement": "None",
  "float_rule_placement": "None",
  "stackbar": { "height": 40, "mode": "OnStack", "tabs": { "width": 300 } },
  "transparency": false,
  "transparency_alpha": 200,
  "animation": { "enabled": true, "duration": 200, "style": "EaseOutQuad", "fps": 60 },
  "theme": { "palette": "Catppuccin", "name": "Mocha", "single_border": "Green", "unfocused_border": "Surface0" },
  "display_index_preferences": { "0": "0", "1": "XN09C91J0DNL" },
  "monitors": [
    { "workspaces": [ { "name": "1", "layout": "BSP" }, { "name": "2", "layout": "BSP" }, { "name": "3", "layout": "BSP" }, { "name": "4", "layout": "BSP" }, { "name": "5", "layout": "BSP" } ] },
    { "workspaces": [ { "name": "6", "layout": "BSP" }, { "name": "7", "layout": "BSP" }, { "name": "8", "layout": "BSP" }, { "name": "9", "layout": "BSP" }, { "name": "0", "layout": "BSP" } ] }
  ]
}
DEFAULT
}

# Set Komorebi Catppuccin theme
set_komorebi_theme() {
  echo "Applying Komorebi theme..."
  KOMOREBI_CONFIG_PATH="$USERPROFILE/komorebi.json"
  RICE_SETTING_FILE_PATH="./rices/$theme/settings.json"

  # Create default config if komorebi.json doesn't exist (e.g. fresh install)
  if [ ! -f "$KOMOREBI_CONFIG_PATH" ]; then
    echo "  Creating default komorebi.json..."
    create_default_komorebi_config "$KOMOREBI_CONFIG_PATH"
  fi

  # Read komorebiTheme from settings.json
  theme_name=$(jq -r '.komorebiTheme.name // "Mocha"' "$RICE_SETTING_FILE_PATH")
  single_border=$(jq -r '.komorebiTheme.single_border // "Blue"' "$RICE_SETTING_FILE_PATH")
  stack_border=$(jq -r '.komorebiTheme.stack_border // "Green"' "$RICE_SETTING_FILE_PATH")
  unfocused_border=$(jq -r '.komorebiTheme.unfocused_border // "Surface0"' "$RICE_SETTING_FILE_PATH")

  # Read komorebiConfig from settings.json
  border_width=$(jq -r '.komorebiConfig.borderWidth' "$RICE_SETTING_FILE_PATH")
  border_style=$(jq -r '.komorebiConfig.borderStyle' "$RICE_SETTING_FILE_PATH")
  workspace_padding=$(jq -r '.komorebiConfig.workspacePadding' "$RICE_SETTING_FILE_PATH")
  container_padding=$(jq -r '.komorebiConfig.containerPadding' "$RICE_SETTING_FILE_PATH")

  echo "  Catppuccin: $theme_name"
  echo "  Borders: $single_border / $unfocused_border"
  echo "  Padding: ${workspace_padding}px"

  # Update komorebi.json with Catppuccin theme
  # IMPORTANT: border_implementation must be "Komorebi" for theme colors to work
  jq ".border_width = $border_width |
      .border_style = \"$border_style\" |
      .border_implementation = \"Komorebi\" |
      .default_workspace_padding = $workspace_padding |
      .default_container_padding = $container_padding |
      .theme = {
        \"palette\": \"Catppuccin\",
        \"name\": \"$theme_name\",
        \"single_border\": \"$single_border\",
        \"stack_border\": \"$stack_border\",
        \"unfocused_border\": \"$unfocused_border\"
      }" \
    "$KOMOREBI_CONFIG_PATH" > tmp.json && mv tmp.json "$KOMOREBI_CONFIG_PATH"

  echo "Komorebi config updated!"
}

# Set Yasb theme (hot-reload via watch_config + watch_stylesheet)
set_yasb_theme() {
  echo "Applying Yasb theme..."
  YASB_CONFIG="$USERPROFILE/.config/yasb/config.yaml"
  YASB_STYLES="$USERPROFILE/.config/yasb/styles.css"

  if [ -f "./rices/$theme/config.yaml" ]; then
    cp "./rices/$theme/config.yaml" "$YASB_CONFIG"
    cp "./rices/$theme/styles.css" "$YASB_STYLES"
    # Yasb watch_config + watch_stylesheet enables automatic hot-reload
    echo "Yasb theme applied!"
  else
    echo "Yasb config not found for $theme, skipping..."
  fi
}

# Set VSCode theme
set_vscode_theme() {
  echo "Applying VSCode theme..."
  vscode_settings="$USERPROFILE/AppData/Roaming/Code/User/settings.json"
  vscode_theme_settings="./rices/$theme/vscode-theme-settings.json"

  if [ -f "$vscode_theme_settings" ]; then
    echo "$(jq -s '.[0] * .[1]' "$vscode_theme_settings" "$vscode_theme_settings")" > tmp.json && mv tmp.json "$vscode_settings"
    echo "VSCode theme applied!"
  else
    echo "VSCode theme settings not found, skipping..."
  fi
}

# Set windows terminal theme
set_windows_terminal_theme() {
  echo "Applying windows terminal theme..."
  # Rice 配置文件路径（读取主题设置）
  RICE_SETTING_FILE_PATH="./rices/$theme/settings.json"
  # Windows Terminal 真正的 settings.json 路径
  WT_SETTING_FILE_PATH="$LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

  THEME_NAME=$(jq -r '.windowsTerminalTheme' "$RICE_SETTING_FILE_PATH")
  FONT_NAME=$(jq -r '.windowsTerminalFont.face' "$RICE_SETTING_FILE_PATH")
  FONT_SIZE=$(jq -r '.windowsTerminalFont.size' "$RICE_SETTING_FILE_PATH")
  FONT_CELL_HEIGHT=$(jq -r '.windowsTerminalFont.cellHeight' "$RICE_SETTING_FILE_PATH")

  echo "  Theme: $THEME_NAME"
  echo "  Font: $FONT_NAME"

  # 修改 Windows Terminal 配置
  jq ".profiles.defaults.colorScheme = \"$THEME_NAME\"" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"
  jq ".profiles.defaults.font.face = \"$FONT_NAME\"" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"
  jq ".profiles.defaults.font.size = $FONT_SIZE" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"

  if [ "$FONT_CELL_HEIGHT" != "null" ]; then
    jq ".profiles.defaults.font.cellHeight = \"$FONT_CELL_HEIGHT\"" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"
  fi

  echo "Windows terminal theme applied!"
}

# Change windows light/dark mode
change_windows_lightdark_mode() {
  echo "Changing windows color scheme..."
  WINDOWS_THEME=$(jq -r '.windowsTheme' ./rices/$theme/settings.json)
  if [ "$WINDOWS_THEME" == "dark" ]
    then powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value '0' -Type Dword -Force | Out-Null";
         powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value '0' -Type Dword -Force | Out-Null"
  elif [ "$WINDOWS_THEME" == "light" ]
    then powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value '1' -Type Dword -Force | Out-Null";
         powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value '1' -Type Dword -Force | Out-Null";
  else
    echo "Error: windows-theme must be light or dark"
    return 1
  fi
  echo "Restart explorer... (Taskbar might take sometime to show up)"
  powershell "taskkill /F /IM explorer.exe | Out-Null; start explorer"
  echo "Windows color scheme changed!"
}

# Set desktop wallpaper
set_desktop_wallpaper() {
  echo "Changing desktop wallpaper..."

  # Set Windows desktop wallpaper
  powershell ./wackground.ps1 ./rices/$theme/wallpapers --set-random
  echo "Desktop wallpaper changed!"
}

# Goes to this script location first
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

for theme in "${availableThemes[@]}"; do
  if [[ "$1" == "$theme" ]]; then
    echo "Applying $theme theme"
    echo " "

    # Apply configs (update all config files first, then reload once)
    set_desktop_wallpaper
    set_windows_terminal_theme
    set_komorebi_theme
    set_yasb_theme
    set_vscode_theme
    # change_windows_lightdark_mode # Disabled, currently too buggy

    # Reload Komorebi after config files are updated
    if komorebic state > /dev/null 2>&1; then
      echo "Reloading Komorebi..."
      if komorebic reload-configuration; then
        echo "Komorebi reloaded!"
      else
        echo "Warning: Komorebi reload failed"
      fi
    else
      echo "Warning: Komorebi is not running, skipping reload"
    fi

    echo " "
    echo "Theme changing completed!"

    exit 0
  fi
done

usage
