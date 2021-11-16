#!/bin/bash

if [[ $(sudo virt-what | grep 'virtualbox') = *virtualbox* ]]; then
    echo ">>>>> Installing VirtualBox Additions <<<<<"
    sudo apt-get -y --no-install-recommends install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
    sudo VBoxClient --clipboard
    sudo VBoxClient --draganddrop
    sudo VBoxClient --vmsvga
    sudo VBoxClient --checkhostversion
    sudo VBoxClient --seamless
    sudo adduser vagrant vboxsf
elif [[ $(sudo virt-what | grep 'hyperv') = *hyperv* ]]; then
    echo ">>>>> Enabling Linux Integration Services (LIS) <<<<<"
    sudo sed -i '$a hv_vmbus' /etc/initramfs-tools/modules
    sudo sed -i '$a hv_storvsc' /etc/initramfs-tools/modules
    sudo sed -i '$a hv_blkvsc' /etc/initramfs-tools/modules
    sudo sed -i '$a hv_netvsc' /etc/initramfs-tools/modules
    # Replace default kernel with linux-virtual for the best LIS experience
    sudo apt-get -y install linux-virtual linux-cloud-tools-virtual linux-tools-virtual
    # Update Initramfs
    sudo update-initramfs -u
elif [[ $(sudo virt-what | grep 'vmware') = *vmware* ]]; then
    echo ">>>>> Installing Open VM Tools (untested, please check: https://www.vagrantup.com/docs/providers/vmware/vagrant-vmware-utility) <<<<<"
    if [[ $(type Xorg) = *found* ]]; then
	sudo apt-get install -y --no-install-recommends open-vm-tools
    else
	sudo apt-get install -y --no-install-recommends open-vm-tools-desktop
    fi
fi