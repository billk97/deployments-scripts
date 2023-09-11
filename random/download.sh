apt_install () {
	sudo apt install $1 -y > /dev/null
	if [ $? -eq 0 ]; then
		echo OK
	else
		echo Installation of $1 failed ⚠️
	fi
}

check_if_installed () {
	echo
echo "🛠  $2. Installing $1"
if ! command -v $1 &> /dev/null
then
        echo "$1 could not be found"
        echo "installing $!"
        apt_install $1
        echo "✅ $1 installed"
else
        echo "✅ $! is already installed "
fi

}

update () {
echo
echo Press 1 for update before installation: 
read var_option
if [ $var_option -eq 1 ]; then
	echo Starting updates
        sudo apt update -y > /dev/null
        sudo apt upgrade -y > /dev/null
	echo ✅ Updates finished successfull 
fi



}

install_java () {
	echo
	echo  🛠  Press 1 to Install Java:
	read var_option
	if [ $var_option -eq 1 ]; then

		echo Starting Java installation.........
		echo 1. Installing sdkman 💬
		curl -s "https://get.sdkman.io" | bash
		source "$HOME/.sdkman/bin/sdkman-init.sh"
		echo 2. Installing java 17🛠
		sdk install sdk install java 17.0.2.8.1-amzn
		echo 3. Making java 17 default 🛠
		sdk default java 17.0.2.8.1-amzn
		echo 4. Installing maven 🛠
		sdk install maven
		echo 5. Installing quarkus 🛠
		sdk install quarkus
		echo "✅ Java installed"
	fi
}


install_docker () {
	echo
	echo  🛠   Press 1 to Install Docker:
        read var_option
        if [ $var_option -eq 1 ]; then
		echo 🛠 Starting docker installation 🛠
		sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
		echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		sudo apt update -y

		apt-cache policy docker-ce
		sudo apt install docker-ce -y
		echo Starting docker daemon 🛠
		sudo systemctl is-active --quiet mysql && echo ✅  docker service is running
		systemctl is-failed --quiet docker && echo ❌ docker service is not running
		echo Execuring docker without sudo 🛠
		sudo usermod -aG docker ${USER}
		su - ${USER}

		groups
		sudo usermod -aG docker ${USER}
		echo "✅ Docker installed"
	fi

}



install_docker_compose () {
	echo
        echo  🛠    Press 1 to Install Docker compose:
        read var_option
        if [ $var_option -eq 1 ]; then
                echo 🛠  Starting docker-compose installation 🛠
		mkdir -p ~/.docker/cli-plugins/
		curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
		chmod +x ~/.docker/cli-plugins/docker-compose
		docker compose version
                echo "✅ Docker-compose installed"
        fi

}

install_yarn () {
	echo
	echo  🛠     Press 1 to Install  Yarn:
        read var_option
        if [ $var_option -eq 1 ]; then
                echo 🛠   Starting yarn installation 🛠
		sudo npm install --global yarn
                echo "✅ Yarn  installed"
        fi
}



install_kubctl () {
	echo
        echo  🛠      Press 1 to Install  kubectl:
        read var_option
        if [ $var_option -eq 1 ]; then
                echo 🛠    Starting kubectl installation 🛠
                curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
		curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
		sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
		kubectl version --client
                echo "✅ kubectl  installed"
        fi

}

install_snap_packets () {
	echo 
	echo  🛠      Press 1 to Install  snap packets:
        read var_option
        if [ $var_option -eq 1 ]; then
                echo 🛠    Installing spotify
		sudo snap install spotify
		echo 🛠     Installing postman
		sudo snap install postman
		echo 🛠     Installing slack
		sudo snap install slack
		echo 🛠     Installing code
		sudo snap install code --classic
		echo 🛠     Installing bitwarden
		sudo snap install bw
		echo 🛠     Installing mailspring
		sudo snap install mailspring
		echo 🛠     Installing umlet
		sudo snap install umlet-standalone
		echo 🛠     Installing zoom-client
		sudo snap install zoom-client
		echo 🛠     Installing chromium
		sudo snap install chromium
		echo 🛠      Installing idea-community
		sudo snap install intellij-idea-community --classic
		echo 🛠      Installing cidea-ultimate
		sudo snap install intellij-idea-ultimate --classic
		echo 🛠       Installing mysql-workbench
		sudo snap install mysql-workbench-community
		echo 🛠       Installing teams
		sudo snap install teams-for-linux
		echo "✅  snap packets installed"
        fi

}


install_go () {
	echo
        echo  🛠      Press 1 to Install  Go:
        read var_option
        if [ $var_option -eq 1 ]; then
                echo 🛠    Starting Go installation 🛠
                cd ~
		curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
		sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
		echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
		source ~/.profile
		go version
		echo "✅ Go  installed"
        fi

}


install_apt_packages () {
        echo
        echo  🛠      Press 1 to Install  apt packets:
        read var_option
        if [ $var_option -eq 1 ]; then
                echo 🛠    Starting apt packets installation 🛠
                check_if_installed git 1
		check_if_installed tmux 2
		check_if_installed htop 3
		check_if_installed neofetch 4
		check_if_installed vim 5
		check_if_installed zsh 6
		check_if_installed curl 7
		check_if_installed nodejs 8
		check_if_installed npm 9
		check_if_installed mysql-client 10
		check_if_installed httpie 11
		check_if_installed net-tools 12
		echo "✅  apt  installed"
        fi

}
install_zsh () {
	echo
        echo  🛠       Press 1 to Install zsh:
        read var_option
        if [ $var_option -eq 1 ]; then
                echo 🛠     Starting zsh installation 🛠
		check_if_installed zsh 6
		sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		zsh --version
		omz update
		sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"
		sudo chsh -s $(which zsh) $(whoami)

                echo "✅  zsh  installed"
        fi

}

echo Please run with sudo

update  

install_apt_packages

install_java 
install_docker
install_docker_compose
install_yarn
install_go
install_kubctl
install_zsh
sudo snap refresh

install_snap_packets
echo 
echo
echo =====🛠  Instalation finnished 🛠 =====
