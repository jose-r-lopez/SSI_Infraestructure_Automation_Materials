#!/bin/bash

echo "Configuring Vagrant user"
sudo cp /home/vagrant/custom_files/nanorc /root/.nanorc
sudo cp /home/vagrant/custom_files/nanorc /home/vagrant/.nanorc
sudo cp /home/vagrant/custom_files/tmux.conf /etc/
sudo chmod o+r /etc/tmux.conf

echo "vagrant:test123..." | sudo chpasswd
