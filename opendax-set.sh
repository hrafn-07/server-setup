#! /bin/bash
useradd -g sudo -s `which bash` -m app
echo "app ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#docker and docker-compose installing
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install \
ca-certificates \
curl \
gnupg \
lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt install docker-compose

sudo usermod -aG docker app
sudo su - app

#clone opendax
git clone https://github.com/MobiDAX/opendax.git ~/

#install rvm
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
cd opendax
rvm install .
source /home/app/.rvm/scripts/rvm
rvm install "ruby-2.6.3"

#installing bundle
bundle install
rake -T # To see if ruby and lib works
