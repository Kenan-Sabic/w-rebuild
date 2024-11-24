# Start Transcript
$transcriptPath = "$(Get-Location)\install_transcript_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').txt"
Start-Transcript -Path $transcriptPath

# Helper function: Display a message
function Display-And-Log {
    param (
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

# Helper function: Check if Chocolatey is installed
function Check-Chocolatey {
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Display-And-Log "Chocolatey is not installed on this system." "Yellow"
        $response = Read-Host "Would you like to install Chocolatey? (y/n)"
        if ($response -eq "y") {
            Install-Chocolatey
        } else {
            Display-And-Log "Chocolatey is required to proceed. Exiting script." "Red"
            Stop-Transcript
            exit
        }
    } else {
        Display-And-Log "Chocolatey is installed." "Green"
    }
}

# Helper function: Install Chocolatey
function Install-Chocolatey {
    Display-And-Log "Installing Chocolatey..." "Cyan"
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        Display-And-Log "Chocolatey installed successfully." "Green"
        Display-And-Log "Restarting PowerShell to refresh environment..."
        Start-Process powershell -ArgumentList "-NoProfile", "-ExecutionPolicy Bypass", "-File", $MyInvocation.MyCommand.Definition -Verb RunAs
        Stop-Transcript
        exit
    } catch {
        Display-And-Log "Failed to install Chocolatey. Exiting." "Red"
        Stop-Transcript
        exit
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

# Helper function: Install selected software
function Install-Software {
    param (
        [array]$softwareList
    )

    if (-not $softwareList) {
        Display-And-Log "No software selected. Exiting." "Red"
        Stop-Transcript
        exit
    }

    Display-And-Log "`nInstalling selected software:" "Green"
    foreach ($software in $softwareList) {
        try {
            Display-And-Log "Installing $software..." "Yellow"
            choco install $software -y
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
function Main {
    # Check if Chocolatey is installed
    Check-Chocolatey

    # Define package categories and software
    $packages = @{
        "Browsers and network" = @("firefox", "brave", "filezilla", "qbittorrent", "wireshark")
        "Archive Tools" = @("7zip")
        "Recording" = @("obs-studio", "sharex")
        "Multimedia" = @("stremio", "miru", "vlc")
        "Games" = @("steam", "goggalaxy", "prismlauncher")
        "Messaging" = @("discord")
        "Development" = @("git", "kate", "neovim", "vscode", "python", "nodejs", "mingw")
        "Office" = @("onlyoffice", "okular")
        "Customization" = @("rainmeter", "classic-shell", "lively")
        "Other tools" = @("rufus", "powertoys", "autohotkey", "keepassxc")
    }

    # Prompt user for full or custom install
    Display-And-Log "`nWelcome to the automated installer script!" "Cyan"
    Write-Host "1. Perform full install (all software)"
    Write-Host "2. Customize installation"
    $choice = Read-Host "Enter your choice (1 or 2)"
    switch ($choice) {
        "1" {
             # Full install: Install all software
                $allSoftware = $packages.Values | ForEach-Object { $_ } | ForEach-Object { $_ }
                Install-Software -softwareList $allSoftware
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

            Install-Software -softwareList $selectedSoftware
        }
        default {
            Display-And-Log "Invalid choice. Exiting." "Red"
            Stop-Transcript
            exit
        }
    }
}

# Run the main script logic
Main

# End the transcript
Stop-Transcript
