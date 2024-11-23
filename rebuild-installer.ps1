# Helper function: Check if Chocolatey is installed
function Check-Chocolatey {
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "Chocolatey is not installed on this system." -ForegroundColor Yellow
        $response = Read-Host "Would you like to install Chocolatey? (y/n)"
        if ($response -eq "y") {
            Install-Chocolatey
        } else {
            Write-Host "Chocolatey is required to proceed. Exiting script." -ForegroundColor Red
            exit
        }
    } else {
        Write-Host "Chocolatey is installed." -ForegroundColor Green
    }
}

# Helper function: Install Chocolatey
function Install-Chocolatey {
    Write-Host "Installing Chocolatey..." -ForegroundColor Cyan
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "Chocolatey installed successfully." -ForegroundColor Green
    Write-Host "Restarting PowerShell to refresh environment..."
    Start-Process powershell -ArgumentList "-NoProfile", "-ExecutionPolicy Bypass", "-File", $MyInvocation.MyCommand.Definition -Verb RunAs
    exit
}

# Helper function: Display a menu and return selection
function Display-Menu {
    param (
        [string]$title,
        [array]$items,
        [array]$enabledByDefault
    )

    Write-Host "`n$title" -ForegroundColor Cyan
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
                Write-Host "Invalid choice. Please select a valid number." -ForegroundColor Yellow
            }
        } else {
            Write-Host "Invalid input. Please try again." -ForegroundColor Yellow
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
        Write-Host "No software selected. Exiting." -ForegroundColor Red
        exit
    }

    Write-Host "`nInstalling selected software:" -ForegroundColor Green
    foreach ($software in $softwareList) {
        Write-Host "Installing $software..."
        choco install $software -y
    }

    Write-Host "`nInstallation complete!" -ForegroundColor Cyan
}

# Main Script Logic
function Main {
    # Check if Chocolatey is installed
    Check-Chocolatey

    # Define package categories and software
    $packages = @{
        "Browsers and network" = @("firefox", "qbittorrent")
        "Archive Tools" = @("7zip")
        "Recording" = @("obs-studio")
        "Multimedia" = @("stremio", "miru", "vlc")
        "Games" = @("steam", "goggalaxy", "itch", "prismlauncher")
        "Messaging" = @("discord")
        "Development" = @("git", "kate")
        "Office" = @("onlyoffice", "okular")
        "Customization" = @("rainmeter")
        "Other tools" = @("rufus", "powertoys", "autohotkey")
    }

    # Prompt user for full or custom install
    Write-Host "`nWelcome to the automated installer script!" -ForegroundColor Cyan
    Write-Host "1. Perform full install (all software)"
    Write-Host "2. Customize installation"
    $choice = Read-Host "Enter your choice (1 or 2)"
    switch ($choice) {
        "1" {
            # Full install: Install all software
            $allSoftware = $packages.Values | ForEach-Object { $_ }
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
            Write-Host "Invalid choice. Exiting." -ForegroundColor Red
            exit
        }
    }
}

# Run the main script logic
Main
