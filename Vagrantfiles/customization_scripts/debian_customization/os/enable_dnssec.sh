#!/bin/bash

echo ">>>>> Enabling DNSSEC <<<<<"
sudo cp /home/vagrant/hardened_files/resolved.conf /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved

