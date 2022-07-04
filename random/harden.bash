sudo useradd -m ubuntu
sudo passwd ubuntu
usermod -aG sudo ubuntu
sudo chsh -s /bin/bash username
sudo apt update
sudo apt install apache2 -y
sudo apt-get install   ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo apt install docker-compose
sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config.back
cd /etc/ssh
sudo wget https://vsk-random.s3.eu-west-1.amazonaws.com/sshd_config.ini
sudo mv sshd_config.ini sshd_config 
sudo systemctl reload sshd.service
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod proxy
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_balancer
sudo a2enmod proxy_http
sudo apt install certbot -y
