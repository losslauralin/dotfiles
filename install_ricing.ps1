# ===========================================
# Windows Ricing Installation Script
# ===========================================
# Main entry point for installing the complete
# Windows 11 desktop customization setup.
#
# Usage:
#   .\install_ricing.ps1              # Interactive mode
#   .\install_ricing.ps1 -All         # Run all steps
#   .\install_ricing.ps1 -Step 2      # Run specific step
# ===========================================

param(
    [switch]$All,
    [int]$Step
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ScriptsPath = Join-Path $ScriptDir "scripts"

# Script definitions
$Steps = @(
    @{ Name = "Install Packages"; Script = "install-packages.ps1"; RequiresRestart = $true },
    @{ Name = "Setup Environment"; Script = "setup-environment.ps1"; RequiresRestart = $false },
    @{ Name = "Setup MSYS2/Zsh"; Script = "setup-msys2-shell.ps1"; RequiresRestart = $false },
    @{ Name = "Setup WM Autostart"; Script = "setup-wm-autostart.ps1"; RequiresRestart = $false },
    @{ Name = "Install Rime Input Method"; Script = "install-rime.ps1"; RequiresRestart = $false }
)

function Write-Header {
    param([string]$Title)
    Write-Host "`n$Title" -ForegroundColor Cyan
    Write-Host ("=" * 50) -ForegroundColor DarkGray
}

function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]$currentUser
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Test-Scoop {
    return $null -ne (Get-Command scoop -ErrorAction SilentlyContinue)
}

# --- Main Menu ---
function Show-Menu {
    Write-Header "Windows Ricing Installer"

    Write-Host "`nAvailable steps:" -ForegroundColor Yellow
    for ($i = 0; $i -lt $Steps.Count; $i++) {
        $s = $Steps[$i]
        $restartNote = if ($s.RequiresRestart) { " [RESTART REQUIRED]" } else { "" }
        Write-Host "  [$($i + 1)] $($s.Name)$restartNote" -ForegroundColor White
    }
    Write-Host "  [A] Run All Steps" -ForegroundColor Green
    Write-Host "  [Q] Quit" -ForegroundColor Red
}

function Invoke-Step {
    param([int]$StepIndex)

    $stepInfo = $Steps[$StepIndex]
    $scriptPath = Join-Path $ScriptsPath $stepInfo.Script

    Write-Header "Step $($StepIndex + 1): $($stepInfo.Name)"

    if (-not (Test-Path $scriptPath)) {
        Write-Host "ERROR: Script not found: $scriptPath" -ForegroundColor Red
        return $false
    }

    try {
        & $scriptPath
        $success = $LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE
    } catch {
        Write-Host "ERROR: $_" -ForegroundColor Red
        $success = $false
    }

    if ($success -and $stepInfo.RequiresRestart) {
        Write-Host "`n*** RESTART REQUIRED ***" -ForegroundColor Yellow
        Write-Host "Please restart your computer and run this script again to continue." -ForegroundColor Yellow
        return "Restart"
    }

    return $success
}

# --- Pre-flight checks ---
Write-Header "Pre-flight Checks"

# Check PowerShell version
if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Host "ERROR: PowerShell 5.1 or later required" -ForegroundColor Red
    exit 1
}
Write-Host "[OK] PowerShell version: $($PSVersionTable.PSVersion)" -ForegroundColor Green

# Check scoop
if (-not (Test-Scoop)) {
    Write-Host "[MISSING] scoop is not installed" -ForegroundColor Red
    Write-Host "`nInstall scoop first:" -ForegroundColor Yellow
    Write-Host "  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Cyan
    Write-Host "  irm get.scoop.sh | iex" -ForegroundColor Cyan
    Write-Host "`nPress any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit 1
}
Write-Host "[OK] scoop is installed" -ForegroundColor Green

# Check execution policy
$policy = Get-ExecutionPolicy -Scope CurrentUser
if ($policy -eq "Restricted" -or $policy -eq "AllSigned") {
    Write-Host "[WARN] Execution policy may block scripts: $policy" -ForegroundColor Yellow
    Write-Host "  Run: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Cyan
}

# --- Run Steps ---
if ($All) {
    # Run all steps mode
    for ($i = 0; $i -lt $Steps.Count; $i++) {
        $result = Invoke-Step -StepIndex $i
        if ($result -eq "Restart") {
            exit 0
        }
        if (-not $result) {
            Write-Host "`nStep $($i + 1) failed. Please fix errors and retry." -ForegroundColor Red
            exit 1
        }
    }
    Write-Host "`n=== Installation Complete ===" -ForegroundColor Green
    exit 0
}

if ($Step -gt 0 -and $Step -le $Steps.Count) {
    # Run specific step
    Invoke-Step -StepIndex ($Step - 1)
    exit 0
}

# Interactive mode
while ($true) {
    Show-Menu
    $choice = Read-Host "`nSelect option"

    switch -Regex ($choice.ToUpper()) {
        "^[1-4]$" {
            $result = Invoke-Step -StepIndex ([int]$choice - 1)
            if ($result -eq "Restart") {
                exit 0
            }
        }
        "^A$" {
            for ($i = 0; $i -lt $Steps.Count; $i++) {
                $result = Invoke-Step -StepIndex $i
                if ($result -eq "Restart") {
                    exit 0
                }
                if (-not $result) {
                    Write-Host "`nStep $($i + 1) failed. Continue? (Y/n)" -ForegroundColor Yellow
                    $cont = Read-Host
                    if ($cont -eq "n") { exit 1 }
                }
            }
            Write-Host "`n=== Installation Complete ===" -ForegroundColor Green
            exit 0
        }
        "^Q$" {
            Write-Host "Exiting..." -ForegroundColor Gray
            exit 0
        }
        default {
            Write-Host "Invalid option: $choice" -ForegroundColor Red
        }
    }

    Write-Host "`nPress any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
