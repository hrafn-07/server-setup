sudo su - app

#clone opendax
git clone https://github.com/openware/opendax.git ~/

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