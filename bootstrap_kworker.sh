#!/bin/bash

# Join worker nodes to the Kubernetes cluster

echo "[TASK 1] Join node to Kubernetes Cluster"
apt-get  install -y sshpass >/dev/null 2>&1

# sshpass -p "kubeadmin" scp -o StrictHostKeyChecking=no $MASTERNAME:/joincluster.sh /joincluster.sh

echo $MASTERNAME >> /tmp/master

# scp -o StrictHostKeyChecking=no $MASTERNAME:/joincluster.sh /joincluster.sh
#sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@$MASTERNAME:/joincluster.sh joincluster.sh

bash /vagrant/joincluster.sh >/dev/null 2>&1
