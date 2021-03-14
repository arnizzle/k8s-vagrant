#!/bin/bash

# Join worker nodes to the Kubernetes cluster

echo "[TASK 1] Join node to Kubernetes Cluster"
echo /vagrant/hosts >> /etc/hosts
apt-get  install -y sshpass >/dev/null 2>&1

# sshpass -p "kubeadmin" scp -o StrictHostKeyChecking=no $MASTERNAME:/joincluster.sh /joincluster.sh

# Manually adding IP address since setup sometimes doesn't show INTERNAL_IP

cp /vagrant/joincluster.sh /tmp

bash /tmp/joincluster.sh >/dev/null 2>&1
