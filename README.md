
# Mouse Battery Module Installation for Polybar

This guide will provide step-by-step instructions on how to install the mouse battery module in Polybar. This module will display the mouse battery level and indicate whether it is charging or not.

## Prerequisites

Before proceeding, make sure you have the following dependencies installed:

-   Polybar: A highly customizable status bar for Linux.
-   Solaar: A utility for managing Logitech devices.

### Installing Solaar

#### Ubuntu and Debian

To install Solaar on Ubuntu and Debian, follow these steps:

1.  Open a terminal.
    
2.  Update the package list by running the following command:
    
    `sudo apt update` 
    
3.  Install Solaar by running the following command:
    
    `sudo apt install solaar` 
    
4.  Solaar should now be installed on your system.
    

#### Arch Linux

To install Solaar on Arch Linux, follow these steps:

1.  Open a terminal.
    
2.  Update the package list by running the following command:
    
    `sudo pacman -Syu` 
    
3.  Install Solaar by running the following command:

    `sudo pacman -S solaar` 
    
4.  Solaar should now be installed on your system.
    

Make sure you have Polybar and Solaar installed and working correctly on your system before proceeding.

## Step 1: Create the module script

The first step is to create the mouse battery module script. You can follow the instructions below to create the script:

1.  Open a blank text editor.
2.  Copy the provided script content:

```sh
output=$(solaar show 2>/dev/null)

battery_percentage=$(echo "$output" | grep -oP 'Battery: \K\d+(?=%)' | head -1)
discharging=$(echo "$output" | grep -oP 'Battery: \d+%, \K\w+' | head -1)
discharging="${discharging^}"

if [ "$discharging" != "Discharging" ]; then
    echo "↑ $battery_percentage% "
else
    echo "↓ $battery_percentage% "
fi
```

3.  Save the file with the desired name, for example, `mouse.sh`.
4.  Close the text editor.

Now you have the `mouse.sh` script ready to be used as the mouse battery module in Polybar. Continue following the remaining steps of the guide to configure Polybar correctly.

## Step 3: Configure Polybar

Now, you need to configure Polybar to display the mouse battery module and bind the left click to execute the `solaar` command.

1.  Open the Polybar configuration file. The file location may vary depending on your installation, but it's usually located at `~/.config/polybar/config`.
2.  Locate the `[bar]` section where you want to add the mouse module.
3.  Add the following line to the `[bar]` section:

```modules-right = lgpx``` 

4.  Add the following section at the end of the configuration file:

```sh
[module/lgpx]
type = custom/script
exec = ~/.config/polybar/scripts/mouse.sh
click-left = solaar
```

Make sure to replace `~/.config/polybar/scripts/mouse.sh` with the correct path where you saved the `mouse.sh` script.

5.  Save the changes and close the file.

Make sure to restart Polybar for the changes to take effect. Now, the mouse battery module will be displayed in your Polybar, and clicking the left button on it will execute the `solaar` command.