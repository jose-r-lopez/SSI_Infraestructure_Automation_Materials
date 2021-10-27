set VAGRANT_EXPERIMENTAL="disks"
vagrant up

vagrant ssh -c "sudo dnf -y install epel-release"
vagrant ssh -c "sudo dnf -y install gcc make perl kernel-devel kernel-headers bzip2 dkms"
vagrant ssh -c "sudo dnf update kernel-*"

vagrant halt
vagrant up

vagrant ssh -c "cd /opt/"
vagrant ssh -c "sudo wget http://download.virtualbox.org/virtualbox/LATEST.TXT"
vagrant ssh -c "sudo wget -c http://download.virtualbox.org/virtualbox/$(cat LATEST.TXT)/VBoxGuestAdditions_$(cat LATEST.TXT).iso -O /opt/VBGAdd.iso"
vagrant ssh -c "sudo mount /opt/VBGAdd.iso -o loop /mnt"
vagrant ssh -c "sudo sh /mnt/VBoxLinuxAdditions.run --nox11"
vagrant ssh -c "sudo umount /mnt"
vagrant ssh -c "sudo rm /opt/VBGAdd.iso"

vagrant halt
vagrant up

