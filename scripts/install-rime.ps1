# ===========================================
# Rime (小狼毫 + 小鹤音形) 安装脚本
# ===========================================
# 自动克隆 rime-crane 仓库并创建软链接
# 由 chezmoi 在安装时调用
# ===========================================

$ErrorActionPreference = "Stop"

# 配置路径
$RimeCraneDir = "$env:USERPROFILE\.config\rime-crane"
$RimeConfigDir = "$env:APPDATA\Rime"
$RepoUrl = "https://github.com/kchen0x/rime-crane.git"

function Write-Header {
    param([string]$Title)
    Write-Host "`n$Title" -ForegroundColor Cyan
    Write-Host ("=" * 50) -ForegroundColor DarkGray
}

function Test-Admin {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]$identity
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# --- Main ---
Write-Header "Rime (小狼毫 + 小鹤音形) 安装"

# 检查 Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[错误] 未找到 Git，请先安装 Git" -ForegroundColor Red
    exit 1
}

# 1. 检查或克隆 rime-crane 仓库
Write-Host "`n[1/4] 检查 rime-crane 配置..." -ForegroundColor Yellow

if (Test-Path "$RimeCraneDir\.git") {
    Write-Host "  rime-crane 已存在，检查更新..." -ForegroundColor Gray
    Push-Location $RimeCraneDir
    try {
        git fetch origin
        $local = git rev-parse HEAD
        $remote = git rev-parse origin/HEAD
        if ($local -ne $remote) {
            Write-Host "  发现更新，正在拉取..." -ForegroundColor Gray
            git pull origin HEAD
        } else {
            Write-Host "  已是最新版本" -ForegroundColor Gray
        }
    } finally {
        Pop-Location
    }
} else {
    Write-Host "  克隆 rime-crane 仓库到 $RimeCraneDir..." -ForegroundColor Gray
    if (Test-Path $RimeCraneDir) {
        Remove-Item -Recurse -Force $RimeCraneDir
    }
    $parentDir = Split-Path -Parent $RimeCraneDir
    if (-not (Test-Path $parentDir)) {
        New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
    }
    git clone --depth=1 $RepoUrl $RimeCraneDir
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[错误] 克隆仓库失败" -ForegroundColor Red
        exit 1
    }
}

# 2. 备份现有 Rime 配置
Write-Host "`n[2/4] 检查现有 Rime 配置..." -ForegroundColor Yellow

if ((Test-Path $RimeConfigDir) -and -not (Test-Path "$RimeConfigDir\..\Rime.backup*")) {
    # 检查是否是软链接
    $item = Get-Item $RimeConfigDir -ErrorAction SilentlyContinue
    if ($item -and $item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        Write-Host "  检测到现有软链接，跳过备份" -ForegroundColor Gray
    } else {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $backupDir = "$env:APPDATA\Rime.backup.$timestamp"
        Write-Host "  备份现有配置到 $backupDir..." -ForegroundColor Gray
        Move-Item $RimeConfigDir $backupDir
    }
} else {
    Write-Host "  无现有配置需要备份" -ForegroundColor Gray
}

# 3. 创建软链接
Write-Host "`n[3/4] 创建软链接..." -ForegroundColor Yellow

if (Test-Path $RimeConfigDir) {
    $item = Get-Item $RimeConfigDir -ErrorAction SilentlyContinue
    if ($item -and $item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        $target = $item.Target
        if ($target -eq $RimeCraneDir) {
            Write-Host "  软链接已正确配置" -ForegroundColor Gray
        } else {
            Write-Host "  更新软链接指向..." -ForegroundColor Gray
            Remove-Item $RimeConfigDir -Force
            New-Item -ItemType SymbolicLink -Path $RimeConfigDir -Target $RimeCraneDir | Out-Null
        }
    } else {
        Write-Host "  移除旧配置并创建软链接..." -ForegroundColor Gray
        Remove-Item -Recurse -Force $RimeConfigDir
        New-Item -ItemType SymbolicLink -Path $RimeConfigDir -Target $RimeCraneDir | Out-Null
    }
} else {
    Write-Host "  创建软链接: $RimeCraneDir -> $RimeConfigDir" -ForegroundColor Gray
    New-Item -ItemType SymbolicLink -Path $RimeConfigDir -Target $RimeCraneDir | Out-Null
}

# 4. 验证 xhup_dicts 目录
Write-Host "`n[4/4] 验证小鹤音形配置..." -ForegroundColor Yellow

if (Test-Path "$RimeCraneDir\xhup_dicts") {
    $dictCount = (Get-ChildItem "$RimeCraneDir\xhup_dicts" -File).Count
    Write-Host "  小鹤音形词库目录已找到 ($dictCount 个文件)" -ForegroundColor Green
} else {
    Write-Host "  警告: 未找到 xhup_dicts 目录" -ForegroundColor Yellow
    Write-Host "  小鹤音形可能无法正常工作，请检查仓库是否正确克隆" -ForegroundColor Yellow
}

# 完成
Write-Host "`n========================================" -ForegroundColor Green
Write-Host "  Rime 配置安装完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "`n下一步操作:" -ForegroundColor Cyan
Write-Host "  1. 重新部署小狼毫 (Weasel)" -ForegroundColor White
Write-Host "     右键任务栏图标 → 重新部署" -ForegroundColor Gray
Write-Host "  2. 切换到小鹤音形方案" -ForegroundColor White
Write-Host "     按 F4 或 Ctrl+` 选择方案" -ForegroundColor Gray
Write-Host "`n配置文件位置:" -ForegroundColor Cyan
Write-Host "  软链接: $RimeConfigDir" -ForegroundColor Gray
Write-Host "  仓库:   $RimeCraneDir" -ForegroundColor Gray
