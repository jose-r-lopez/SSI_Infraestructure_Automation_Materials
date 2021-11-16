#!/bin/bash

echo ">>>>> Updating package base <<<<<"
sudo apt-get -y update
     
echo ">>>>> Upgrading packages <<<<<"
sudo apt-get -y full-upgrade