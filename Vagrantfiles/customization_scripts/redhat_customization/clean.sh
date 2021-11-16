#!/bin/bash

echo ">>>>> Cleaning up <<<<<"
sudo yum -y autoremove

echo ">>>>> Cleaning up custom Vagrant files <<<<<"
sudo rm -r /home/vagrant/custom_files
sudo rm -r /home/vagrant/custom_scripts
