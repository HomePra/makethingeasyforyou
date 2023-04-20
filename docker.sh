#instsalling docker
sudo apt install docker.io
sudo docker login

#setting up vulurable lab
#installing dvwa
sudo docker pull vulnerables/web-dvwa
sudo docker create --name dvwa -p 80:80 -t vulnerables/web-dvwa
#sudo docker ps -a
#sudo docker start dvwa
#sudo docker exec -it dvwa /bin/bash
#hostname -I
#apt update -y ; apt  install nano
#sudo sed -i 's/^allow_url_include = off/allow_url_include = on/g' /etc/php/7.0/apache2/php.ini
#service apache2 restart
#exit
sudo docker stop dvwa
echo "dvwa is finished"

#install webapp
sudo docker pull raesene/bwapp
sudo docker create --name bwapp -p 8080:80 -it raesene/bwapp
sudo docker start bwapp
#sudo docker exec -it bwapp /bin/bash
#exit
sudo docker stop bwapp
echo "webgoat is finished"

#install juice-shop
sudo docker pull bkimminich/juice-shop
sudo docker create --name juice -p 80:3000 -it bkimminich/juice-shop
sudo docker start juice
#sudo docker exec -it juice /bin/bash
#exit
sudo docker stop juice
echo "juice-shop is finished"
#172.17.0.2:80

#install webgoat
sudo docker pull szsecurity/webgoat
sudo docker  create --name webgoat -p 80:8080 -it szsecurity/webgoat
sudo docker start webgoat
sudo docker stop webgoat
echo "webgoat is finished"
#172.17.0.2/WebGoat

#Install metasploitable2
sudo docker pull tleemcjr/metasploitable2
sudo docker create --name meta2 -it tleemcjr/metasploitable2
sudo docker start meta2
#sudo docker exec -it meta2 /bin/bash
sudo docker stop meta2
echo "meta2 is finished"

sudo docker ps -a

