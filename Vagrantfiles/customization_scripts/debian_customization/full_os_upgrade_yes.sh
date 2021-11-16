#!/bin/bash

echo ">>>>> Updating package base <<<<<"
echo -e "\n" | sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
     
echo ">>>>> Upgrading packages <<<<<"
sudo DEBIAN_FRONTEND=noninteractive apt-get -y full-upgrade