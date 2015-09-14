# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "db" do |node|
    node.vm.network :private_network, ip: "33.33.33.10"
    node.vm.provision "shell", privileged: false,  path: "./provisions/db.sh"
  end

  config.vm.define "client" do |node|
    node.vm.network :private_network, ip: "33.33.33.11"
    node.vm.synced_folder "./", "/home/vagrant/app"
    node.vm.provision "shell", privileged: false,  path: "./provisions/client.sh"
  end


  config.vm.box = "ubuntu/trusty64"

  config.vm.box_check_update = false

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

end

