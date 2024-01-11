# VPN-and-Torrent-Management-Script
## Introduction
  This script provides an easy way to manage VPN and torrent client applications on a Windows system. It allows you to start or stop your VPN and torrent client, and set up custom paths for these applications.

## Requirements
  * Windows operating system
  * Basic understanding of file paths and command line usage
  * Installed VPN and torrent client applications

## Setup
### Script Folder:

  * The script uses a default folder at %USERPROFILE%\Documents\VPN_Torrent_Script.
  * If this folder doesn't exist, the script will create it.

### Setting File Paths:

  You need to specify the paths for your VPN and torrent client executables.
When you run the script for the first time, it will prompt you to enter these paths.

## Usage
### Running the Script:

  *  Open Command Prompt.
  * Navigate to the directory where the script is saved.
  * Run the script by typing its name and pressing Enter.

### Menu Options:
  * Start VPN: Closes the torrent client and starts the VPN.
  * Start Torrent Client: Closes the VPN and starts the torrent client.
  * Set Torrent Client: Allows you to set or change the path for the torrent client.
  * Sett VPN Client: Allows you to set or change the path for the VPN client.
  * Exit: Closes the script.

### Automating with Shortcuts:

#### Creating shortcuts:
  * Right-click on the script file.
  * Select Send to > Desktop (create shortcut).
  * Right-click on the new shortcut on your desktop and select Properties.
  * In the Target field, add **auto vpn** or **auto torrent** at the end of the path to create a shortcut that automatically starts either the VPN or the torrent client.
Here is example of Target field: C:\Users\%USERPROFILE%\Documents\VPN_Torrent_Script\Interactive_VPN&&Torrent_Script.bat **auto vpn**
#### Use existing shortcuts 
  Also, you can change target of existing shortcuts: write in search of windows your desired app name(or just select shortcut on desktop, depends on how you using them) and 

### Auto-Start with System:
To make the script run when your system starts:
  * Press Win + R, type shell:startup, and press Enter. This opens the Startup folder.
  * Move the previously created shortcut(s) to this folder.
  * The script will now run with the specified action (VPN or torrent) when you start your system.
