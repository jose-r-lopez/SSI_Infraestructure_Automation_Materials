#!/bin/bash
echo ">>>>> Minimizing files in the hard disk <<<<<"

echo "Disabling the apt cache..."
sudo cp /home/vagrant/custom_files/02nocache /etc/apt/apt.conf.d/

echo "Clearing the apt cache...."
sudo rm -rf /var/cache/apt/archives

echo "Disabling man pages, locales and docs..."
sudo cp /home/vagrant/custom_files/01_nodoc /etc/dpkg/dpkg.cfg.d/
sudo rm -rf /usr/share/doc/
sudo rm -rf /usr/share/man/
sudo rm -rf /usr/share/locale/