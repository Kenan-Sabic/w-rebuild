List of software in consideration for use on Windows split into categories with details explaining their use case, advantages and disadvantages
This is partially to ennumerate my options at every step and have a single place to consider all the options it doesn't mean that I use any piece of software on this list 
or that it is a good idea to run any.

# TABLE OF CONTENTS
1. [Networks](#networks)
2. [Productivity](#productivity)
3. [Multimedia](#multimedia)
4. [Graphics tools](#graphics-tools)
5. [Games](#games)
6. [Customization and UI](#customization-and-ui)
7. [System tools](#system-tools)


# NETWORKS

## Network scan:
1. [Nmap](https://nmap.org/) ([Modified GNU GPLv2](https://nmap.org/book/man-legal.html)) | [winget](https://winget.run/pkg/Insecure/Nmap) | [choco](https://community.chocolatey.org/packages/nmap)

## Speed Test:
1. [Speedtest CLI OOKLA](https://www.speedtest.net/apps/cli) ([Proprietary](https://www.speedtest.net/about/terms)) [winget](https://winget.run/pkg/Ookla/Speedtest.CLI) | [choco](https://community.chocolatey.org/packages/speedtest)

## Browsers:
1. [Firefox](https://www.mozilla.org/en-US/firefox/) ([MPL 2.0](https://www.mozilla.org/en-US/MPL/2.0/)) | [winget](https://winget.run/pkg/Mozilla/Firefox) | [MS Store](https://apps.microsoft.com/detail/9NZVDKPMR9RD?hl=en-us&gl=BA&ocid=pdpshare) | [choco](https://community.chocolatey.org/packages/Firefox) - great extensions, widely supported, great privacy, works out of the box
   
3. [Brave](https://brave.com/download/) ([MPL 2.0](https://github.com/brave/brave-browser/blob/master/LICENSE)) | [winget](https://winget.run/pkg/Brave/Brave) - chromium based; pros: privacy, ad-blocking, Chome extensions; cons: crypto wallet
4. [Falkon](https://www.falkon.org/) (GPL) [winget](https://winget.run/pkg/KDE/Falkon) - made by KDE, based on QTWebEngine which is based on chromium; pros: apparently light on resources, built-in adblock, portable; cons: no extensions
5. [Ungoogled Chromium](https://github.com/ungoogled-software/ungoogled-chromium-windows) (BSD 3-Clause License) | [winget](https://winget.run/pkg/eloston/ungoogled-chromium) - blocks google stuff, even the web store, needs configuration
6. [Opera](https://www.opera.com/features) ([Proprietary](https://www.opera.com/eula/computers/row)) | [winget](https://winget.run/pkg/Opera/Opera) - chromium based, no comment
7. [Edge](https://www.microsoft.com/en-us/edge) (MIT kinda) | [winget](https://winget.run/pkg/Microsoft/Edge) - chromium based, comes installed on windows; pros: apparently best security, fancy microsoft integrations, already installed; cons: spyware, annoying ads
8. [OperaGX](https://www.opera.com/gx) ([Proprietary](https://www.opera.com/eula/computers/row)) | [winget](https://winget.run/pkg/Opera/OperaGX) | - chromium based, fancy UI; pros: lots of builtin features, can limit resource use
9. [Chrome](https://www.google.com/intl/en_us/chrome) (Proprietary) | [winget](https://winget.run/pkg/Google/Chrome) - lots of fancy google integrations; pros: pretty good security, wide support; cons: spyware, can't block ads on it well
10. [Tor Browser](https://www.torproject.org/) (BSD-3-Clause) | [winget](https://winget.run/pkg/TorProject/TorBrowser) - firefox based, access blocked sites, privacy

## Email Client:
1. [Thunderbird](https://www.thunderbird.net/en-US/) | [MPLv2](https://www.mozilla.org/en-US/MPL/2.0/) | [winget](https://winget.run/pkg/Mozilla/Thunderbird)

## Torrent Clients:
1. [Qbittorrent](https://www.qbittorrent.org/) | ([GPLv3](https://github.com/qbittorrent/qBittorrent/blob/master/COPYING)) | [winget](https://winget.run/pkg/qBittorrent/qBittorrent) |
2. [Transmission](https://transmissionbt.com/) | ([GPLv3](https://github.com/transmission/transmission/blob/main/COPYING)) | [winget](https://winget.run/pkg/Transmission/Transmission)
3. [Deluge](https://deluge-torrent.org/) | ([GPLv3](https://git.deluge-torrent.org/deluge/tree/LICENSE)) | [winget](https://winget.run/pkg/DelugeTeam/Deluge)

## Messaging clients:
1. [Discord](https://discord.com/) | (Proprietary) | [winget](https://winget.run/pkg/Discord/Discord)  - rather buggy with self-updating sometimes
2. [Discord canary](https://discord.com/) (Proprietary) | [winget](https://winget.run/pkg/Discord/Discord.Canary)  
3. [Whatsapp](https://www.whatsapp.com/) (Proprietary) | [winget](https://winget.run/pkg/WhatsApp/WhatsApp)
4. [Viber](https://www.viber.com/en/) (Proprietary)  | [winget](https://winget.run/pkg/Viber/Viber)
5. [Telegram](https://desktop.telegram.org/) (GNU-3.0-only) | [winget](https://winget.run/pkg/Telegram/TelegramDesktop)
6. [Signal](https://www.signal.org/) (GPLv3) | [winget](https://winget.run/pkg/OpenWhisperSystems/Signal)
7. [Session](https://getsession.org/) (GNU GPL v3) | [winget]

## Network Monitoring Tools:
1. Wireshark (GNU GPLv2) - best network monitoring ; available on winget

## Remote Desktop:
1. Anydesk (Proprietary) - very easy to set up for both client and serverm doesn't need install and widely supported on many devices, can be rather buggy and lose connection ;available on winget
2. TeamViewer (Proprietary) - works alright, requires account ;available on winget
3. Remote Desktop Connection (windows builtin) - uses RDP which is very performant but proprietary microsoft tech, works pretty good with other windows devices, can self host.
4. RustDesk (AGPL-3.0-only) - nice self hosting option, have yet to use this one.
5. TigerVNC (GNU General Public License v2.0) - pretty easy to use, uses VNC which is widely supported across devices. Used it to config raspberry pi.

## SSH Client:
1. PuTTY (MIT) - used for SSH for a long time, lot of people swear by it.
2. OpenSSH client (builtin)

## FTP Client:
1. WinSCP (GPL) - two column file management with plenty of FTP and SCP options, integrates with putty and follows system theme, has tabs. Seems pretty good and lots of options.
2. ffftp (BSD-2-Clause License) - a bit uglier than WinSCP but familiar layout. Lots of options and features
3. FileZilla (GPLv2) - easy to use, pretty nice interface but not available on winget. On the upside it is on choco and can check for its own updates.

## File Share:
1. OnionShare
2. magic-wormhole


## VPN
1. Radmin VPN
2. Mullvad VPN
3. LogMeIn Hamachi
4. ZeroTier One
5. WireGuard
6. Tailscale
7. Mozilla VPN

## Download Managers:
1. Persepolis 
2. JDownloader
3. Vividl
4. YT-DLP

# PRODUCTIVITY
Archive Tools:
1. 7zip
2. Nanazip
3. Peazip

## Office suites:
1. Microsoft Office
2. LibreOffice
3. OnlyOffice
4. Google office suites

## Learning:
1. Anki

## PDF Viewer/Editors:
1. Okular
2. Sumatra PDF
3. Foxit

## Text Editors:
1. Kate
2. VSCode
3. Visual Studio
4. VSCodium
5. Notepad++
6. GNU Emacs
7. CodeBlocks

## Tex/LaTeX editors:
1. Kile
2. TeXStudio
3. Texmaker

## Version Control:
1. Git

## Difference Checker/Comparer/Merger:
1. KDiff3

## Data science/Statistics/Machine Learning tools:
1. Weka
2. Anaconda3
3. Miniconda3

## Calculator:
1. Qalculate!
2. Calculator (Builtin app)
3. Hamic (For Ham radio)
4. SpeedCrunch


# MULTIMEDIA
## Media Players (Video and audio):
1. VLC Player
2. MPV Player

## Audio Players:
1. foobar2000
2. Groove Music 
3. qmmp
4. Amarok

## Image Viewer:
1. JPEGView
2. Photos (Windows builtin)
3. ImageView
4. ImageGlass
5. PicView

## Video Streaming Clients:
1. Stremio
2. Miru
3. Popcorn-Time

## Music Streaming Clients:
1. Spotify

## Audio Editors:
1. Audacity

## Comic/Manga/Book Downloader:
1. HakuNeko
2. Libgen Desktop

# GRAPHICS TOOLS:
## Raster Graphics Editor:
1. GIMP
2. MS Paint
3. Aseprite
4. Libresprite
5. Krita

## Vector Graphics Editor:
1. Inkscape

## 3D Graphics:
1. Blender
2. MakeHuman

## Diagram/UML tools:
1. Umbrello 
2. StarUML
3. draw.io
4. Graphviz
5. Gnome Dia

## Video Editors:
1. KDenLive
2. OpenShot Video Editor


## Screen Recording:
1. OBS Studio

## Screenshot:
1. ShareX
2. Snipping tool
3. Greenshot

## Converters and transcoders:
1. HandBrake
2. VidCoder
3. FFMPEG
4. MKVToolNix

# GAMES
Gaming Platforms and Launchers:
1. Steam Client
2. GOG Galaxy
3. Steam CLI
4. Itch client
5. Epic Games Launcher
6. Newgrounds player
7. Flashpoint

## Minecraft Launchers: 
1. ATLauncher
2. Prism Launcher

## PSX Emulators:
1. Duckstation

## Flight Simulators:
1. FlightGear
2. Microsoft Flight Simulator

## Standalone Games:
1. Mindustry

# CUSTOMIZATION AND UI 
Wallpaper Tools:
1. Lively
2. Wallpaper engine

## Widget tools:
1. Rainmeter

## Taskbar customization:
1. TranslucentTB
2. Startallback
3. 7+ Taskbar Tweaker
5. Classic Shell

## Window Customization
1. Windhawk
2. Sizer (brianapps.net/sizer4)

## Search Customization:
1. BeautySearch

## Context Menu Tools:
1. Nilesoft Shell
2. File Converter

## Brightness Adjuster:
1. Twinkle Tray

## Volume Adjuster:
1. EarTrumpet

## Application Launcher:
1. ueli
2. Flow Launcher

## Terminal Emulator:
1. Windows Terminal
2. Powershell 
3. ExtraTerm
4. Alacritty (couldn't manage to get it to work)

## Temperature Monitors:
1. LibreHardwareMonitor

## Tiling Window Managers:
1. Komorebi
2. Workspacer
3. GlazeWM

# SYSTEM TOOLS
# Imaging Tools for OS installations:
1. Rufus
2. Balena Etcher
3. Raspberry Pi Imager 
4. Ventoy
5. AnyBurn (Proprietary) - disk burner

## Reverse engineering and memory analysis/editing:
1. Ghidra (Apache License 2.0 / Public domain) - 
2. Cheat Engine (Proprietary) - 
3. Resource Hacker ( )
4. CFF Explorer VIII
5. PE Detective 

## Hypervisors:
1. HyperV
2. Virtualbox
3. VMWare Workstation Pro

## Emulators:
1. Bluestacks (Android Emulator)
2. VICE (Commodore 64 emulator)
3. Neko Project 21/W (PC 98)
4. DosBox (DOS)
5. 86Box (X86 based computers)
6. martypc (IBM PC/XT)

## Password managers:
1. Bitwarden
2. KeepassXC
3. Keepass

## System Package Managers and patch managers:
1. Winget
2. Chocolatey
3. Microsoft store
4. WingetUI (GUI for Choco, Winget etc.)
5. Patch My PC
6. Ninite

## Service Managers:
1. NSSM

## Search Tools:
1. EverythingToolbar (A.K.A Everything)
   

## Backup Tools:
1. KopiaUI

## Encryption:
1. VeraCrypt
2. Bitlocker 

## Uninstaller:
1. BCUninstaller
2. Revo Uninstaller

## File Manager
1. Files
2. Dolphin

## Storage/disk tools:
1. WinDirStat
2. WizTree

## Backup tools:
1. Winhttrack

## RPA Tools:
1. Autohotkey
2. OpenRPA
3. BPMN-RPA Studio

## Hashing Utility
1. [Hasher](https://www.den4b.com/products/hasher) [CC-BY-NC-ND-3.0](https://www.den4b.com/license)
2. Certutil
3. [HashTools](https://www.binaryfortress.com/HashTools/) [Freeware](https://www.binaryfortress.com/WindowInspector/License/)

## Misc Tools:
1. Deskreen -AGPLv3 (Turn other devices like phones, tablets etc. into additional monitors)
2. Powertoys
3. SysInternals
4. bottom (tui process/system monitor)
5. Rich Copy
