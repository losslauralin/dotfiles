# ===========================================
# Window Manager Autostart Setup
# ===========================================
# Configure Komorebi + Yasb auto-start
# Run AFTER setup-msys2-shell.ps1
# ===========================================

Write-Host "=== Window Manager Autostart Setup ===" -ForegroundColor Cyan

# --- Check komorebi installation ---
if (-not (Get-Command komorebic -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: komorebic not found. Please run install-packages.ps1 first." -ForegroundColor Red
    exit 1
}

# --- Komorebi Autostart (without Bar) ---
Write-Host "`n[1/2] Setting up Komorebi autostart..." -ForegroundColor Yellow

try {
    komorebic enable-autostart --whkd 2>$null
    Write-Host "  + Komorebi autostart enabled (with whkd)" -ForegroundColor Green
} catch {
    Write-Host "  ! Failed to enable Komorebi autostart: $_" -ForegroundColor Red
}

# --- Yasb Autostart ---
Write-Host "`n[2/2] Setting up Yasb autostart..." -ForegroundColor Yellow

$startupFolder = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$yasbBatPath = "$startupFolder\yasb-startup.bat"

@"
@echo off
start "" "yasb"
"@ | Out-File -FilePath $yasbBatPath -Encoding ASCII -Force

if (Test-Path $yasbBatPath) {
    Write-Host "  + Yasb autostart created: $yasbBatPath" -ForegroundColor Green
} else {
    Write-Host "  ! Failed to create Yasb autostart bat" -ForegroundColor Red
}

# --- Summary ---
Write-Host "`n=== Autostart Setup Complete ===" -ForegroundColor Green
Write-Host @"

Autostart configuration:
  - Komorebi: Enabled (with whkd, no built-in bar)
  - Yasb: Enabled (via Startup folder bat)
  - Theme: Catppuccin (configured via komorebi.json)

The window manager and status bar will start automatically on next login.

"@ -ForegroundColor Cyan

Write-Host "`n=== ALL SETUP COMPLETE ===" -ForegroundColor Green
Write-Host @"

Final steps:
  1. Apply chezmoi dotfiles: chezmoi apply
  2. Restart Windows Terminal
  3. Switch theme: rice everforest

"@ -ForegroundColor Yellow
