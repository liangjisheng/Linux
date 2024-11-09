# README

[study](https://www.jianshu.com/p/b75d88e5aa61)
[type](https://blog.csdn.net/Sardkit/article/details/79911925)

1.vim /root/svc-test.py
1.vim /etc/systemd/system/svc-test.service
2.chmod u+x /etc/systemd/system/svc-test.service
3.sudo systemctl daemon-reload
4.sudo systemctl start svc-test

启动开机启动
sudo systemctl enable svc-test.service
禁用开机启动
sudo systemctl disable svc-test.service

要创建一个systemd服务，首先需要创建一个服务单元文件。服务单元文件通常存储在/etc/systemd/system目录下，以.service为扩展名

一个基本的服务单元文件包含以下几个关键部分：

[Unit]：定义服务的基本信息，如服务的描述、依赖关系等。
[Service]：定义服务的具体执行参数，如服务的执行命令、工作目录、用户、环境变量等。
[Install]：定义服务的安装信息，如服务的启动级别、依赖关系等。

```shell
# 启动服务
sudo systemctl start servicename
# 停止服务
sudo systemctl stop servicename
# 重启服务
sudo systemctl restart servicename
# 查看服务状态
sudo systemctl status servicename
# 启动开机启动
sudo systemctl enable servicename
# 禁用开机启动
sudo systemctl disable servicename
# 重新加载配置
sudo systemctl reload servicename
# 要显示系统中所有的服务
sudo systemctl list-units --type=service
# 查找特定服务
sudo systemctl list-units --type=service | grep ssh
```
