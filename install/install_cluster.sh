#! /bin/bash

# Prepare for installation.
sudo apt-get update
sudo apt-get install -y gcc make linux-headers-$(uname -r)

# Download and install nvidia-470.86 drivers
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/470.86/NVIDIA-Linux-x86_64-470.86.run
chmod +x ./NVIDIA-Linux-x86_64-470.86.run
sudo ./NVIDIA-Linux-x86_64-470.86.run

# install MicroK8s 1.20
sudo snap install microk8s --classic --channel=1.20/stable

# Enable private repository access
# sudo cp ./containerd-template-1.20.toml /var/snap/microk8s/current/args/containerd-template.toml
# sudo microk8s stop
# sudo microk8s start

# Enable GPU use in MicroK8s
sudo microk8s enable dns gpu

# We assume the user has not already been added to the microk8s group with
# > sudo usermod -a -G microk8s $USER
# > sudo chown -f -R $USER ~/.kube
mkdir -p ~/.kube
sudo microk8s config > ~/.kube/config

# Putting in some things to do before installing kubeflow.
sudo microk8s enable dns storage helm3 istio ingress metallb:10.64.140.43-10.64.140.4

# Install kubeflow
microk8s enable kubeflow

