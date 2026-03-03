# 主题系统模块

> [<- 返回根目录](../../CLAUDE.md)

## 概述

主题管理核心模块，负责一键切换 17 个主题，实现 Windows Terminal、Komorebi、Yasb、VSCode 的统一视觉体验。

主题来自 [yasb-themes marketplace](https://github.com/amnweb/yasb-themes)，Komorebi 使用 Catppuccin 配色系统。

## 文件结构

```
dot_rice-manager/
├── rice.sh              # 主题切换引擎（核心）
├── wallpaper.sh         # 壁纸切换脚本
├── wackground.ps1       # PowerShell 壁纸设置工具
└── rices/               # 主题配置目录（17 个）
    ├── everforest/      # 默认主题
    ├── gruvbox/
    ├── catppuccin/
    ├── comfyppuccin/
    ├── edgerunners/
    ├── dark_nord/
    ├── init_light/
    ├── elegance/
    ├── cosmic/
    ├── spectrum/
    ├── acrylic/
    ├── moonlit/
    ├── soft_segment/
    ├── fluent/
    ├── minimal/
    ├── aero_glass/
    └── pillbox/
```

## 核心脚本

### rice.sh

主题切换引擎，执行以下操作：

1. `set_desktop_wallpaper()` - 随机设置主题壁纸
2. `set_windows_terminal_theme()` - 更新终端配色和字体
3. `set_komorebi_theme()` - 更新 Komorebi Catppuccin 边框颜色/间距
4. `set_yasb_theme()` - 复制 config.yaml + styles.css 到 ~/.config/yasb/（Yasb 自动热重载）
5. `set_vscode_theme()` - 合并 VSCode 主题设置
6. `komorebic reload-configuration` - 重载 Komorebi 配置

**依赖：** jq（JSON 处理）

**关键变量：**
- `RICE_SETTING_FILE_PATH` - 主题 settings.json 路径
- `WT_SETTING_FILE_PATH` - Windows Terminal 配置路径
- `KOMOREBI_CONFIG_PATH` - Komorebi 配置路径
- `YASB_CONFIG` / `YASB_STYLES` - Yasb 配置路径

### wallpaper.sh

独立壁纸切换，允许使用其他主题的壁纸而不改变整体主题。

## 主题配置标准

每个主题目录必须包含：

```
<theme-name>/
├── settings.json              # 必需 - 核心配置（终端+Komorebi）
├── config.yaml                # 必需 - Yasb 配置（从 marketplace 下载）
├── styles.css                 # 必需 - Yasb 样式（从 marketplace 下载）
├── wallpapers/                # 必需 - 壁纸目录
│   └── *.jpg|*.png|*.jpeg
└── vscode-theme-settings.json # 可选 - VSCode 覆盖
```

### settings.json 格式

```json
{
  "windowsTheme": "dark|light",
  "windowsTerminalTheme": "配色方案名称",
  "windowsTerminalFont": {
    "face": "JetBrainsMono NF",
    "size": 12,
    "cellHeight": "1.2"
  },
  "komorebiConfig": {
    "borderWidth": 4,
    "borderStyle": "Rounded|Square",
    "workspacePadding": 4,
    "containerPadding": 4
  },
  "komorebiTheme": {
    "name": "Mocha|Macchiato|Latte",
    "single_border": "CatppuccinColor",
    "stack_border": "CatppuccinColor",
    "unfocused_border": "Surface0|Surface1"
  }
}
```

### Yasb config.yaml 要求

每个主题的 `config.yaml` 必须包含：

```yaml
watch_stylesheet: true    # 样式热重载
watch_config: true        # 配置热重载
```

bar 配置中必须设置：

```yaml
window_flags:
  windows_app_bar: true   # 自动预留 bar 空间
```

## 添加新主题

1. 从 [yasb-themes marketplace](https://github.com/amnweb/yasb-themes) 下载 `config.yaml` 和 `styles.css`
2. 在 `rices/` 下创建主题目录
3. 创建 `settings.json`（参考上述格式）
4. 添加壁纸到 `wallpapers/`
5. 确保 `config.yaml` 包含 `watch_config: true` 和 `watch_stylesheet: true`
6. 在 `rice.sh` 的 `availableThemes` 数组中添加主题名

```bash
# rice.sh 第 8 行
availableThemes=("everforest" "gruvbox" ... "your-new-theme")
```

## 常见问题

### jq 报错 "Could not open file"

**原因：** 路径变量未正确定义或路径包含空格未转义

**解决：** 确保使用双引号包裹路径变量

```bash
# 正确
jq -r '.key' "$RICE_SETTING_FILE_PATH"

# 错误
jq -r '.key' $RICE_SETTING_FILE_PATH
```

### 主题切换后 Yasb 未更新

**检查项：**
1. 确认 config.yaml 包含 `watch_config: true` 和 `watch_stylesheet: true`
2. 检查 Yasb 是否在运行：`tasklist | grep yasb`
3. 手动重启 Yasb：关闭后重新打开

### 主题切换后 Komorebi 配置未生效

**检查项：**
1. Komorebi 是否运行：`komorebic state`
2. 手动重载：`komorebic reload-configuration`
3. Windows Terminal 是否需要重启
