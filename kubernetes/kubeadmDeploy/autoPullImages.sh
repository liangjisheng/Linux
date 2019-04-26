#!/bin/bash

# 拉取用kubeadm部署单节点集群所用的k8s镜像

images=(kube-proxy-amd64:v1.12.1 
        kube-scheduler-amd64:v1.12.1 
        kube-controller-manager-amd64:v1.12.1 
        kube-apiserver-amd64:v1.12.1 
        etcd-amd64:3.2.24 
        pause-amd64:3.1 
        kubernetes-dashboard-amd64:v1.10.0 
        k8s-dns-sidecar-amd64:1.14.8 
        k8s-dns-kube-dns-amd64:1.14.8
        k8s-dns-dnsmasq-nanny-amd64:1.14.8)

for imageName in ${images[@]}
do
    # echo "$imageName"
    docker pull mirrorgooglecontainers/$imageName
    docker tag mirrorgooglecontainers/$imageName k8s.gcr.io/$imageName
    # docker rmi mirrorgooglecontainers/$imageName
done

for n in $(docker images|awk '{print $1":"$2}'|grep -v REPOSITORY)
do
    # echo "$n"
    docker tag $n `echo $n|sed 's/-amd64//g'`
    # docker rmi $n
done

docker tag k8s.gcr.io/kubernetes-dashboard:v1.10.0  k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.0

docker pull coredns/coredns:1.2.2 
docker tag coredns/coredns:1.2.2 k8s.gcr.io/coredns:1.2.2
# docker rmi coredns/coredns:1.2.2

docker pull registry.cn-hangzhou.aliyuncs.com/anoy/kube-addon-manager:v8.6
docker tag  registry.cn-hangzhou.aliyuncs.com/anoy/kube-addon-manager:v8.6  k8s.gcr.io/kube-addon-manager:v8.6
# docker rmi registry.cn-hangzhou.aliyuncs.com/anoy/kube-addon-manager:v8.6

docker pull registry.cn-hangzhou.aliyuncs.com/anoy/storage-provisioner:v1.8.1
docker tag registry.cn-hangzhou.aliyuncs.com/anoy/storage-provisioner:v1.8.1 gcr.io/k8s-minikube/storage-provisioner:v1.8.1
# docker rmi registry.cn-hangzhou.aliyuncs.com/anoy/storage-provisioner:v1.8.1
