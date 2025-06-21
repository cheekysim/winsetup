# Windows App Setup Script
Write-Host "Installing applications..." -ForegroundColor Green

# Install native winget applications
$apps = @(
    "Google.Chrome",
    "Logitech.GHUB",
    "Discord.Discord",
    "Microsoft.VisualStudioCode",
    "Valve.Steam",
    "Microsoft.PowerToys",
    "VideoLAN.VLC",
    "Git.Git",
    "Spotify.Spotify",
    "Telegram.TelegramDesktop",
    "HyperX.NGenuity"
)

foreach ($app in $apps) {
    Write-Host "Installing $app..." -ForegroundColor Yellow
    winget install $app --silent --accept-package-agreements --accept-source-agreements
}

Write-Host ""
Write-Host "Installing Microsoft Store apps..." -ForegroundColor Green
Write-Host "Installing WhatsApp..." -ForegroundColor Yellow
winget install 9NKSQGP7F2NH --source msstore --silent --accept-package-agreements --accept-source-agreements

Write-Host ""
Write-Host "Setting Windows theme to dark mode..." -ForegroundColor Green
try {
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord
    Write-Host "Dark mode activated!" -ForegroundColor Green
} catch {
    Write-Host "Failed to set dark mode: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
$removeBloatware = Read-Host "Do you want to remove bloatware apps? (Y/N)"

if ($removeBloatware -match "^[Yy]") {
    Write-Host "Removing bloatware applications..." -ForegroundColor Green
    
    $bloatwareApps = @(
        "Microsoft.BingNews",
        "Microsoft.BingWeather",
        "Microsoft.GetHelp",
        "Microsoft.Getstarted",
        "Microsoft.MicrosoftSolitaireCollection",
        "Microsoft.People",
        "Microsoft.WindowsFeedbackHub",
        "Microsoft.Xbox.TCUI",
        "Microsoft.XboxApp",
        "Microsoft.XboxGameOverlay",
        "Microsoft.XboxGamingOverlay",
        "Microsoft.XboxIdentityProvider",
        "Microsoft.XboxSpeechToTextOverlay",
        "Microsoft.ZuneMusic",
        "Microsoft.ZuneVideo",
        "Microsoft.SkypeApp",
        "Microsoft.WindowsMaps",
        "Microsoft.OutlookForWindows"
    )
    
    foreach ($app in $bloatwareApps) {
        try {
            $package = Get-AppxPackage -Name $app -ErrorAction SilentlyContinue
            if ($package) {
                Write-Host "Removing $app..." -ForegroundColor Yellow
                Remove-AppxPackage -Package $package.PackageFullName -ErrorAction SilentlyContinue
            }
        } catch {
            Write-Host "Could not remove $app" -ForegroundColor Red
        }
    }
    
    # Remove game bloatware with wildcards
    $gamePatterns = @("*CandyCrush*", "*Disney*", "*MarchofEmpires*")
    foreach ($pattern in $gamePatterns) {
        try {
            $packages = Get-AppxPackage -Name $pattern -ErrorAction SilentlyContinue
            foreach ($package in $packages) {
                Write-Host "Removing $($package.Name)..." -ForegroundColor Yellow
                Remove-AppxPackage -Package $package.PackageFullName -ErrorAction SilentlyContinue
            }
        } catch {
            Write-Host "Could not remove packages matching $pattern" -ForegroundColor Red
        }
    }
    
    Write-Host "Bloatware removal completed." -ForegroundColor Green
} elseif ($removeBloatware -match "^[Nn]") {
    Write-Host "Skipping bloatware removal." -ForegroundColor Yellow
} else {
    Write-Host "Invalid input. Skipping bloatware removal." -ForegroundColor Red
}

Write-Host ""
$installWSL = Read-Host "Do you want to install WSL with Debian? (Y/N)"

if ($installWSL -match "^[Yy]") {
    Write-Host "Installing WSL and Debian..." -ForegroundColor Green
    try {
        wsl --install -d Debian
        Write-Host "WSL Debian installation completed." -ForegroundColor Green
    } catch {
        Write-Host "WSL installation failed: $($_.Exception.Message)" -ForegroundColor Red
    }
} elseif ($installWSL -match "^[Nn]") {
    Write-Host "Skipping WSL installation." -ForegroundColor Yellow
} else {
    Write-Host "Invalid input. Skipping WSL installation." -ForegroundColor Red
}

Write-Host ""
Write-Host "Setup complete!" -ForegroundColor Green
Read-Host "Press Enter to exit"
