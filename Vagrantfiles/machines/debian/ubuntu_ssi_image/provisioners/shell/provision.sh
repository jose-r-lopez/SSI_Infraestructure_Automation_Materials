
sudo chmod u+x /home/vagrant/custom_scripts/init_scripts.sh
sudo /home/vagrant/custom_scripts/init_scripts.sh

sudo /home/vagrant/custom_scripts/full_os_upgrade.sh
sudo /home/vagrant/custom_scripts/basic_cmd_software_install.sh
sudo /home/vagrant/custom_scripts/vagrant_user_setup.sh
sudo /home/vagrant/custom_scripts/users/add_user.sh ssiuser
sudo /home/vagrant/custom_scripts/change_keyboard_layout_es.sh
sudo /home/vagrant/custom_scripts/install_additions.sh
sudo /home/vagrant/custom_scripts/desktop_environments/install_xfce4.sh
sudo /home/vagrant/custom_scripts/software/install_docker_and_compose.sh
sudo /home/vagrant/custom_scripts/users/add_user_to_group.sh ssiuser docker
sudo /home/vagrant/custom_scripts/clean_apt.sh

