# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = ""
  config.vm.box_check_update = true
  config.vm.hostname = "test.local"
  config.vm.network "private_network", ip: "10.99.0.2", hostname: true

  config.vm.provision :shell, path: "install.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

end
