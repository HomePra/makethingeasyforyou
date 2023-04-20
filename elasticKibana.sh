# Elastic stack installation

# 1. Install dependencies:
# ------------------------

sudo apt-get install curl
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/elastic-archive-keyring.gpg
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
sudo bash -c "export HOSTNAME=kali-purple.kali.purple; apt-get install elasticsearch -y"

# take note of "elastic" user password


# 2. Convert to single-node setup (or replace fqdn name in initial_master_nodes list with IP address):
# -----------------------------------------------------------------------------------------------------
sudo sed -e '/cluster.initial_master_nodes/ s/^#*/#/' -i /etc/elasticsearch/elasticsearch.yml
echo "discovery.type: single-node" | sudo tee -a /etc/elasticsearch/elasticsearch.yml


# 3. Install Kibana:
# ------------------
sudo apt install kibana
sudo /usr/share/kibana/bin/kibana-encryption-keys generate -q
# Add keys to /etc/kibana/kibana.yml
echo "server.host: \"localhost\"" | sudo tee -a /etc/kibana/kibana.yml
# Ensure kli-purple.kali.purple is only mapped to localhost in /etc/hosts in order to bind Kibana to that interface
sudo systemctl enable elasticsearch kibana --now



# 4. Enroll Kibana:
# -----------------
sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

# open browser and navigate to http://10.0.2.103:5601
# enter username=elastic and password as displayed after installation
# paste token from above

sudo /usr/share/kibana/bin/kibana-verification-code

# enter verification code into Kibana when prompted



# 4.Enable HTTPS for Kibana:
# --------------------------

#/usr/share/elasticsearch/bin/elasticsearch-certutil ca
#/usr/share/elasticsearch/bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12 --dns kali-purple.kali.purple,elastic.kali.purple,kali-purple --out kibana-server.p12
#sudo openssl pkcs12 -in /usr/share/elasticsearch/kibana-server.p12 -out /etc/kibana/kibana-server.crt -clcerts -nokeys
#sudo openssl pkcs12 -in /usr/share/elasticsearch/kibana-server.p12 -out /etc/kibana/kibana-server.key -nocerts -nodes
#sudo chown root:kibana /etc/kibana/kibana-server.key
#sudo chown root:kibana /etc/kibana/kibana-server.crt
#sudo chmod 660 /etc/kibana/kibana-server.key
#sudo chmod 660 /etc/kibana/kibana-server.crt
#
#echo "server.ssl.enabled: true" | sudo tee -a /etc/kibana/kibana.yml
#echo "server.ssl.certificate: /etc/kibana/kibana-server.crt" | sudo tee -a /etc/kibana/kibana.yml
#echo "server.ssl.key: /etc/kibana/kibana-server.key" | sudo tee -a /etc/kibana/kibana.yml
#echo "server.publicBaseUrl: \"https://localhost:5601\"" | sudo tee -a /etc/kibana/kibana.yml
