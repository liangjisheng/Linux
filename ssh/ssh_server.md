# ssh server

[server](https://wangdoc.com/ssh/server)  

SSH 的架构是服务器/客户端模式，两端运行的软件是不一样的。OpenSSH 的客户端软件是 ssh，服务器软件是 sshd。本章介绍 sshd 的各种知识。

如果没有安装 sshd，可以用下面的命令安装

```shell
# Debian
$ sudo aptitude install openssh-server

# Red Hat
$ sudo yum install openssh-server
```

一般来说，sshd 安装后会跟着系统一起启动。如果当前 sshd 没有启动，可以用下面的命令启动。

```shell
sshd
```

上面的命令运行后，如果提示“sshd re-exec requires execution with an absolute path”，就需要使用绝对路径来启动。这是为了防止有人出于各种目的，放置同名软件在$PATH变量指向的目录中，代替真正的 sshd。

```shell
# Centos、Ubuntu、OS X
$ /usr/sbin/sshd
```

上面的命令运行以后，sshd 自动进入后台，所以命令后面不需要加上&。

除了直接运行可执行文件，也可以通过 Systemd 启动 sshd。

```shell
# 启动
$ sudo systemctl start sshd.service

# 停止
$ sudo systemctl stop sshd.service

# 重启
$ sudo systemctl restart sshd.service
```

下面的命令让 sshd 在计算机下次启动时自动运行。

```shell
sudo systemctl enable sshd.service
```

## sshd 配置文件

sshd 的配置文件在/etc/ssh目录，主配置文件是sshd_config，此外还有一些安装时生成的密钥。

具体配置项可以参考[这个](https://wangdoc.com/ssh/server)  
