# ===========================================
# MSYS2/Zsh Setup Script
# ===========================================
# Configure MSYS2 and install Zsh plugins
# Run AFTER setup-environment.ps1
# ===========================================

Write-Host "=== MSYS2/Zsh Setup ===" -ForegroundColor Cyan

# --- Check MSYS2 installation ---
$msys2Path = "C:\msys64"

if (-not (Test-Path $msys2Path)) {
    Write-Host "ERROR: MSYS2 not found at $msys2Path" -ForegroundColor Red
    Write-Host "Please run install-packages.ps1 first and restart your computer." -ForegroundColor Yellow
    exit 1
}

Write-Host "`n[1/3] MSYS2 installation found." -ForegroundColor Green

# --- nsswitch.conf prompt ---
Write-Host "`n[2/3] nsswitch.conf configuration required" -ForegroundColor Yellow
Write-Host @"

IMPORTANT: Manual step required!

Edit file: C:\msys64\etc\nsswitch.conf

Change the line:
  db_home: /home

To:
  db_home: windows

This allows MSYS2 to use your Windows home directory.

Press any key to continue after editing nsswitch.conf...
"@ -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# --- Install Zsh plugins ---
Write-Host "`n[3/3] Installing Zsh plugins..." -ForegroundColor Yellow

$pluginsDir = "$env:USERPROFILE\.config\zsh\plugins"
New-Item -ItemType Directory -Force -Path $pluginsDir | Out-Null

$plugins = @(
    @{ Name = "zsh-autosuggestions"; Url = "https://github.com/zsh-users/zsh-autosuggestions" },
    @{ Name = "zsh-history-substring-search"; Url = "https://github.com/zsh-users/zsh-history-substring-search" },
    @{ Name = "fast-syntax-highlighting"; Url = "https://github.com/zdharma-continuum/fast-syntax-highlighting" }
)

foreach ($plugin in $plugins) {
    $pluginPath = Join-Path $pluginsDir $plugin.Name
    if (-not (Test-Path $pluginPath)) {
        git clone $plugin.Url $pluginPath 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  + $($plugin.Name)" -ForegroundColor Green
        } else {
            Write-Host "  ! Failed to clone $($plugin.Name)" -ForegroundColor Red
        }
    } else {
        Write-Host "  = $($plugin.Name) (exists)" -ForegroundColor Gray
    }
}

# --- MSYS2 first run setup ---
Write-Host "`n=== Additional MSYS2 Setup ===" -ForegroundColor Yellow
Write-Host @"

Open MSYS2 UCRT64 terminal and run:
  pacman -Syu
  pacman -S zsh git

Then set zsh as default shell:
  chsh -s /usr/bin/zsh

"@ -ForegroundColor Cyan

Write-Host "`n=== MSYS2/Zsh Setup Complete ===" -ForegroundColor Green
Write-Host "`nNext step: Run .\setup-wm-autostart.ps1" -ForegroundColor Cyan
