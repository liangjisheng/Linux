#!/bin/bash

# Install Minikube on Ubuntu 18.04

# step 1:
# Install docker
source ./dockerInstall.sh

if [ $? -ne 0 ]
then
    exit -1
fi

# Step 2: Install KVM or VirtualBox Hypervisor
sudo apt install virtualbox virtualbox-ext-pack

# Step 3: Download minikube 使用阿里镜像安装
curl -Lo minikube http://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/releases/v0.30.0/minikube-linux-amd64
chmod u+x minikube
sudo mv minikube /usr/local/bin/

# Confirm version installed
minikube version

# Step 4: Install kubectl on Ubuntu 18.04
curl -Lo kubectl.deb https://mirrors.ustc.edu.cn/kubernetes/apt/pool/kubectl_1.12.1-00_amd64_f02235e5b8633b589e6f7c39a581b29bef4ea723f52812c152a609302073e5fe.deb
mkdir kubectl_1.12.1-00
dpkg -X kubectl.deb kubectl_1.12.1-00
cp kubectl_1.12.1-00/usr/bin/kubectl kubectl
chmod u+x kubectl
mv kubectl /usr/local/bin/

# Check version:
kubectl version -o json 

# Step 5: Starting minikube
minikube start --registry-mirror=https://registry.docker-cn.com

# Step 6: Minikube Basic operations
# To check cluster status, run:
kubectl cluster-info

# Note that Minikube configuration file is located under
# ~/.minikube/machines/minikube/config.json
# To View Config, use:
kubectl config view

# To check running nodes:
kubectl get nodes

# Access minikube VM using ssh:
# minikube ssh

# To stop a running local kubernetes cluster, run:
# minikube stop

# To delete a local kubernetes cluster, use:
# minikube delete

# Step 7: Enable Kubernetes Dashboard
# minikube addons list

# To open directly on your default browser, use:
minikube dashboard

# To get the URL of the dashboard
# minikube dashboard --url