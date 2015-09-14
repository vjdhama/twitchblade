echo "Updating DBsystem !!"
sudo apt-get -y update

echo "setting up locale"

echo 'export LC_CTYPE=en_US.UTF-8' >> ~/.bashrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
source ~/.bashrc

echo "Installing Postgresql"
sudo apt-get install -y postgresql postgresql-client postgresql-contrib libpq-dev

echo "Setting up listen addresses"

echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/9.3/main/postgresql.conf
echo "host    all    all    33.33.33.11/32    trust" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf

sudo service postgresql restart

echo "Creating necessary db roles and permissions"

sudo -u postgres psql -c "create user twitter with password 'twitter';"
sudo -u postgres psql -c "create database twitter_staging owner twitter;"
sudo -u postgres psql -c "create database twitter_spec owner twitter;"
