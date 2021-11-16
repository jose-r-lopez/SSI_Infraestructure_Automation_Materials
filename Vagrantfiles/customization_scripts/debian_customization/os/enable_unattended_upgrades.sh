#!/bin/bash

echo ">>>>> Enable unattended upgrades <<<<<"
sudo apt-get -y install unattended-upgrades apt-listchanges
sudo dpkg-reconfigure -f noninteractive -plow unattended-upgrades

