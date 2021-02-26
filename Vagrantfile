# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

hosts = YAML.load_file("hosts.yaml")
cfg = YAML.load_file("config.yaml")

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh", env: {"MYVAR" => "value"}

  hosts.each do |host|

    config.vm.define host['name'] do |node|
      node.vm.box = "bento/ubuntu-18.04"
      node.vm.hostname = host['fqdn']
      node.vm.network "public_network", ip: host['ip'], netmask: cfg['netmask'], bridge: cfg['bridge']
#      node.vm.network "public_network", ip: "10.10.90.100", netmask: cfg['netmask'], bridge: cfg['bridge']

      if host['master']
        node.vm.provider "virtualbox" do |v|
          v.name = host['name']
          v.memory = 2000
          v.cpus = 2
        end

        node.vm.provision "shell", path: "bootstrap_kmaster.sh", env: {"HOSTIP" => host['ip'], "CIDR" => host['cidr']}
      end

      if host['node']
        node.vm.provider "virtualbox" do |v|
          v.name = host['name']
          v.memory = 3000
          v.cpus = 2
        end

        node.vm.provision "shell", path: "bootstrap_kworker.sh", env: {"MASTERFQDN" => cfg['masterfqdn'], "MASTERIP" => cfg['masterip']}

      end

    end
  end
end
