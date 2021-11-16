#!/bin/bash

echo "Configuring Vagrant user"
sudo cp /home/vagrant/custom_files/.nanorc /root
sudo cp /home/vagrant/custom_files/.nanorc /home/vagrant
sudo cp /home/vagrant/custom_files/tmux.conf /etc/
sudo chmod o+r /etc/tmux.conf

echo "vagrant:test123..." | sudo chpasswd