#!/bin/bash

echo ">>>>> Updating package base <<<<<"
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get -y update

echo ">>>>> Installing Inkscape <<<<<"
sudo apt-get -y install inkscape