# w-rebuild
Collection of scripts I personally use to configure my fresh installations of windows (10, 11, Tiny11).
They are meant to automate the process of reinstalling and configuring all of the things I need on fresh installations of Windows as I found myself frequently reinstalling
operating systems and having to configure them manually would often take too long thus I created these scripts to help speed things along.

Here is a quick overview of scripts included:

-rebuild-installer.ps1 - installs software using chocolatey

-rebuild-updater.ps1 - updates software installed with chocolatey (run it on schedule)



-more to come...

### How to use scripts
Extract the zip. Open up powershell as administrator in the location where you put them and run this first 
```
Set-ExecutionPolicy Unrestricted
```
Afterwards you can type 
```
.\<nameOfScript>
```
and hit enter. 
After that just navigate them menus in scripts and let them run.

**DISCLAIMER: These scripts have been made for my personal use, I am in no way liable if your computer breaks 
because you ran some guy's script off the internet. Always be responsible with technology.**

Below you can find the sections going more in depth on each of the scripts

#Installer Script

The installer script is used to install a list of software using chocolatey, might make a winget version later too.
The software is split into categories and you are given the option of whether to install all of it or to customize your install.
The actual list of software and their package names are present in the file and you can open it up in any text editor
and add or remove whatever you wish. 
If you wish to add some other software to the script just look up the package names on 

https://community.chocolatey.org/packages 

The script also provides a transcript file each time it is run so you can check out if anything failed
spectacularly and try to figure out the problem. Some packages can break sometimes so do check out the package page
on chocolatey website to see if there is a solution, or just don't install the package.

As far as the installation of applications is concerned in most cases you can simply use the default windows installation for programs
through the GUI or you could try to uninstall the package through chocolatey. 

## Software Installed

## Browsers and network
Firefox

Brave

Filezilla

qBittorrent

Wireshark

## Archive Tools
7zip

## Recording
OBS Studio

ShareX

## Multimedia
Stremio

Miru

VLC Media Player

## Games
Steam

Gog Galaxy

itch (has some issues with silent installer, worked on windows 10, but not on 11)

Prism Launcher
## Messaging
Discord  (has issues with silent installer, apparently there is a fix)

## Development
Git

Kate

Neovim

Visual Studio Code

Python

NodeJS

MinGW-w64

Alacritty (had issues on where application couldn't open upon installation)

## Office
OnlyOffice Desktop

Okular

## Customization
Rainmeter

Winaero Tweaker  (had some issues with installation, might need to do it manually)

Classic Shell

TranslucentTB  (wouldn't install on windows 11, apparently hashes didn't match)

Lively
## Other tools
Rufus  (installs but can be hidden inside the bin directory of chocolatey inside ProgramData)

PowerToys

AutoHotkey

KeePassXC

# Winget installer version

Some packages seem to not work properly 

KDE.Okular.Nightly (replaced with KDE.Okular)

Lively (fails to install with script, install from microsoft store instead)

Alacritty (doesn't work here either)

# Different Windows Versions
The scripts were tested using VMs ran on HyperV, this has the effect of not having hybernation enabled by default, hybernation in my own testing using machines with around 16 to 20Gb of ram produces a hybernation f ile roughly the size of 6 to 10Gb.
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

Windows 10 after manually removing bloatware: 24.3Gb

##Windows 11
Windows 11 Fresh Install: 22Gb

Windows 11 After Updates: 27Gb

Windows 11 after manually removing bloatware: 26Gb

##Tiny 11 (made using Tiny11 builder script)
Tiny11 Fresh Install: 10Gb

Tiny11 After Updates: 16Gb

No bloat here :3

