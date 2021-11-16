#!/bin/bash

echo ">>>>> Enable ARP Monitoring Software <<<<<"
sudo apt-get -y install arpwatch
sudo systemctl enable arpwatch@eth0
sudo systemctl start arpwatch@eth0