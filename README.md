# Windows Setup Script

An automated PowerShell script to quickly set up a fresh Windows installation with essential applications and optimizations.

## 🚀 Quick Start

Run this single command in Command Prompt or PowerShell to download and execute the script:

```cmd
powershell -Command "& {Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/cheekysim/winsetup/main/setup.ps1' -OutFile '$env:TEMP\setup.ps1'; & '$env:TEMP\setup.ps1'}" -ExecutionPolicy Bypass
```

## 📦 What Gets Installed

### Core Applications
- **Google Chrome** - Web browser
- **Discord** - Communication platform
- **Microsoft Visual Studio Code** - Code editor
- **Valve Steam** - Gaming platform
- **WhatsApp Desktop** - Messaging app

### Productivity Tools
- **Microsoft PowerToys** - Windows utilities collection
- **VLC Media Player** - Universal media player
- **Git** - Version control system
- **Spotify** - Music streaming
- **Telegram Desktop** - Messaging app

### Gaming Hardware
- **Logitech G HUB** - Logitech gaming peripherals software
- **HyperX NGenuity** - HyperX gaming peripherals software

## ⚙️ System Optimizations

### Dark Mode
Automatically configures Windows to use dark theme for:
- System UI elements
- Supported applications

### Bloatware Removal (Optional)
Removes unnecessary pre-installed Windows apps:
- Bing News & Weather
- Xbox apps and overlays
- Solitaire Collection
- Skype app
- Maps app
- Groove Music & Movies & TV
- Feedback Hub
- Get Help & Tips apps
- People app
- New Outlook
- Various game bloatware (CandyCrush, Disney games, etc.)

**Preserved apps:**
- Netflix
- Phone Link (Your Phone)
- Office Hub

### WSL Installation (Optional)
- Installs Windows Subsystem for Linux
- Sets up Debian distribution

## 🎯 Features

- **Automated Installation** - No manual downloads required
- **Interactive Prompts** - Choose what to install/remove
- **Error Handling** - Graceful failure recovery
- **Colored Output** - Clear visual feedback
- **Silent Installation** - Minimal user interaction during installs

## 🔧 Manual Installation

If you prefer to download and run locally:

1. Download `setup.ps1` from this repository
2. Run PowerShell as Administrator
3. Execute: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
4. Run the script: `.\setup.ps1`

## ⚠️ Requirements

- Windows 10/11
- Internet connection
- PowerShell 5.1 or newer
- Administrator privileges (for some installations)

## 🛡️ Security

- Uses official package managers (winget)
- Downloads from trusted sources only
- Temporary execution policy bypass (doesn't permanently change system settings)
- Open source - review the code before running

## 🤝 Contributing

Feel free to submit issues or pull requests to improve the script. Common improvements:
- Additional useful applications
- Bug fixes
- Performance optimizations
- Better error handling

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## ⚡ Troubleshooting

**Script won't run?**
- Ensure you're running as Administrator
- Check your internet connection
- Verify PowerShell version: `$PSVersionTable.PSVersion`

**App failed to install?**
- Some apps may require manual installation
- Check Windows Update is current
- Verify winget is installed: `winget --version`

**WSL installation failed?**
- Ensure virtualization is enabled in BIOS
- Run Windows Update
- Manually enable WSL: `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`

---

*This script is designed to save time on fresh Windows installations. Always review scripts before running them on your system.*
