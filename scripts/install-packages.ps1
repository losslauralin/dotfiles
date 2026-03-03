# ===========================================
# Package Installation Script
# ===========================================
# Install all required packages via winget/scoop
# Run this script FIRST
# ===========================================

param(
    [switch]$SkipOptional
)

Write-Host "=== Package Installation ===" -ForegroundColor Cyan

# Check winget availability
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: winget not found. Please install App Installer from Microsoft Store." -ForegroundColor Red
    exit 1
}

# Check scoop availability
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: scoop not found. Please install scoop first:" -ForegroundColor Red
    Write-Host "  irm get.scoop.sh | iex" -ForegroundColor Yellow
    exit 1
}

# --- Core Packages ---
Write-Host "`n[1/2] Installing core packages via winget..." -ForegroundColor Yellow

$wingetPackages = @(
    @{ Id = "Git.Git"; Name = "Git" },
    @{ Id = "Microsoft.WindowsTerminal"; Name = "Windows Terminal" },
    @{ Id = "LGUG2Z.komorebi"; Name = "Komorebi" },
    @{ Id = "AmN.yasb"; Name = "Yasb" },
    @{ Id = "eza-community.eza"; Name = "eza" },
    @{ Id = "MikeFarah.yq"; Name = "yq" },
    @{ Id = "jqlang.jq"; Name = "jq" },
    @{ Id = "Microsoft.PowerToys"; Name = "PowerToys" },
    @{ Id = "MSYS2.MSYS2"; Name = "MSYS2" }
)

foreach ($pkg in $wingetPackages) {
    Write-Host "  Installing $($pkg.Name)..." -ForegroundColor Gray
    winget install --id $pkg.Id -e --silent --accept-package-agreements --accept-source-agreements
}

# --- Scoop Packages ---
Write-Host "`n[2/2] Installing packages via scoop..." -ForegroundColor Yellow

# starship via scoop to avoid winget path space bug in zsh init
scoop install starship

Write-Host "`n=== Package Installation Complete ===" -ForegroundColor Green
Write-Host "`nIMPORTANT: Restart your computer before continuing!" -ForegroundColor Yellow
Write-Host "After restart, run: .\setup-environment.ps1" -ForegroundColor Cyan
