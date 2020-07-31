#! /bin/bash
#apache
whoami
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Deployed via Terraform!!!</h1> $(id -u)" | sudo tee /var/www/html/index.html
#instalando docker
 sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io 
sudo docker run hello-world

#instalando docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

#instalando git
sudo apt install -y git

#descargando archivos para levantar contenedores
ls
cd home/ubuntu
git clone https://github.com/MikePineda/prometheus-grafana.git
cd prometheus-grafana
mkdir data
mkdir data/grafana

#levantando contenedores
sudo  USER_ID=$(id -u) docker-compose up -d