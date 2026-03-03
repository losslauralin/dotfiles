# 🍙 My Ricing Dotfiles for Windows 11

Yes it's **Windows**

![GitHub Release](https://img.shields.io/github/v/release/lossthannothing/dotfiles)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/lossthannothing/dotfiles/changeset-versioning.yml)
![GitHub License](https://img.shields.io/github/license/lossthannothing/dotfiles)
![Discord](https://img.shields.io/discord/1162030825290866698)

## Introduction

### 🐚 Native Shell Scripting — No WSL, No Virtualization

Run real **shell scripts** and **Linux commands** natively on Windows — no WSL, no virtualization, no nonsense. With this setup, you get the full power of Unix-like scripting without sacrificing compatibility.

Why write PowerShell when you can use familiar ```.sh``` scripts? And if you still need PowerShell? You can run both side by side. It's like having the best of both worlds — the flexibility of Linux with the accessibility of Windows.

### ❤️ For the Ricing and Unixporn Enthusiasts

Are you **a ricing nerd** or **a unixporn enthusiast** who has to use Windows but still misses the customizability of Linux? Look no further! This repository is a treasure trove of my ricing dotfiles tailored specifically for Windows.

### ⚙️ Custom Themes and Configurations

It includes a variety of custom themes, scripts, and configurations designed to bring the same level of aesthetic appeal and functionality to your Windows desktop that you love from your Linux setups.

### ⚡ Instant Theme Switching

Easily switch themes on the fly with just one press. Keep your desktop fresh and aligned with your mood or preferences instantly and effortlessly.

### 😍 Transform Your Windows Experience

Dive in, tweak to your heart's content, and transform your Windows environment into a beautifully riced masterpiece!

## Core

- Terminal: **Windows Terminal**
- Shell: **Zsh** inside MSYS2
- Tiling Window Manager: **Komorebi** (default layout: **Scrolling**, Niri-inspired)
- Bar: **Yasb** (with built-in **whkd shortcuts popup** widget)
- Hotkey Daemon: **whkd**
- Package manager: **Winget**
- Dotfiles manager: **Chezmoi**
- Prompt: **Starship**

## 🎨 Themes

ℹ️Note: This dotfiles are configured specifically for my 1440p screen, so things might appear larger on smaller screens. I suggest using my dotfiles as a base and customizing it to fit your specific needs.

Themes from [yasb-themes marketplace](https://github.com/amnweb/yasb-themes), Komorebi uses Catppuccin color palette.

### Available Themes (17)

| Theme | Style | Description |
|-------|-------|-------------|
| `everforest` | Deep green | Default theme, Everforest style - natural, muted tones |
| `gruvbox` | Brown/yellow | Gruvbox Material Dark - warm retro colors |
| `catppuccin` | Blue/purple | Catppuccin Mocha - classic, soft colors |
| `comfyppuccin` | Warm purple | Comfyppuccin (Macchiato) - cozy and comfortable |
| `edgerunners` | Neon/cyber | Edgerunners - cyberpunk neon aesthetic |
| `dark_nord` | Deep blue | Dark Nord - Nordic inspired cool tones |
| `sky_theme` | Blue/yellow | Sky Theme - soft sky colors with transparency |
| `neos` | Clean/minimal | Neos - clean and minimal design |
| `cosmic` | Dynamic/colorful | Cosmic Bar - dynamic colorful appearance |
| `spectrum` | Warm/rich | Spectrum Symphony - warm rich tones |
| `acrylic` | Frosted glass | Acrylic - frosted glass blue effect |
| `moonlit` | Warm/deep | Moonlit Harmony - warm and deep colors |
| `soft_segment` | Segmented/soft | Soft Segment - segmented soft design |
| `fluent` | Win11 style | Fluent Design - Windows 11 native style |
| `minimal` | Ultra minimal | Minimal but productive - ultra minimal design |
| `proto` | Minimal | Proto - minimal productive theme |
| `pillbox` | Pill-shaped | Pillbox - pill-shaped layout design |

### Preview

*Theme previews coming soon - feel free to contribute screenshots!*

## ⚙️ Current Configurable Settings

You can customize each theme inside ~/.rice-manager/rices and re-apply it (see **Change theme** below)

- ☑️ Windows Terminal theme
- ☑️ Komorebi border theme
- ☑️ Yasb theme
- ☑️ Desktop wallpaper based on rice
- ☑️ Vscode theme
- ~~☑️ Windows light/dark mode~~ ❌ Disabled
- ❓ Windows color based on rice
- 🚧 *under construction*

## 📑 Basic usage

### Change theme

- From terminal use command: ```rice <theme-name>``` (example: ```rice aqua```)
- Wallpaper is selected randomize from rice's wallpaper folder.
- Use ```rice``` for helps.

### Change wallpaper

- From terminal use command: ```wallpaper <theme-name>``` (example: ```wallpaper aqua```)
- This will change the wallpaper only, allow you to use wallpaper from other themes.
- Wallpaper is selected randomize from selected rice's wallpaper folder.

### Useful keybindings

> Layout note: workspaces use **Scrolling** (Niri-style) by default — all 10 workspaces live on a single monitor entry (komorebi v0.1.40 limitation: scrolling falls back to columns when multiple physical monitors are attached; the cross-monitor shortcuts below still work once an external display is connected).

#### Focus & move

| Keys | Action |
|:-|:-|
|<kbd>alt</kbd> + <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd>| Focus window left / down / up / right |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd>| Move window |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>[</kbd> / <kbd>]</kbd>| Cycle focus previous / next |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>enter</kbd>| Promote window |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>r</kbd>| Retile |

#### Stack

| Keys | Action |
|:-|:-|
|<kbd>alt</kbd> + <kbd>←</kbd> / <kbd>↓</kbd> / <kbd>↑</kbd> / <kbd>→</kbd>| Stack window in direction |
|<kbd>alt</kbd> + <kbd>;</kbd>| Unstack |

#### Resize

| Keys | Action |
|:-|:-|
|<kbd>alt</kbd> + <kbd>+</kbd> / <kbd>-</kbd>| Horizontal increase / decrease |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>+</kbd> / <kbd>-</kbd>| Vertical increase / decrease |

#### Window state

| Keys | Action |
|:-|:-|
|<kbd>alt</kbd> + <kbd>t</kbd>| Toggle float |
|<kbd>alt</kbd> + <kbd>f</kbd>| Toggle maximize |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>f</kbd>| Toggle monocle |
|<kbd>alt</kbd> + <kbd>v</kbd>| Toggle split direction |
|<kbd>alt</kbd> + <kbd>q</kbd>| Close window |
|<kbd>alt</kbd> + <kbd>m</kbd>| Minimize window |

#### Layout

| Keys | Action |
|:-|:-|
|<kbd>alt</kbd> + <kbd>c</kbd> / <kbd>shift</kbd> + <kbd>c</kbd>| Cycle layout next / previous |
|<kbd>alt</kbd> + <kbd>x</kbd> / <kbd>y</kbd>| Flip layout horizontal / vertical |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>s</kbd>| Switch focused workspace to **Scrolling** layout |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>b</kbd>| Switch focused workspace to **BSP** layout (fallback) |
|<kbd>alt</kbd> + <kbd>[</kbd>| Scrolling: 1 visible column (full width) |
|<kbd>alt</kbd> + <kbd>]</kbd>| Scrolling: 3 visible columns (denser; default is 2) |

#### Workspaces & monitors

| Keys | Action |
|:-|:-|
|<kbd>alt</kbd> + <kbd>1</kbd>–<kbd>0</kbd>| Focus workspace 1–10 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>1</kbd>–<kbd>0</kbd>| Move window to that workspace |
|<kbd>alt</kbd> + <kbd>d</kbd>| Focus last workspace |
|<kbd>alt</kbd> + <kbd>,</kbd> / <kbd>.</kbd>| Cycle monitor previous / next |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>,</kbd> / <kbd>.</kbd>| Send window to previous / next monitor |

#### WM control & launchers

| Keys | Action |
|:-|:-|
|<kbd>alt</kbd> + <kbd>o</kbd>| Reload whkd |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>o</kbd>| Reload Komorebi configuration |
|<kbd>alt</kbd> + <kbd>p</kbd>| Toggle pause |
|<kbd>alt</kbd> + <kbd>i</kbd>| Toggle shortcuts (Komorebi internal) |
|<kbd>alt</kbd> + <kbd>enter</kbd>| Launch Windows Terminal |
|<kbd>alt</kbd> + <kbd>/</kbd>| Open keybindings popup (or click ⌨ icon on the bar) |

ℹ️ Keybindings managed by **whkd** - see `$USERPROFILE/.config/whkdrc` for customization. The yasb whkd widget auto-parses this file and renders the popup.

## 📦 Step by Step Installation (Working 100% - last tested 16/5/2025)

### Pre-install notices

- Those installation steps are not fully verified and you might stuck at any step, if you're having problem, feel free to message me on my discord.
- This dotfiles and it's previews are in 2560x1600 resolution, everything might look bigger on lower resolution.
- Those installation steps won't break your windows, in case things didn't go well, all you need to do are:
  - ```winget uninstall ...``` all packages you have installed through ```install-packages.ps1```
  - Remove added task scheduler tasks
  - Remove added config files in ```~/.config```
- If you have just fresh install windows 11, you need to go to Microsoft Store and update your "App Installer". Otherwise winget will not working.
- For those who use another windows 11 version (like IOT Enterprise LTSC, which doesn't come with Microsoft Store):
  - First download the latest version of winget: <https://aka.ms/getwinget>
  - Then open Powershell and run: ```Add-AppxPackage -Path <path to downloaded .msixbundle>``` to install winget

### Install Fonts

Font need to be download and install manually *(Windows is planning to allows installing fonts from winget. Stay tune!)*:

- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) (Required for 16/17 themes)
- [0xProto Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) (Required for `pillbox` theme)
- [Pixelcraft Nerd Font](https://github.com/jade-tam/Pixelcraft/releases) (Nerd Font version)
- [Pixel Code](https://qwerasd205.github.io/PixelCode/)
- [Monofur Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Monofur.zip)
- [Space Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SpaceMono.zip)

### Install chezmoi and apply dotfiles

- Install chezmoi from Winget with: ```winget install chezmoi```
- Close and reopen terminal for chezmoi command to be recognized.
- Initialize chezmoi and apply the dotfiles with: ```chezmoi init --apply lossthannothing```
- If you are using Windows Terminal, you will notice the terminal theme changed immediately.

### Install packages

- **Prerequisite: Install Scoop** (required for starship to avoid path space issues):
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
  ```
- After chezmoi apply the dotfiles, the chezmoi source folder could be found in ```%userprofile%/.local/share/chezmoi```, ```install-packages.ps1``` file can be found inside ```scripts``` folder (⚠️Note: Windows Terminal is now default open zsh shell which we haven't installed yet so it will show error if you try to open Windows Terminal, let's open Windows Powershell instead)
- Enable allow execute powershell script in windows settings:
![image](https://github.com/user-attachments/assets/2b9c84f2-56d5-46f6-8ced-6e030ca5e47a)
![image](https://github.com/user-attachments/assets/70a6666e-b4ff-4f03-8299-4fd5acb12797)
- Edit ```install-packages.ps1```, comment out packages/apps that are not needed (All non-required packages are commented by default)
- ⚠️ Note: If glazewm or zebar already installed, please uninstall them first before running the install script, this will make sure the versions are correct.
- Run ```install-packages.ps1``` script with **Powershell** to install nessesary packages (⚠️ Note: sometime installation could fail, re-run the script to ensure all packages has been installed)

### Add New Environment Variables

- Add ```%USERPROFILE%\.local\bin``` to **Path** variable (This is needed for some utilities like btop, colorscript and winfetch to be recognize):
  - ![image](https://github.com/user-attachments/assets/dd3884e0-47f0-4699-85c4-bd5f5114cd94)
  - ![image](https://github.com/user-attachments/assets/3ebc5056-5350-4f5f-b36e-144808a6a1e4)
  - ![image](https://github.com/user-attachments/assets/4ec1d277-7f2c-4592-846a-620770236620)
  - ![image](https://github.com/user-attachments/assets/41e70542-485c-4035-9169-bc0e6a8a9afb)

### Restart

- After everything above are done, restart the PC one time to make sure all new program paths and fonts are registered.

----------------------------

 *🚩 Continue below after MSYS2 has been installed through install-packages.ps1 and you have restarted the pc*

### Change MSYS2 home directory

Edit the "db_home"'s value to "windows" of file /c/msys64/etc/nsswitch.conf (file nsswitch.conf inside C:\msys64\etc)

```
db_home: windows
```

This will set windows user folder as default home directory. Otherwise zsh won't see it config file from user's directory.

### Install Zsh

Open **MSYS2 UCRT64** and run below command to install zsh (Tips: command can be pasted using middle mouse button)

```
# Update pacman
pacman -Syu

# Open MSYS2 Ucrt64 and install ZSH
pacman -S zsh

```

Open **Powershell**, from your user folder (Example: ```C:\Users\JadeTam>```), run below command to install zsh themes and configs

```
# Install Starship Prompt
# 推荐 scoop 安装（避免 winget 安装到 "Program Files" 导致 zsh init 路径空格问题）
scoop install starship

# 或使用其他方式安装：
# - Winget: winget install --id Starship.Starship（不推荐，有路径空格问题）
# - Chocolatey: choco install starship
# - Cargo: cargo install starship --locked

# Install Fast Syntax Highlighting Plugin

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ./.config/zsh/plugins/fast-syntax-highlighting

# Install Autosuggestions Plugin

git clone https://github.com/zsh-users/zsh-autosuggestions ./.config/zsh/plugins/zsh-autosuggestions

# Install History Substring Search Plugin

git clone https://github.com/zsh-users/zsh-history-substring-search ./.config/zsh/plugins/zsh-history-substring-search
```

**Troubleshoot:** If git is not recognizable, try close and reopen powershell or check whether git is installed through running ```install-packages.ps1``` or not.

### Install VS Code Extensions for Theming

- Icons: [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) - *best icon pack in my opinion*
- Themes:
  - [Tinted VSCode](https://marketplace.visualstudio.com/items?itemName=TintedTheming.base16-tinted-themes) - *using by other themes*
  - [Gruvbox Theme](https://marketplace.visualstudio.com/items?itemName=jdinhlife.gruvbox) - *using by gruvbox theme*
  - [Everforest](https://marketplace.visualstudio.com/items?itemName=sainnhe.everforest) - *using by everforest theme*
  - [Catppuccin](https://marketplace.visualstudio.com/items?itemName=Catppuccin.catppuccin-vsc) - *using by catppuccin, comfyppuccin themes*
- ADDITIONAL:
  - To change vscode UI Font, use this extension: [Fonted](https://marketplace.visualstudio.com/items?itemName=degreat.fonted)
  - To make VSCode window transparent: <https://marketplace.visualstudio.com/items?itemName=s-nlf-fh.glassit>

### Auto start Komorebi & Yasb at windows start

This is now handled automatically by `deploy.ps1`. The script creates a startup batch file in the Windows Startup folder.

If you need to manually configure:
- Open Start Up folder by pressing **Windows + R** and type in ```shell:startup```
- Create a batch file with:
  ```
  start whkd
  komorebic start --await-frontend
  yasb
  ```

### Optional Tweaks

<!---
- Disable windows 11 rounded corners:
  - Install windows 11 rounded corners setup: [win11-toggle-rounded-corners](https://github.com/oberrich/win11-toggle-rounded-corners)
-->
- Enable automatically hide the taskbar (for more vertical space).
- Improve performance and reduce disk utilization for system with high amount of free RAM:
  - Run ```scripts/high-ram-tuning.ps1``` with **Powershell**.
- Restore old context menu (Require restart):
  - Open/Run ```scripts/Restore-old-context-menu.reg```.
<!---
- Fix terminal cursor glitching while typing: (This is only working with Alacritty, current version using Windows Terminal)
  - Run ```scripts/terminal-cursor-fix.sh```
  - Close then re-open terminal
-->
- Show 'Max cpu freq' in power plan setting, allow changing maximum cpu freqency to attempt lower temperature and more stable machine **(Very useful, highly recommend for laptop)**:
  - Run ```scripts/show-cpu-frequency-power-plan-setting.ps1``` with **Powershell**
  - Search for **"Edit Power Plan" > Change Plan Settings > Change advanced power settings > Processor power management > Maximum processor frequency** (Showing after running the script, change this to preferred frequency)

### Other information

- Dotfiles inspired by gh0stzk dotfiles: <https://github.com/gh0stzk/dotfiles>
- Food script by Xero: <https://github.com/xero/dotfiles>
