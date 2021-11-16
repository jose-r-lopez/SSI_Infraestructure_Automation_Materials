#!/bin/bash

echo ">>>>> Installing USB Guard <<<<<"
sudo apt-get -y install usbguard
usbguard generate-policy > rules.conf
sudo install -m 0600 -o root -g root rules.conf /etc/usbguard/rules.conf
sudo systemctl restart usbguard
