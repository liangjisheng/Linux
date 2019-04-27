#!/bin/bash

docker build -t liangjisheng/hello-node:v1 .
# push 之前先login docker hub
docker login
docker push liangjisheng/hello-node:v1
docker logout   # 退出登录

# 创建Deployment来管理Pod
# 这个create的时候，默认是从docker hub拉起镜像，所以上面构建好镜像后需上传到
# docker hub上，不然会image pull 失败
kubectl create deployment hello-node --image=liangjisheng/hello-node:v1
kubectl get deployments
kubectl get pods
kubectl get events
# kubectl config view

# 创建Service
# 默认情况，这Pod只能通过Kubernetes群集内部IP访问。要使hello-node容器从
# Kubernetes虚拟网络外部访问，须要使用Kubernetes Service暴露Pod
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
kubectl get services

# 通过--type=LoadBalancer flag来在群集外暴露Service，在支持负载均衡的云提供商上，
# 将配置外部IP地址来访问Service。在Minikube上，该LoadBalancer type使服务可以
# 通过minikube Service 命令访问
minikube service hello-node

# 最后可以查看到一些日志
# kubectl logs <POD-NAME>

# 现在可以删除在群集中创建的资源
kubectl delete service hello-node
kubectl delete deployment hello-node