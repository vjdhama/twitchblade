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
echo | sudo tee /etc/postgresql/9.3/main/pg_hba.conf
echo "# TYPE        DATABASE        USER        ADDRESS         METHOD" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
echo "  local       all             postgres                    peer" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
echo "  host        all             all         127.0.0.1/32    md5" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
echo "  host        all             all         ::1/128         md5" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
echo "  host        all             all         samenet         password" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
sudo service postgresql restart

echo "Creating necessary db roles and permissions"
sudo -u postgres psql -f ~/db/migrations.sql
