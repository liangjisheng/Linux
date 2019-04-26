#!/bin/bash

sudo apt-get update
sudo cd /etc/apt/sources.list.d/
echo "deb [arch=amd64] https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main" > kubernetes.list
sudo apt-get update

# 如果出现如下错误
# GPG错误：http：//mirrors.ustc.edu.cn/kubernetes/apt kubernetes-xenial InRelease：由于没有公司，无法验证下列签名：NO_PUBKEY 6A030B21BA07F4FB
# E：仓库“http://mirrors.ustc.edu.cn/kubernetes/apt kubernetes-xenial InRelease”没有数字签名。
# N：无法安全地用该源进行更新，所以默认禁用该源。
# 运行
gpg --keyserver keyserver.ubuntu.com --recv-keys BA07F4FB
gpg -a --export 6A030B21BA07F4FB | sudo apt-key add - 
# 返回OK，说明成功

# install kubectl kubeadm kubelet
curl -Lo kubectl.deb https://mirrors.ustc.edu.cn/kubernetes/apt/pool/kubectl_1.12.1-00_amd64_f02235e5b8633b589e6f7c39a581b29bef4ea723f52812c152a609302073e5fe.deb
mkdir kubectl_1.12.1-00
dpkg -X kubectl.deb kubectl_1.12.1-00
cp kubectl_1.12.1-00/usr/bin/kubectl kubectl
chmod u+x kubectl
mv kubectl /usr/local/bin/
rm -rf kubectl_1.12.1-00
rm kubectl.deb

curl -Lo kubeadm.deb https://mirrors.ustc.edu.cn/kubernetes/apt/pool/kubeadm_1.12.1-00_amd64_3caa0392444658082aa459418728abf81e440f439960963f54f08c6e6fdefbd3.deb
mkdir kubeadm_1.12.1-00
dpkg -X kubeadm.deb kubeadm_1.12.1-00
cp kubeadm_1.12.1-00/usr/bin/kubeadm kubeadm
chmod u+x kubeadm
mv kubeadm /usr/local/bin/
rm -rf kubeadm_1.12.1-00
rm kubeadm.deb

curl -Lo kubelet.deb https://mirrors.ustc.edu.cn/kubernetes/apt/pool/kubelet_1.12.1-00_amd64_ae75f76207874c43f7e20e8184265e6a9fe38ef0c93e61115362280227bed23f.deb
mkdir kubelet_1.12.1-00
dpkg -X kubelet.deb kubelet_1.12.1-00
cp kubelet_1.12.1-00/usr/bin/kubelet kubelet
chmod u+x kubelet
mv kubelet /usr/local/bin/
rm -rf kubelet_1.12.1-00
rm kubelet.deb

# 关闭分区
sudo swapoff -a

# 获取要pull的镜像列表
# kubeadm config images list

# pull images
source ./autoPullImages.sh

# master node初始化
# 如果发现docker版本不合适,可能是因为docker版本太新(因为默认安装的是最新版本的docker,
# 就要卸了docker重装版本支持的docker,注:Ubuntu里docker称作docker.io

# 如果出现“Cannot connect to the Docker daemon at unix:///var/run/docker.sock. 
# Is the docker daemon running?”
# 执行以下命令：
# systemctl unmask docker.service
# systemctl unmask docker.socket
# systemctl start docker.service

sudo kubeadm init

# init成功后开始使用群集, 配置授权信息
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $（id -u）：$（id -g） $HOME/.kube/config

# 运行命令查询节点
kubectl get nodes
