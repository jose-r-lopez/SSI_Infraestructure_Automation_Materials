sudo /home/vagrant/custom_scripts/software/install_antimalware.sh
sudo /home/vagrant/custom_scripts/os/install_base_security_packages.sh
sudo /home/vagrant/custom_scripts/os/install_process_accounting.sh
sudo /home/vagrant/custom_scripts/software/install_postfix.sh
sudo /home/vagrant/custom_scripts/software/install_logcheck.sh
sudo /home/vagrant/custom_scripts/software/install_sysstat.sh
sudo /home/vagrant/custom_scripts/os/install_auditd.sh
sudo /home/vagrant/custom_scripts/software/install_usbguard.sh
sudo /home/vagrant/custom_scripts/software/install_fail2ban.sh
sudo /home/vagrant/custom_scripts/software/install_portsentry.sh
sudo /home/vagrant/custom_scripts/os/ban_common_passwords.sh
sudo /home/vagrant/custom_scripts/software/install_oscap.sh
sudo /home/vagrant/custom_scripts/os/install_hardened_system_files.sh
sudo /home/vagrant/custom_scripts/os/enable_ssh_ufw.sh 53245
sudo /home/vagrant/custom_scripts/os/install_kernel_hardening.sh
sudo /home/vagrant/custom_scripts/os/install_hardened_permissions.sh
sudo /home/vagrant/custom_scripts/os/disable_rare_network_protocols.sh
sudo /home/vagrant/custom_scripts/os/disable_core_dumps.sh
sudo /home/vagrant/custom_scripts/os/install_password_policies.sh
sudo /home/vagrant/custom_scripts/os/enable_unattended_upgrades.sh
sudo /home/vagrant/custom_scripts/software/install_arpwatch.sh
sudo /home/vagrant/custom_scripts/software/install_aide.sh
sudo /home/vagrant/custom_scripts/os/enable_malicious_hosts_block.sh
sudo /home/vagrant/custom_scripts/os/change_default_mount_options.sh
sudo /home/vagrant/custom_scripts/os/enable_dnssec.sh
sudo /home/vagrant/custom_scripts/os/add_grub_password.sh
sudo /home/vagrant/custom_scripts/os/preinstall_ssh_mfa.sh
sudo /home/vagrant/custom_scripts/clean_apt.sh
sudo /home/vagrant/custom_scripts/minimize_files.sh

# Final cleanup particular for this machine
sudo rm -r /home/vagrant/hardened_files
sudo dpkg --purge exim4
sudo dpkg --purge exim4-base
sudo dpkg --purge exim4-config
sudo dpkg --purge exim4-daemon-light