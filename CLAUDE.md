# CLAUDE.md

> 📅 Last updated: 2026-02-26

## 概述

Windows 11 桌面美化（ricing）配置仓库，使用 Chezmoi 管理 dotfiles。支持一键切换 11 个主题，实现跨应用（终端、窗口管理器、状态栏、VSCode）的统一视觉体验。

**核心工具栈：** Windows Terminal + Zsh (MSYS2) + Komorebi (平铺窗口管理器) + Yasb (状态栏) + Starship (提示符)

## 常用命令

```bash
# 主题切换
rice <theme-name>           # 切换完整主题
rice                        # 显示帮助和可用主题列表
wallpaper <theme-name>      # 仅切换壁纸（随机）

# Chezmoi 管理
chezmoi init --apply lossthannothing   # 初始化并应用 dotfiles
chezmoi add <file>              # 添加新配置到管理
chezmoi apply                   # 应用变更到系统
chezmoi diff                    # 查看待应用差异
chezmoi source-path             # 获取源目录路径
cmsp                            # 快捷别名：跳转到 chezmoi 源目录

# 窗口管理器
komorebic reload-configuration  # 重载 Komorebi 配置
komorebic state                 # 查看当前状态

# 系统
update                      # 更新 winget + pacman 包
btop                        # 系统监控
proxy / unproxy             # 代理开关
```

## 版本发布

```bash
npm run version-packages     # 使用 Changeset 更新版本号
npm run release              # 发布到 npm
```

## 架构概览

```
.chezmoiroot ──────────► .dotfile/     # Chezmoi 管理的配置模板
│
├── dot_rice-manager/    # 🎨 主题管理核心
│   ├── rice.sh          # 主题切换引擎
│   ├── wallpaper.sh     # 壁纸管理
│   ├── wackground.ps1   # PowerShell 壁纸设置
│   └── rices/           # 11 个主题配置目录
│       └── <theme>/
│           ├── settings.json              # 核心配置
│           ├── config.yaml                # Yasb 配置
│           ├── styles.css                 # Yasb 样式
│           ├── wallpapers/                # 壁纸目录
│           └── vscode-theme-settings.json # VSCode 覆盖 (可选)
│
├── dot_config/          # ⚙️ 应用配置
│   ├── komorebi/        # 窗口管理器 (komorebi.json, applications.yaml)
│   ├── yasb/            # 状态栏 (config.yaml, styles.css)
│   ├── starship.toml    # 提示符主题
│   ├── whkdrc           # 快捷键绑定
│   └── winfetch/        # 系统信息显示
│
├── dot_zshrc            # Zsh 配置
└── dot_local/bin/       # 📦 本地工具 (btop, winfetch, colorscript)
```

## 模块索引

| 模块 | 路径 | 说明 |
|------|------|------|
| [主题系统](.dotfile/dot_rice-manager/CLAUDE.md) | `.dotfile/dot_rice-manager/` | 主题切换引擎、添加新主题指南 |
| [安装脚本](scripts/CLAUDE.md) | `scripts/` | 包安装、系统优化脚本 |

## 可用主题（11 个）

| 主题 | 配色风格 | 描述 |
|------|----------|------|
| `jade` | 深绿/暖色 | 默认主题，Everforest 风格 |
| `wasabi` | 蓝色 | Gruvbox Dark |
| `aqua` | 水蓝 | Ayu Dark |
| `shuri` | 紫色 | Base16 Tinted |
| `arcade` | 霓虹 | 高对比游戏主题 |
| `julia` | 暖色 | Horizon Dark |
| `khanhoa` | 浅绿 | Catppuccin Latte (亮色) |
| `khlinh` | 深紫 | Tomorrow Night |
| `meimei` | 棕/黄 | Gruvbox Hard |
| `mtram` | 森林绿 | Everforest Dark |
| `tlinh` | 彩色 | Monokai Pro |

## 主题切换工作流

```
rice <theme-name>
  │
  ├─► 1. set_desktop_wallpaper()
  │      └── wackground.ps1 随机选择 wallpapers/ 中的壁纸
  │
  ├─► 2. set_windows_terminal_theme()
  │      └── jq 更新 colorScheme, font.face, font.size
  │
  ├─► 3. set_komorebi_config()
  │      └── jq 更新 border_colours, padding, work_area_offset
  │      └── komorebic reload-configuration
  │
  ├─► 4. set_yasb_theme()
  │      └── 复制 config.yaml + styles.css
  │      └── 重启 yasb 进程
  │
  └─► 5. set_vscode_theme()
         └── 合并 vscode-theme-settings.json
```

## 关键配置路径

| 配置 | 路径 |
|------|------|
| Windows Terminal | `$LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json` |
| Komorebi | `$USERPROFILE/.config/komorebi/komorebi.json` |
| Komorebi 应用规则 | `$USERPROFILE/.config/komorebi/applications.yaml` |
| Yasb | `$USERPROFILE/.config/yasb/{config.yaml,styles.css}` |
| VSCode | `$USERPROFILE/AppData/Roaming/Code/User/settings.json` |
| Rice Manager | `$USERPROFILE/.rice-manager/` |
| Starship | `$USERPROFILE/.config/starship.toml` |
| 快捷键 | `$USERPROFILE/.config/whkdrc` |

## Komorebi 快捷键 (whkdrc)

| 按键 | 功能 |
|------|------|
| `Alt + h/j/k/l` | 聚焦窗口 左/下/上/右 |
| `Alt + Shift + h/j/k/l` | 移动窗口 左/下/上/右 |
| `Alt + u/p` | 水平缩小/放大 |
| `Alt + i/o` | 垂直缩小/放大 |
| `Alt + v` | 切换分割方向 |
| `Alt + Shift + Space` | 切换浮动 |
| `Alt + t` | 切换平铺 |
| `Alt + f` | 切换最大化 |
| `Alt + Shift + q` | 关闭窗口 |
| `Alt + 1-0` | 聚焦工作区 1-10 |
| `Alt + Shift + 1-0` | 移动窗口到工作区 |
| `Alt + Shift + r` | 重载配置 |
| `Alt + Enter` | 打开终端 |

## 开发注意事项

1. **jq 依赖** - rice.sh 所有配置修改通过 jq 实现，路径变量必须用双引号包裹
2. **路径变量** - 使用 `$LOCALAPPDATA`、`$USERPROFILE` 而非硬编码路径
3. **新主题标准** - 必须包含 `settings.json`、`config.yaml`、`styles.css`、`wallpapers/`
4. **主题注册** - 新主题需在 `rice.sh` 第 6 行 `availableThemes` 数组中添加

## 故障排除

| 问题 | 检查项 |
|------|--------|
| jq 报错 "Could not open file" | 路径变量未用双引号包裹 |
| 主题切换后配置未生效 | `komorebic state` 检查运行状态；检查 yasb 进程 |
| 终端主题未更新 | Windows Terminal 可能需要重启 |
| Zsh 配置未加载 | 检查 MSYS2 `nsswitch.conf` 中 `db_home: windows` |
