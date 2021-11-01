cd /opt/
sudo wget http://download.virtualbox.org/virtualbox/LATEST.TXT
sudo wget -c http://download.virtualbox.org/virtualbox/$(cat LATEST.TXT)/VBoxGuestAdditions_$(cat LATEST.TXT).iso -O /opt/VBGAdd.iso
sudo mount /opt/VBGAdd.iso -o loop /mnt
sudo sh /mnt/VBoxLinuxAdditions.run --nox11
sudo umount /mnt
sudo rm /opt/VBGAdd.iso