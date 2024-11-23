# windows-rebuild
Scripts to automate reinstallation of packages I commonly use on full installations of windows (plenty of disk space)

The script uses Winget and Chocolatey (depending on the package) to install the software.


# Software Installed

## Browsers and network
Firefox


qBittorrent

## Archive Tools
7zip

## Recording
OBS Studio

## Multimedia
Stremio

Miru

VLC Media Player

## Games
Steam

Gog Galaxy

itch

Prism Launcher
## Messaging
Discord

## Development
Git


Kate

## Office
OnlyOffice Desktop

Okular

## Customization
Rainmeter


## Other tools
Rufus
PowerToys
AutoHotkey

#Different Windows Versions
The scripts were tested using VMs ran on HyperV, this has the effect of not having hybernation enabled by default, hybernation in my own testing using machines with around 16 to 20Gb of ram produces a file roughly the size of 6 to 8Gb.
On bare metal this file will be present by default increasing the size of all figures below by roughly 6 to 10Gb.


###Note about what is considered bloatware
Mentioned below are figures of systems with bloatware removed. Bloatware in my case includes the following default applications and features that I tend to remove on every one of my systems:

Applications:

3D Viewer

Alarms & Clock

Copilot

Cortana

Feedback Hub

Films & Tv

Groove Music

Mail & Calendar

Maps

Microsoft OneDrive

Microsoft Solitaire Collection

Office

OneNote

People

Skype

Sticky Notes

Voice Recorder

Weather

Xbox

Xbox Live

Microsoft Clipchamp

LinkedIn

Microsoft Todo

Mixed Reality Portal


Optional Features:

Internet Explorer 11

Maths Recognizer

Microsoft Quick Assist

Steps Recorder

Windows Fax and Scan

Windows Hello Face

Windows Media Player

WordPad


Other:

Settings -> Offline Maps -> Delete All Maps




So far in testing these are the disk space requirements for different windows versions:
##Windows 10
Windows 10 Fresh install: 20Gb

Windows 10 After updates: 26Gb

Disk size by removing bloatware: 24.3Gb

##Windows 11
Windows 11 Fresh Install:

Windows 11 After Updates:

##Tiny 11
Tiny11 Fresh Install:
Tiny11 After Updates:
