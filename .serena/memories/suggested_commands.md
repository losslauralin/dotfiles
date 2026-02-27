# 常用命令清单

## Chezmoi 操作

```bash
# 初始化并应用配置
chezmoi init --apply lossthannothing

# 应用配置变更
chezmoi apply

# 添加新文件到管理
chezmoi add <file>

# 获取源目录路径
chezmoi source-path
```

## 主题管理

```bash
# 切换完整主题
rice <theme-name>  # 示例: rice aqua

# 仅切换壁纸
wallpaper <theme-name>

# 查看帮助
rice
```

## 可用主题

| 主题名 | 风格 |
|--------|------|
| `jade` | 绿色系，默认主题 |
| `wasabi` | 蓝色系 |
| `aqua` | 水蓝色系 |
| `shuri` | 紫色系 |

## Zsh 别名

| 别名 | 命令 | 用途 |
|------|------|------|
| `cmsp` | `cd $(chezmoi source-path)/..` | 跳转到 chezmoi 源目录 |
| `update` | `winget upgrade --all && pacman -Syu` | 更新系统包 |
| `btop` | `~/.local/bin/btop/btop4win.exe` | 系统监控 |
| `ll` | `eza -l -a --icons ...` | 详细列表 |
| `winfetch` | `powershell winfetch` | 系统信息 |

## Windows/Powershell 脚本

```powershell
# 安装包
powershell ./scripts/install-packages.ps1

# 高内存调优
powershell ./scripts/high-ram-tuning.ps1

# 显示 CPU 频率设置
powershell ./scripts/show-cpu-frequency-power-plan-setting.ps1

# 恢复旧版右键菜单
.\scripts\Restore-old-context-menu.reg
```

## 工具

- `jq` - JSON 配置解析
- `yq` - YAML 配置解析
- `starship` - 提示符主题
- `eza` - 列表工具 (替代 ls)
- `fnm` - Node.js 版本管理

## GlazeWM 快捷键

| 按键 | 动作 |
|------|------|
| `Alt + Enter` | 打开终端 |
| `Alt + Space` | 打开 PowerToy Run |
| `Alt + h/j/k/l` | 聚焦窗口 左/下/上/右 |
| `Alt + Shift + h/j/k/l` | 移动窗口 左/下/上/右 |
| `Alt + Shift + q` | 关闭聚焦窗口 |
| `Alt + 1-0` | 聚焦工作区 {n} |
| `Alt + Shift + 1-0` | 移动窗口到工作区 {n} |
| `Alt + Shift + r` | 重载 GlazeWM 配置 |
| `Alt + Shift + e` | 退出 GlazeWM |
