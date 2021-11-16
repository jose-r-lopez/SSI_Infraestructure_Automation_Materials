#!/bin/bash

if [[ $(sudo virt-what | grep 'virtualbox') = *virtualbox* ]]; then
    echo ">>>>> Installing VirtualBox Additions <<<<<"
    sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)
    cd /opt/
    sudo wget http://download.virtualbox.org/virtualbox/LATEST.TXT
    sudo wget -c http://download.virtualbox.org/virtualbox/$(cat LATEST.TXT)/VBoxGuestAdditions_$(cat LATEST.TXT).iso -O /opt/VBGAdd.iso
    sudo mount /opt/VBGAdd.iso -o loop /mnt
    sudo sh /mnt/VBoxLinuxAdditions.run --nox11
    sudo umount /mnt
    sudo rm /opt/VBGAdd.iso
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