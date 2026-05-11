# 🍙 我的 Windows 11 桌面美化配置

是的，这是 **Windows**

![GitHub Release](https://img.shields.io/github/v/release/lossthannothing/dotfiles)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/lossthannothing/dotfiles/changeset-versioning.yml)
![GitHub License](https://img.shields.io/github/license/lossthannothing/dotfiles)
![Discord](https://img.shields.io/discord/1162030825290866698)

## 简介

### 🐚 原生 Shell 脚本 — 无需 WSL，无需虚拟化

在 Windows 上运行真正的 **shell 脚本**和 **Linux 命令**——无需 WSL，无需虚拟化。通过这个配置，你可以在不影响兼容性的情况下获得完整的类 Unix 脚本能力。

既然可以使用熟悉的 `.sh` 脚本，为什么要写 PowerShell 呢？而且如果你仍然需要 PowerShell？两者可以并行使用。就像同时拥有 Linux 的灵活性和 Windows 的易用性。

### ❤️ 为桌面美化和 Unix 爱好者打造

你是**桌面美化爱好者**还是**Unix 粉丝**，不得不使用 Windows 但又想念 Linux 的可定制性？不用再找了！这个仓库是专为 Windows 定制的我的桌面美化配置宝库。

### ⚙️ 自定义主题和配置

包含各种自定义主题、脚本和配置，旨在为你的 Windows 桌面带来与你喜爱的 Linux 配置相同的美观和功能性。

### ⚡ 即时主题切换

只需一键即可快速切换主题。即时、轻松地保持桌面新鲜感，与你的心情或偏好保持一致。

### 😍 转换你的 Windows 体验

深入探索，随心定制，将你的 Windows 环境变成一个精美的桌面美化杰作！

## 核心

- 终端: **Windows Terminal**
- Shell: **Zsh** (MSYS2)
- 平铺窗口管理器: **Komorebi**（默认布局：**Scrolling**，受 Niri 启发）
- 状态栏: **Yasb**（含内置 **whkd 快捷键弹窗** widget）
- 快捷键守护: **whkd**
- 包管理器: **Winget**
- Dotfiles 管理器: **Chezmoi**
- 提示符: **Starship**

## 🎨 主题

ℹ️ 注意：此 dotfiles 专为我的 1440p 屏幕配置，在小屏幕上内容可能会显得较大。建议以我的配置为基础，根据你的需求进行定制。

| ✨ jade |
| :---: |
| 一个有棱角的灵魂，怀旧温暖，无言的力量 |
|![jade-1](rice-previews/jade-1.png)|
|![jade-2](rice-previews/jade-2.png)|

| ✨ wasabi |
| :---: |
| 神秘而迷人 |
|![wasabi-1](rice-previews/wasabi-1.png)|
|![wasabi-2](rice-previews/wasabi-2.png)|

| ✨ aqua |
| :---: |
| 充满好奇心和魅力 |
|![aqua-1](rice-previews/aqua-1.png)|
|![aqua-2](rice-previews/aqua-2.png)|

| ✨ shuri |
| :---: |
| 紫色中的温柔存在 |
|![shuri-1](rice-previews/shuri-1.png)|
|![shuri-2](rice-previews/shuri-2.png)|

## ⚙️ 当前可配置设置

你可以在 ~/.rice-manager/rices 中自定义每个主题并重新应用（见下文**切换主题**）

- ☑️ Windows Terminal 主题
- ☑️ Komorebi 边框主题
- ☑️ Yasb 主题
- ☑️ 基于 rice 的桌面壁纸
- ☑️ Vscode 主题
- ~~☑️ Windows 浅色/深色模式~~ ❌ 已禁用
- ❓ 基于 rice 的 Windows 颜色
- 🚧 *施工中*

## 📑 基本使用

### 切换主题

- 在终端中使用命令：`rice <theme-name>`（例如：`rice aqua`）
- 壁纸从主题的壁纸文件夹中随机选择。
- 使用 `rice` 查看帮助。

### 切换壁纸

- 在终端中使用命令：`wallpaper <theme-name>`（例如：`wallpaper aqua`）
- 这将仅更换壁纸，允许你使用其他主题的壁纸。
- 壁纸从选定主题的壁纸文件夹中随机选择。

### 常用快捷键

> 布局说明：所有工作区默认使用 **Scrolling**（Niri 风格滚动布局），10 个工作区都挂在同一个 monitor 配置项下（komorebi v0.1.40 限制：接入多个物理显示器时 scrolling 自动 fallback 到 columns；下方跨显示器快捷键在接副屏时仍可用）。

#### 焦点 & 移动

| 按键 | 功能 |
|:-|:-|
|<kbd>alt</kbd> + <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd>| 聚焦左 / 下 / 上 / 右 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd>| 移动窗口 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>[</kbd> / <kbd>]</kbd>| 循环聚焦上一个 / 下一个窗口 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>enter</kbd>| 提升窗口（promote） |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>r</kbd>| 重新平铺 |

#### 堆叠（Stack）

| 按键 | 功能 |
|:-|:-|
|<kbd>alt</kbd> + <kbd>←</kbd> / <kbd>↓</kbd> / <kbd>↑</kbd> / <kbd>→</kbd>| 向方向堆叠窗口 |
|<kbd>alt</kbd> + <kbd>;</kbd>| 取消堆叠 |

#### 调整大小

| 按键 | 功能 |
|:-|:-|
|<kbd>alt</kbd> + <kbd>+</kbd> / <kbd>-</kbd>| 水平放大 / 缩小 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>+</kbd> / <kbd>-</kbd>| 垂直放大 / 缩小 |

#### 窗口状态

| 按键 | 功能 |
|:-|:-|
|<kbd>alt</kbd> + <kbd>t</kbd>| 切换浮动 |
|<kbd>alt</kbd> + <kbd>f</kbd>| 切换最大化 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>f</kbd>| 切换 monocle 模式 |
|<kbd>alt</kbd> + <kbd>v</kbd>| 切换分割方向 |
|<kbd>alt</kbd> + <kbd>q</kbd>| 关闭窗口 |
|<kbd>alt</kbd> + <kbd>m</kbd>| 最小化窗口 |

#### 布局

| 按键 | 功能 |
|:-|:-|
|<kbd>alt</kbd> + <kbd>c</kbd> / <kbd>shift</kbd> + <kbd>c</kbd>| 循环切换布局：下一个 / 上一个 |
|<kbd>alt</kbd> + <kbd>x</kbd> / <kbd>y</kbd>| 水平 / 垂直翻转布局 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>s</kbd>| 当前工作区切到 **Scrolling** 布局 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>b</kbd>| 当前工作区切到 **BSP** 布局（应急回退） |
|<kbd>alt</kbd> + <kbd>[</kbd>| Scrolling: 1 列（窗口占满屏宽） |
|<kbd>alt</kbd> + <kbd>]</kbd>| Scrolling: 3 列（更紧凑；默认 2 列） |

#### 工作区 & 显示器

| 按键 | 功能 |
|:-|:-|
|<kbd>alt</kbd> + <kbd>1</kbd>–<kbd>0</kbd>| 聚焦工作区 1–10 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>1</kbd>–<kbd>0</kbd>| 把当前窗口移到指定工作区 |
|<kbd>alt</kbd> + <kbd>d</kbd>| 切到上一次聚焦的工作区 |
|<kbd>alt</kbd> + <kbd>,</kbd> / <kbd>.</kbd>| 循环切到上一个 / 下一个显示器 |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>,</kbd> / <kbd>.</kbd>| 把当前窗口送到上一个 / 下一个显示器 |

#### WM 控制 & 启动器

| 按键 | 功能 |
|:-|:-|
|<kbd>alt</kbd> + <kbd>o</kbd>| 重载 whkd |
|<kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>o</kbd>| 重载 Komorebi 配置 |
|<kbd>alt</kbd> + <kbd>p</kbd>| 切换暂停 |
|<kbd>alt</kbd> + <kbd>i</kbd>| 切换 Komorebi 内部快捷键覆盖 |
|<kbd>alt</kbd> + <kbd>enter</kbd>| 打开 Windows Terminal |
|<kbd>alt</kbd> + <kbd>/</kbd>| 打开快捷键弹窗（也可点击 bar 上的 ⌨ 图标） |

ℹ️ 快捷键由 **whkd** 管理 - 查看 `$USERPROFILE/.config/whkdrc` 自定义。yasb 的 whkd widget 会自动解析此文件并渲染弹窗。

## 📦 逐步安装指南（100% 可用 - 最后测试 2025年5月16日）

### 安装前须知

- 这些安装步骤尚未完全验证，你可能会在任何步骤卡住，如果遇到问题，欢迎在 Discord 上给我发消息。
- 此 dotfiles 及其预览分辨率为 2560x1600，在较低分辨率下一切可能看起来更大。
- 这些安装步骤不会破坏你的 Windows，如果出现问题，你需要做的就是：
  - 通过 `install-packages.ps1` `winget uninstall ...` 所有已安装的包
  - 删除添加的计划任务
  - 删除 `~/.config` 中添加的配置文件
- 如果你刚全新安装 Windows 11，需要去 Microsoft Store 更新你的"App Installer"。否则 winget 将无法工作。
- 对于使用其他 Windows 11 版本的用户（如没有 Microsoft Store 的 IOT Enterprise LTSC）：
  - 首先下载最新版本的 winget：<https://aka.ms/getwinget>
  - 然后打开 Powershell 并运行：`Add-AppxPackage -Path <下载的 .msixbundle 路径>` 来安装 winget

### 安装字体

字体需要手动下载和安装*（Windows 计划允许从 winget 安装字体。敬请期待！）*：

- [Pixelcraft Nerd Font](https://github.com/jade-tam/Pixelcraft/releases)（请下载并使用 Nerd Font 版本）
- [Pixel Code](https://qwerasd205.github.io/PixelCode/)
- [Monofur Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Monofur.zip)
- [Space Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SpaceMono.zip)

### 安装 chezmoi 并应用 dotfiles

- 通过 Winget 安装 chezmoi：`winget install chezmoi`
- 关闭并重新打开终端以识别 chezmoi 命令。
- 初始化 chezmoi 并应用 dotfiles：`chezmoi init --apply lossthannothing`
- 如果你使用 Windows Terminal，你会注意到终端主题立即改变。

### 安装软件包

- chezmoi 应用 dotfiles 后，chezmoi 源文件夹可以在 `%userprofile%/.local/share/chezmoi` 中找到，`install-packages.ps1` 文件可以在 `scripts` 文件夹中找到（⚠️ 注意：Windows Terminal 现在默认打开 zsh shell，我们还没安装，所以如果尝试打开 Windows Terminal 会显示错误，让我们打开 Windows Powershell）
- 在 Windows 设置中启用允许执行 powershell 脚本：
![image](https://github.com/user-attachments/assets/2b9c84f2-56d5-46f6-8ced-6e030ca5e47a)
![image](https://github.com/user-attachments/assets/70a6666e-b4ff-4f03-8299-4fd5acb12797)
- 编辑 `install-packages.ps1`，注释掉不需要的包/应用（默认情况下，所有非必需包都已注释）
- ⚠️ 注意：如果已安装 komorebi 或 yasb，请在运行安装脚本前先卸载它们，这将确保版本正确。
- 使用 **Powershell** 运行 `install-packages.ps1` 脚本安装必要的包（⚠️ 注意：有时安装可能会失败，重新运行脚本以确保所有包都已安装）

### 添加新的环境变量

- 将 `%USERPROFILE%\.local\bin` 添加到 **Path** 变量（这是某些实用程序如 btop、colorscript 和 winfetch 被识别所需要的）：
  - ![image](https://github.com/user-attachments/assets/dd3884e0-47f0-4699-85c4-bd5f5114cd94)
  - ![image](https://github.com/user-attachments/assets/3ebc5056-5350-4f5f-b36e-144808a6a1e4)
  - ![image](https://github.com/user-attachments/assets/4ec1d277-7f2c-4592-846a-620770236620)
  - ![image](https://github.com/user-attachments/assets/41e70542-485c-4035-9169-bc0e6a8a9afb)

### 重启

- 完成上述所有操作后，重启电脑一次，以确保所有新程序路径和字体都已注册。

----------------------------

 *🚩 在通过 install-packages.ps1 安装 MSYS2 并重启电脑后继续下面的步骤*

### 更改 MSYS2 主目录

编辑文件 /c/msys64/etc/nsswitch.conf（C:\msys64\etc 中的文件 nsswitch.conf）中 "db_home" 的值为 "windows"

```
db_home: windows
```

这将设置 Windows 用户文件夹为默认主目录。否则 zsh 将看不到用户目录中的配置文件。

### 安装 Zsh

打开 **MSYS2 UCRT64** 并运行以下命令安装 zsh（提示：可以使用鼠标中键粘贴命令）

```
# 更新 pacman
pacman -Syu

# 打开 MSYS2 Ucrt64 并安装 ZSH
pacman -S zsh

```

打开 **Powershell**，从你的用户文件夹（例如：`C:\Users\JadeTam>`），运行以下命令安装 zsh 主题和配置

```
# 安装 Starship Prompt（替代 Powerlevel10k）
# 通过 winget 安装（推荐）
winget install --id Starship.Starship

# 或使用其他方式安装：
# - Chocolatey: choco install starship
# - Scoop: scoop install starship
# - Cargo: cargo install starship --locked

# 安装快速语法高亮插件

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ./.config/zsh/plugins/fast-syntax-highlighting

# 安装自动建议插件

git clone https://github.com/zsh-users/zsh-autosuggestions ./.config/zsh/plugins/zsh-autosuggestions

# 安装历史子字符串搜索插件

git clone https://github.com/zsh-users/zsh-history-substring-search ./.config/zsh/plugins/zsh-history-substring-search
```

**故障排除：** 如果 git 无法识别，请尝试关闭并重新打开 powershell 或检查是否通过运行 `install-packages.ps1` 安装了 git。

### 安装 VSCode 主题扩展

- 图标：[Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) - *我认为最好的图标包*
- 主题：
  - [Tinted VSCode](https://marketplace.visualstudio.com/items?itemName=TintedTheming.base16-tinted-themes) - *其他主题使用*
  - [Gruvbox Theme](https://marketplace.visualstudio.com/items?itemName=jdinhlife.gruvbox) - *Wasabi 主题使用*
  - [Everforest](https://marketplace.visualstudio.com/items?itemName=sainnhe.everforest) - *Jade 主题使用*
- 附加：
  - 要更改 vscode UI 字体，请使用此扩展：[Fonted](https://marketplace.visualstudio.com/items?itemName=degreat.fonted)
  - 要使 VSCode 窗口透明：<https://marketplace.visualstudio.com/items?itemName=s-nlf-fh.glassit>

### Windows 启动时自动启动 Komorebi & Yasb

- 为 **whkd** 和 **Komorebi** 创建启动脚本或快捷方式。
- 通过按 **Windows + R** 并输入 `shell:startup` 打开启动文件夹
- 添加以下快捷方式/脚本：
  - **whkd**（快捷键守护进程 - Komorebi 快捷键所必需）
  - **komorebic**（Komorebi CLI）
- Yasb 可以与 Komorebi 一起启动或单独管理。
- 示例启动命令（创建批处理文件或快捷方式）：
  ```
  start whkd
  komorebic start --await-frontend
  yasb
  ```

### 可选优化

<!---
- 禁用 windows 11 圆角：
  - 安装 windows 11 圆角设置：[win11-toggle-rounded-corners](https://github.com/oberrich/win11-toggle-rounded-corners)
-->
- 自动隐藏任务栏（以获得更多垂直空间）。
- 对于具有大量可用内存的系统，提高性能并减少磁盘利用率：
  - 使用 **Powershell** 运行 `scripts/high-ram-tuning.ps1`。
- 恢复旧上下文菜单（需要重启）：
  - 打开/运行 `scripts/Restore-old-context-menu.reg`。
<!---
- 修复终端光标打字时闪烁：（这仅适用于 Alacritty，当前版本使用 Windows Terminal）
  - 运行 `scripts/terminal-cursor-fix.sh`
  - 然后关闭并重新打开终端
-->
- 在电源计划设置中显示"最大 cpu 频率"，允许更改最大 cpu 频率以尝试降低温度和更稳定的机器 **（非常有用，强烈推荐用于笔记本）**：
  - 使用 **Powershell** 运行 `scripts/show-cpu-frequency-power-plan-setting.ps1`
  - 搜索 **"编辑电源计划" > 更改计划设置 > 更改高级电源设置 > 处理器电源管理 > 最大处理器频率**（运行脚本后显示，更改为首选频率）

### 其他信息

- Dotfiles 灵感来自 gh0stzk dotfiles：<https://github.com/gh0stzk/dotfiles>
- Food script by Xero：<https://github.com/xero/dotfiles>
