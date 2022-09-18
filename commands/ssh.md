# ssh

[ssh](https://blog.csdn.net/weixin_40274679/article/details/108520756)

SSH 不仅仅能够自动加密和解密SSH客户端与服务端之间的网络数据，同时SSH 还提供了一个非常有用的功能，那就是端口转发，即 将TCP 端口的网络数据，转发到指定主机的某个端口上，在转发的同时会对数据进行相应的加密及解密。如果工作环境中的防火墙限制了一些网络端口的使用，但是允许SSH连接，那么也是能够通过使用SSH转发后的端口进行通信

SSH端口转发，主要分为本地转发与远程转发两种类型

本地转发, 由本地网络服务器的某个端口，转发到远程服务器某个端口
ssh -L 本地网卡地址:本地端口:目标地址:目标端口 用户@目标地址
将本地的3306端口，转发到192.168.13.142的3306端口
ssh -L 127.0.0.1:3306:127.0.0.1:3306 root@192.168.13.142

远程转发, 由远程服务器的某个端口，转发到本地网络的服务器某个端口
ssh -R 远程网卡地址:远程端口:目标地址:目标端口 远程用户@远程地址

SSH的远程操作
机器A(192.168.13.148)
机器B(192.168.13.149)

在机器A中查看机器B的操作系统类型
ssh root@192.168.13.149 'uname -a'

将机器A中test文件夹复制到B机器
tar -cz test | ssh root@192.168.13.149 'tar -xz'
也可以用scp 或则 rz 传输文件

在机器A上查看B机器是否监听了1080端口
ssh user@192.168.13.149 'netstat -tln | grep 1080'

假设A机器上面，启动了Nginx服务
希望B机器也能够这样使用A机器上面的服务。需要把B机器上面80端口请求，转发到A机器上面
在B机器上面，执行如下代码
ssh -f -N -L 127.0.0.1:80:192.168.13.148:80 user@192.168.13.148
在B机器 curl 127.0.0.1:80 访问A机器服务

上面的需求也可以使用远程转发实现
在A机器上面执行如下代码
ssh -f -N -R 8081:127.0.0.1:80 user@192.168.13.149
监听了B机器的 8081 端口，把该端口的请求，转发到A机器的80端口
在B机器 curl 127.0.0.1:8081 访问A机器服务

## 使用多个公钥

默认测试方式

```shell
ssh -T git@github.com
```

重启电脑后，如果遇到个人和公司的代码不能同时提交，且报下面的错误的话

Permission to liangjisheng/go-books.git denied to liangjishengzks

则在终端执行下这个命令，意思是把对应的私钥重新加入到 mac 的 keychain 服务中去

```shell
ssh-add -K /Users/liangjisheng/.ssh/id_rsa
ssh-add -K /Users/liangjisheng/.ssh/id_rsa_liangjisheng
ssh-add -K /Users/liangjisheng/.ssh/id_rsa_web3
```

## 增加 ssh 秘钥

生成公私钥

```shell
ssh-keygen -t rsa -f ~/.ssh/id_rsa_web3 -C "liangjisheng@web3.com"
```

在 ~/.ssh/config 文件中增加配置

Host: 自己取的名字, 可以是任何字符串
HostName: ssh 克隆时地址中的网站的名字
User: 默认使用的用户 git, 克隆时用户都是 git, 所以设为 git 就行
IdentityFile: 生成密钥时的私钥文件

```conf
Host web3.github.com
Hostname github.com
User git
IdentityFile ~/.ssh/id_rsa_web3
```

对应不同的名称，要用 Host 的名称来区分测试

```shell
# 这里的值是上面定义的 Hosts, 因为上面已经指定 User 为 git,所以可以省略
ssh -T web3.github.com
# 或者
ssh -T git@web3.github.com
```

如果测试有问题可以试试配置 ssh key 代理

```shell
# 查看系统ssh-key代理
ssh-add -l

# 以上命令如果输出 The agent has no identities. 则表示没有代理
# 如果系统有代理，可以执行下面的命令清除代理, 但不需要, 之前的就让它存在就好了
# ssh-add -D

# 然后依次将不同的ssh添加代理
ssh-add ~/.ssh/id_rsa_web3
# 如果使用 ssh-add ~/.ssh/id_rsa的时候报如下错误，则需要先运行一下 ssh-agent bash 命令后再执行 ssh-add …命令
# Could not open a connection to your authentication agent.

# 再次测试
ssh -T git@web3.github.com
```

clone code

```shell
# ssh 原 url
# git clone git@github.com:web3-internal/oases-server.git

# 需要修改为
git clone web3.github.com:web3-internal/oases-server.git
# ~/.ssh/config 中已经指定 User 为 git, 所以可以省略
# 或者
git clone git@web3.github.com:web3-internal/oases-server.git
```

使用 ssh 克隆时, 系统会先查找 ~/.ssh/config 中的配置, 如果没有找到则会使用默认的密钥文件 ~/.ssh/id_rsa
所以如果你网站绑定的是 ~/.ssh/id_rsa.pub 则完全没有必要在 ~/.ssh/config 中配置

一个小技巧, 当重装系统时, 可以保存好目录 ~/.ssh, 重装完系统后, 安装好 git, 再把保存的 ~/.ssh 目录放到用户目录下就可以了
这样不用重新配置 git 的 ssh key, 也不用重新到网站绑定

配置本仓库 user.name and user.email

```shell
git config user.name "web3liangjisheng"
git config user.email "liangjisheng@web3.com"
```
