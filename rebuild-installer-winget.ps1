
# Helper function: Check if Winget is installed
function Check-Winget {
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Display-And-Log "Winget is not installed on this system." "Yellow"
        Display-And-Log "Winget is required to proceed. Exiting script." "Red"
        Stop-Transcript
        exit
    } else {
        Display-And-Log "Winget is installed." "Green"
    }
}

# Helper function: Install selected software using Winget
function Install-Software-Winget {
    param (
        [array]$softwareList
    )

    if (-not $softwareList) {
        Display-And-Log "No software selected. Exiting." "Red"
        Stop-Transcript
        exit
    }

    Display-And-Log "`nInstalling selected software with Winget:" "Green"
    foreach ($software in $softwareList) {
        try {
            Display-And-Log "Installing $software..." "Yellow"
            winget install -e --id $software --silent --accept-source-agreements --accept-package-agreements
            if ($LASTEXITCODE -ne 0) {
                throw "Installation failed for $software with exit code $LASTEXITCODE"
            }
            Display-And-Log "$software installed successfully." "Green"
        } catch {
            Display-And-Log "Failed to install $software. Check the transcript for details." "Red"
            $errorMessage = $_.Exception.Message
            Log-Message "Error installing ${software}: ${errorMessage}"
            Log-Message "Full error record: $($_ | Out-String)"
        }
    }

    Display-And-Log "`nInstallation complete!" "Cyan"
}

# Main Script Logic
function Main-Winget {
    # Check if Winget is installed
    Check-Winget

    # Define package categories and software
    $packages = @{
        "Browsers and Networking" = @("Mozilla.Firefox", "Brave.Brave", "qBittorrent.qBittorrent", "WiresharkFoundation.Wireshark")
        "Archive Tools" = @("7zip.7zip")
        "Recording and Streaming" = @("OBSProject.OBSStudio", "ShareX.ShareX")
        "Multimedia" = @("Stremio.Stremio", "ThaUnknown.Miru", "VideoLAN.VLC")
        "Games" = @("Valve.Steam", "GOG.Galaxy", "ItchIo.Itch", "ATLauncher.ATLauncher")
        "Messaging" = @("Discord.Discord")
        "Development" = @("Git.Git", "KDE.Kate", "Neovim.Neovim", "Microsoft.VisualStudioCode", "Python.Python.3.11", "OpenJS.NodeJS", "Alacritty.Alacritty")
        "Office" = @("ONLYOFFICE.DesktopEditors", "KDE.Okular.Nightly")
        "Customization" = @("Rainmeter.Rainmeter", "IvoSoft.ClassicShell", "rocksdainster.LivelyWallpaper")
        "Other Tools" = @("Rufus.Rufus", "Microsoft.PowerToys", "AutoHotkey.AutoHotkey", "KeePassXCTeam.KeePassXC")
    }

    # Prompt user for full or custom install
    Display-And-Log "`nWelcome to the automated installer script (Winget version)!" "Cyan"
    Write-Host "1. Perform full install (all software)"
    Write-Host "2. Customize installation"
    $choice = Read-Host "Enter your choice (1 or 2)"
    switch ($choice) {
        "1" {
            # Full install: Install all software
            $allSoftware = $packages.Values | ForEach-Object { $_ } | Select-Object -ExpandProperty *
            Install-Software-Winget -softwareList $allSoftware
        }
        "2" {
            # Custom install: Display category and software menus
            $categories = $packages.Keys
            $defaultCategorySelection = @($true) * $categories.Count
            $selectedCategories = Display-Menu -title "Categories" -items $categories -enabledByDefault $defaultCategorySelection

            $selectedSoftware = @()
            foreach ($category in $selectedCategories) {
                $software = $packages[$category]
                $defaultSoftwareSelection = @($true) * $software.Count
                $selectedSoftware += Display-Menu -title "Software in $category" -items $software -enabledByDefault $defaultSoftwareSelection
            }

            Install-Software-Winget -softwareList $selectedSoftware
        }
        default {
            Display-And-Log "Invalid choice. Exiting." "Red"
            Stop-Transcript
            exit
        }
    }
}

# Run the main script logic for Winget
Main-Winget
