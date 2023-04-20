sudo apt-get remove elasticsearch kibana -y
rpm -e elasticsearch kibana
sudo apt-get --purge autoremove elasticsearch kibana
sudo dpkg --purge elasticsearch kibana
sudo dpkg --purge --force-all elasticsearch kibana
sudo rm -rf /var/lib/elasticsearch/
sudo rm -rf /etc/elasticsearch/
sudo rm -rf /etc/kibana/
sudo rm -rf /var/lib/kibana/
