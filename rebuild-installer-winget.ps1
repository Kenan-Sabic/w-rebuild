# Start Transcript
$transcriptPath = "$(Get-Location)\install_transcript_winget_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').txt"
Start-Transcript -Path $transcriptPath

# Helper function: Display a message
function Display-And-Log {
    param (
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

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

# Helper function: Display a menu and return selection
function Display-Menu {
    param (
        [string]$title,
        [array]$items,
        [array]$enabledByDefault
    )

    Display-And-Log "`n$title" "Cyan"
    $enabledItems = $enabledByDefault.Clone()
    $isDone = $false

    while (-not $isDone) {
        Write-Host "`nSelect items to exclude/include:"
        for ($i = 0; $i -lt $items.Count; $i++) {
            $status = if ($enabledItems[$i]) { "[X]" } else { "[ ]" }
            Write-Host "$($i + 1). $status $($items[$i])"
        }
        Write-Host "`nPress the number to toggle selection."
        Write-Host "Press Enter to confirm and proceed."

        $input = Read-Host "Your choice (number or Enter to finish)"
        if ([string]::IsNullOrWhiteSpace($input)) {
            $isDone = $true
        } elseif ($input -match '^\d+$') {
            $index = [int]$input - 1
            if ($index -ge 0 -and $index -lt $items.Count) {
                $enabledItems[$index] = -not $enabledItems[$index]
            } else {
                Display-And-Log "Invalid choice. Please select a valid number." "Yellow"
            }
        } else {
            Display-And-Log "Invalid input. Please try again." "Yellow"
        }
    }

    return $items | Where-Object { $enabledItems[$items.IndexOf($_)] }
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
        "Messaging" = @("Discord.Discord", "WhatsApp.WhatsApp")
        "Development" = @("Git.Git", "KDE.Kate", "Neovim.Neovim", "Microsoft.VisualStudioCode", "Python.Python.3.11", "OpenJS.NodeJS")
        "Office" = @("ONLYOFFICE.DesktopEditors", "KDE.Okular")
        "Customization" = @("Rainmeter.Rainmeter")
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
            $allSoftware = $packages.Values | ForEach-Object { $_ }
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
