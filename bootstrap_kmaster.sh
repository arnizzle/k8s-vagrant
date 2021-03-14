#!/bin/bash

# Initialize Kubernetes


echo "[TASK 1] Initialize Kubernetes Cluster"
rm /vagrant/hosts
/vagrant/readhosts.sh > /vagrant/hosts
echo /vagrant/hosts >> /etc/hosts

kubeadm init --apiserver-advertise-address=$HOSTIP --pod-network-cidr=$CIDR >> /root/kubeinit.log 2>/dev/null

# Copy Kube admin config
echo "[TASK 2] Copy kube admin config to Vagrant user .kube directory"

mkdir /home/vagrant/.kube
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
cp /home/vagrant/.kube/config /vagrant/config

chown -R vagrant:vagrant /home/vagrant/.kube/


# Copy config to host disk
echo "[TASK 3] Copy kube config to host fs"
cp /etc/kubernetes/admin.conf /vagrant/config

# Deploy flannel network
echo "[TASK 4] Deploy Calico network"

#su - vagrant -c "kubectl create -f https://docs.projectcalico.org/$CALICO_VERSION/manifests/calico.yaml"
su - vagrant -c "kubectl create -f https://docs.projectcalico.org/$CALICO_VERSION/manifests/calico.yaml"

# Generate Cluster join command
echo "[TASK 5] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /vagrant/joincluster.sh
chmod +x /vagrant/joincluster.sh
