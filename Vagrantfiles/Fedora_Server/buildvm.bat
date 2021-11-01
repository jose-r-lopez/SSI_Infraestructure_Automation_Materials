set VAGRANT_EXPERIMENTAL="disks"
vagrant up

vagrant ssh -c "sudo dnf -y install gcc make perl kernel-devel kernel-headers bzip2 dkms"
vagrant ssh -c "sudo dnf update kernel-*"

vagrant halt
vagrant up

