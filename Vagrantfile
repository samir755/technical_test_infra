# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = ""
  config.vm.box_check_update = true
  config.vm.hostname = "test.local"
  config.vm.network "forwarded_port", guest: 80, host: 4567, host_ip: "127.0.0.1"

  config.vm.provision :shell, path: "install.sh"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end

end
