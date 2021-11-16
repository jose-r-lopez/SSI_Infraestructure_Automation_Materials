
sudo chmod u+x /home/vagrant/custom_scripts/init_scripts.sh
sudo /home/vagrant/custom_scripts/init_scripts.sh

sudo /home/vagrant/custom_scripts/full_os_upgrade.sh
sudo /home/vagrant/custom_scripts/basic_cmd_software_install.sh
sudo /home/vagrant/custom_scripts/vagrant_user_setup.sh
sudo /home/vagrant/custom_scripts/change_keyboard_layout_es.sh
sudo /home/vagrant/custom_scripts/install_additions.sh
sudo /home/vagrant/custom_scripts/desktop_environments/install_gnome.sh

sudo /home/vagrant/custom_scripts/os/add_universe_repository.sh
sudo /home/vagrant/custom_scripts/software/install_inkscape.sh
sudo /home/vagrant/custom_scripts/software/install_vscode.sh
sudo /home/vagrant/custom_scripts/software/install_teams.sh
sudo /home/vagrant/custom_scripts/software/install_brave.sh
sudo /home/vagrant/custom_scripts/software/install_nmap.sh
sudo /home/vagrant/custom_scripts/software/install_ffmpeg.sh
sudo /home/vagrant/custom_scripts/software/install_clamtk.sh
sudo /home/vagrant/custom_scripts/software/install_gimp.sh
sudo /home/vagrant/custom_scripts/software/install_krita.sh
sudo /home/vagrant/custom_scripts/software/install_texmaker.sh
sudo /home/vagrant/custom_scripts/software/install_calibre.sh
sudo /home/vagrant/custom_scripts/software/install_filezilla.sh
sudo /home/vagrant/custom_scripts/software/install_openshot.sh
sudo /home/vagrant/custom_scripts/software/install_okular.sh
sudo /home/vagrant/custom_scripts/software/install_kodi.sh

sudo /home/vagrant/custom_scripts/os/enable_malicious_hosts_block.sh
sudo /home/vagrant/custom_scripts/clean_apt.sh

sudo rm -r /home/vagrant/hardened_files
