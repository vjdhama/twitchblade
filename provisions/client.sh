echo "Updating client system !!"
sudo apt-get -y update

echo "Installing package dependencies"
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev 
sudo apt-get install -y libreadline-dev libyaml-dev libsqlite3-dev
sudo apt-get install -y sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev
sudo apt-get install -y python-software-properties libffi-dev libpq-dev

echo "Installing RBENV"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
sudo locale-gen en_US en_US.UTF-8
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc    
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export LC_CTYPE=en_US.UTF-8' >> ~/.bashrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
source ~/.bashrc    


~/.rbenv/bin/rbenv install 2.2.2
~/.rbenv/bin/rbenv global 2.2.2
~/.rbenv/bin/rbenv rehash
~/.rbenv/shims/gem install bundler

echo "Installing app dependencies"
cd ~/app
~/.rbenv/shims/bundle install
