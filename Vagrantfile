# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box         = "ubuntu/trusty64"
  config.vm.hostname    = "dev-box.local"

  config.vm.boot_timeout = 600

  config.vm.network :forwarded_port, guest: 80, host: 8000
  config.vm.network :forwarded_port, guest: 443, host: 8100
  config.vm.network :private_network, ip: "10.13.13.13"

  config.vm.synced_folder "../../../", "/var/www", :nfs => true
  config.nfs.map_uid = Process.uid
  config.nfs.map_gid = Process.gid

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Copy your hosts public and private ssh keys.
  config.vm.provision :file do |file|
    file.source      = '~/.ssh/id_rsa'
    file.destination = '/home/vagrant/.ssh/id_rsa'
  end
  config.vm.provision :file do |file|
    file.source      = '~/.ssh/id_rsa.pub'
    file.destination = '/home/vagrant/.ssh/id_rsa.pub'
  end
  config.vm.provision :file do |file|
    file.source      = '~/.gitconfig'
    file.destination = '/home/vagrant/.gitconfig'
  end
  config.vm.provision :file do |file|
    file.source      = '~/.gitignore_global'
    file.destination = '/home/vagrant/.gitignore_global'
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "vagrant/ansible/playbook.yml"
  end

end
