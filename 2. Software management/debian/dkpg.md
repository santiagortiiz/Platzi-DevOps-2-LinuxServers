# Debian
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade

## https://linuxpip.org/ifconfig-command-not-found-fixes/#:~:text=installing%20net%2Dtools-,Why%20ifconfig%20command%20not%20found%20happens%3F,to%20the%20lack%20of%20maintenance.
sudo apt install net-tools

## https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/
sudo apt-get install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
ssh user@server-name

sudo apt search mysql
sudo apt search "mysql-server$"
sudo apt-cache search "mysql-server$"
dpkg -l
sudo dkpg-reconfigure tzdata
date
sudo snap search aws-cli
sudo snap refresh --list
sudo snap info aws-cli
sudo snap install canonical-livepatch