sudo wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
sudo chmod o+r hosts
sudo chown root:root hosts
echo "y" | sudo mv hosts /etc/hosts

