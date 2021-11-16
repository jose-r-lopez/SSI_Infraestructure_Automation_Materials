#!/bin/bash

echo ">>>>> Cleaning up apt <<<<<"
sudo apt-get -y autoremove 
sudo apt-get -y autoclean

echo ">>>>> Cleaning up custom Vagrant files <<<<<"
sudo rm -r /home/vagrant/custom_files
sudo rm -r /home/vagrant/custom_scripts
