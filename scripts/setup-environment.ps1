# ===========================================
# Environment Setup Script
# ===========================================
# Configure environment variables
# Run AFTER install-packages.ps1 and system restart
# ===========================================

Write-Host "=== Environment Setup ===" -ForegroundColor Cyan

# --- Add ~/.local/bin to PATH ---
Write-Host "`n[1/2] Adding ~/.local/bin to PATH..." -ForegroundColor Yellow

$localBin = "%USERPROFILE%\.local\bin"
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")

if ($userPath -notlike "*$localBin*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$localBin", "User")
    Write-Host "  + Added $localBin to PATH" -ForegroundColor Green
} else {
    Write-Host "  = $localBin already in PATH" -ForegroundColor Gray
}

# --- Verify core tools ---
Write-Host "`n[2/2] Verifying installed tools..." -ForegroundColor Yellow

$tools = @("git", "jq", "yq", "starship")
$missing = @()

foreach ($tool in $tools) {
    if (Get-Command $tool -ErrorAction SilentlyContinue) {
        Write-Host "  [OK] $tool" -ForegroundColor Green
    } else {
        Write-Host "  [MISSING] $tool" -ForegroundColor Red
        $missing += $tool
    }
}

if ($missing.Count -gt 0) {
    Write-Host "`nWARNING: Some tools not found in PATH. You may need to restart your terminal." -ForegroundColor Yellow
}

Write-Host "`n=== Environment Setup Complete ===" -ForegroundColor Green
Write-Host "`nNext step: Run .\setup-msys2-shell.ps1" -ForegroundColor Cyan
