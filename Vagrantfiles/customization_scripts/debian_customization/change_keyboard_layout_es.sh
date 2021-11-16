#!/bin/bash

echo ">>>>> Change keyboard layout to Spanish <<<<<"
loadkeys es
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure console-setup
sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"es\"/g' /etc/default/keyboard    