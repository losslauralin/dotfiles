#!/bin/bash

# Rime (小狼毫 + 小鹤音形) 自动安装脚本
# 在 chezmoi init 时执行
# 调用 PowerShell 脚本完成实际配置

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POWERSHELL_SCRIPT="$SCRIPT_DIR/scripts/install-rime.ps1"

echo "[Rime] 开始配置 Rime 输入法..."

# 检查 PowerShell 脚本是否存在
if [[ ! -f "$POWERSHELL_SCRIPT" ]]; then
    echo "[Rime] 错误: 找不到 PowerShell 脚本: $POWERSHELL_SCRIPT"
    exit 1
fi

# 调用 PowerShell 脚本
if command -v pwsh &> /dev/null; then
    # 优先使用 PowerShell Core
    pwsh -ExecutionPolicy Bypass -File "$POWERSHELL_SCRIPT"
elif command -v powershell &> /dev/null; then
    # 回退到 Windows PowerShell
    powershell -ExecutionPolicy Bypass -File "$POWERSHELL_SCRIPT"
else
    echo "[Rime] 错误: 未找到 PowerShell"
    echo "[Rime] 请手动运行脚本: .\scripts\install-rime.ps1"
    exit 1
fi

if [[ $? -eq 0 ]]; then
    echo "[Rime] 配置完成！"
else
    echo "[Rime] 配置过程中出现错误"
    exit 1
fi
