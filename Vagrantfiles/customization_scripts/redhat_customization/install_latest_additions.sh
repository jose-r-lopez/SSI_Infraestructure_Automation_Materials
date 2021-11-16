#!/bin/bash

if [[ $(sudo virt-what | grep 'virtualbox') = *virtualbox* ]]; then
    echo ">>>>> Installing VirtualBox Additions <<<<<"
    sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)
    cd /opt/
    sudo wget http://download.virtualbox.org/virtualbox/LATEST.TXT
    sudo wget -c http://download.virtualbox.org/virtualbox/$(cat LATEST.TXT)/VBoxGuestAdditions_$(cat LATEST.TXT).iso -O /opt/VBGAdd.iso
    sudo mount /opt/VBGAdd.iso -o loop /mnt
    sudo sh /mnt/VBoxLinuxAdditions.run
    sudo umount /mnt
    sudo rm /opt/VBGAdd.iso
    sudo usermod -a -G vboxsf vagrant
elif [[ $(sudo virt-what | grep 'hyperv') = *hyperv* ]]; then
    echo ">>>>> Hyper-V detected. Nothing to do.... <<<<<"
elif [[ $(sudo virt-what | grep 'vmware') = *vmware* ]]; then
    echo ">>>>> Installing Open VM Tools (untested, please check: https://www.vagrantup.com/docs/providers/vmware/vagrant-vmware-utility) <<<<<"
    if [[ $(type Xorg) = *found* ]]; then
	sudo yum install open-vm-tools
    else
	sudo yum install open-vm-tools-desktop
    fi
fi