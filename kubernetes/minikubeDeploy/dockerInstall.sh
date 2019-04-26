#!/bin/bash

# uninstall to install point docker version.
sudo apt-get remove docker docker-engine docker-ce docker.io

sudo apt-get update

# 安装以下包以使apt可以通过HTTPS使用存储库（repository）
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
# 添加Docker官方的GPG密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 设置stable存储库
# deb [arch=amd64] https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
sudo add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main"

sudo apt-get update

# 安装最新版本docker
# sudo apt-get install -y docker-ce

# 列出可用版本，安装指定版本
# apt-cache madison docker-ce
sudo apt-get install docker-ce=18.06.1~ce~3-0~ubuntu

# 验证docker
systemctl status docker | head -10