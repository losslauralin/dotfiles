# 🔧 脚本工具模块

> 🧭 [← 返回根目录](../CLAUDE.md)

## 概述

Windows 安装和系统优化脚本集合，使用 PowerShell 编写。

## 脚本结构

```
chezmoi/
├── install_ricing.ps1           # 入口脚本（根目录）
└── scripts/
    ├── install-packages.ps1     # 1. 包安装
    ├── setup-environment.ps1    # 2. 环境变量
    ├── setup-msys2-shell.ps1    # 3. MSYS2/Zsh 配置
    ├── setup-wm-autostart.ps1   # 4. 窗口管理器自启动
    └── ...                      # 其他工具脚本
```

## 安装流程

### 方式一：交互式安装

```powershell
# 以普通用户身份运行
.\install_ricing.ps1
```

### 方式二：一键安装

```powershell
# 自动运行所有步骤
.\install_ricing.ps1 -All
```

### 方式三：单独运行步骤

```powershell
# 仅运行环境变量配置
.\install_ricing.ps1 -Step 2
```

## 脚本详解

### 1. install-packages.ps1

安装所有必需软件包：

| 包名 | 来源 | 用途 |
|------|------|------|
| Git.Git | winget | 版本控制 |
| Microsoft.WindowsTerminal | winget | 终端 |
| LGUG2Z.komorebi | winget | 平铺窗口管理器 |
| AmN.yasb | winget | 状态栏 |
| eza-community.eza | winget | ls 替代 |
| MikeFarah.yq | winget | YAML 处理 |
| jqlang.jq | winget | JSON 处理 |
| Microsoft.PowerToys | winget | 系统工具集 |
| MSYS2.MSYS2 | winget | Unix 工具链 |
| starship | scoop | 提示符主题 |

**注意：** starship 通过 scoop 安装，避免 winget 路径空格问题。

### 2. setup-environment.ps1

配置用户环境变量：
- 添加 `~/.local/bin` 到 PATH
- 验证核心工具安装

### 3. setup-msys2-shell.ps1

配置 MSYS2 和 Zsh：
- 检查 MSYS2 安装
- 提示用户编辑 nsswitch.conf
- 安装 Zsh 插件：
  - zsh-autosuggestions
  - zsh-history-substring-search
  - fast-syntax-highlighting

### 4. setup-wm-autostart.ps1

配置窗口管理器自启动：
- Komorebi: `komorebic enable-autostart --whkd`
- Yasb: 创建 `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\yasb-startup.bat`

## 执行顺序

```
1. install-packages.ps1  → 安装所有包
   ⚠️ 重启电脑（用户手动执行）
2. setup-environment.ps1 → 配置 PATH
3. setup-msys2-shell.ps1 → 配置 Zsh
4. setup-wm-autostart.ps1 → 配置自启动
   ⚠️ 重启终端
```

## 其他工具脚本

| 脚本 | 用途 |
|------|------|
| `high-ram-tuning.ps1` | 高内存（≥16GB）系统优化 |
| `show-cpu-frequency-power-plan-setting.ps1` | 解锁 CPU 频率控制选项 |
| `listing-font-details.ps1` | 列出已安装字体详情 |
| `Restore-old-context-menu.reg` | 恢复 Windows 11 经典右键菜单 |

## 执行策略

首次运行前需启用脚本执行：

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

或单次绕过：

```powershell
powershell -ExecutionPolicy Bypass -File ./script.ps1
```

## 故障排除

| 问题 | 解决方案 |
|------|----------|
| scoop not found | 运行 `irm get.scoop.sh \| iex` 安装 |
| 脚本无法运行 | 执行 `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` |
| 路径空格问题 | starship 已改用 scoop 安装 |
| Zsh 插件克隆失败 | 检查网络连接和 git 配置 |
