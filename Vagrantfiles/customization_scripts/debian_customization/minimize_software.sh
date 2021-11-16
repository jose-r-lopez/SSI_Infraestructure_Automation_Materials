#!/bin/bash
echo ">>>>> Minimizing software installation <<<<<"

sudo /home/vagrant/custom_scripts/convert_to_server.sh

echo "Purging unnecessary services..."
DEBIAN_FRONTEND=noninteractive sudo apt-get purge -y --auto-remove snapd squashfs-tools friendly-recovery apport at
sudo apt-get autoremove --purge
