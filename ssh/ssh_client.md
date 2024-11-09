# ssh tutorial

[ssh tutorial github](https://github.com/wangdoc/ssh-tutorial)  
[ssh tutorial](https://wangdoc.com/ssh/)  

Linux 系统一般都自带 ssh，如果没有就需要安装

```shell
# Ubuntu 和 Debian
$ sudo apt install openssh-client
# CentOS 和 Fedora
$ sudo dnf install openssh-clients
# 查看版本号
ssh -V
```

```shell
ssh user@hostname
# 使用ssh的-l参数指定，这样的话，用户名和主机名就不用写在一起了
ssh -l username host
# ssh 默认连接服务器的22端口，-p参数可以指定其他端口。
ssh -p 8821 foo.com
# 下面的命令可以查看某个公钥的指纹
# 所谓“服务器指纹”，指的是 SSH 服务器公钥的哈希值。每台 SSH 服务器都有唯一一对密钥，用于跟客户端通信，其中公钥的哈希值就可以用来识别服务器。
ssh-keygen -l -f /etc/ssh/ssh_host_ecdsa_key.pub
```

ssh 会将本机连接过的所有服务器公钥的指纹，都储存在本机的~/.ssh/known_hosts文件中。每次连接服务器时，通过该文件判断是否为陌生主机（陌生公钥）

服务器指纹可以防止有人恶意冒充远程主机。如果服务器的密钥发生变更（比如重装了 SSH 服务器），客户端再次连接时，就会发生公钥指纹不吻合的情况。这时，客户端就会中断连接，并显示一段警告信息。

```txt
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that the RSA host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
77:a5:69:81:9b:eb:40:76:7b:13:04:a9:6c:f4:9c:5d.
Please contact your system administrator.
Add correct host key in /home/me/.ssh/known_hosts to get rid of this message.
Offending key in /home/me/.ssh/known_hosts:36
```

上面这段文字的意思是，该主机的公钥指纹跟~/.ssh/known_hosts文件储存的不一样，必须处理以后才能连接。这时，你需要确认是什么原因，使得公钥指纹发生变更，到底是恶意劫持，还是管理员变更了 SSH 服务器公钥。

如果新的公钥确认可以信任，需要继续执行连接，你可以执行下面的命令，将原来的公钥指纹从~/.ssh/known_hosts文件删除。

```shell
ssh-keygen -R hostname
```

上面命令中，hostname是发生公钥变更的主机名。

除了使用上面的命令，你也可以手工修改known_hosts文件，将公钥指纹删除。

删除了原来的公钥指纹以后，重新执行 ssh 命令连接远程服务器，将新的指纹加入known_hosts文件，就可以顺利连接了。

## 执行远程命令

一种执行远程命令的方法，是将命令直接写在ssh命令的后面

```shell
$ ssh username@hostname command
# 上面的命令会使得 SSH 在登录成功后，立刻在远程主机上执行命令command
$ ssh foo@server.example.com cat /etc/hosts
```

采用这种语法执行命令时，ssh 客户端不会提供互动式的 Shell 环境，而是直接将远程命令的执行结果输出在命令行。但是，有些命令需要互动式的 Shell 环境，这时就要使用-t参数。

```shell
# 报错
$ ssh remote.server.com emacs
emacs: standard input is not a tty

# 不报错
$ ssh -t server.example.com emacs
```

## 位置

SSH 客户端的全局配置文件是/etc/ssh/ssh_config，用户个人的配置文件在~/.ssh/config，优先级高于全局配置文件

~/.ssh/identity：用于 SSH 协议版本1 的 RSA 私钥。
~/.ssh/identity.pub：用于 SSH 协议版本1 的 RSA 公钥。
~/.ssh/known_hosts：包含 SSH 服务器的公钥指纹。

## 主机设置

用户个人的配置文件~/.ssh/config，可以按照不同服务器，列出各自的连接参数，从而不必每一次登录都输入重复的参数。下面是一个例子

```conf
Host remoteserver
     HostName remote.example.com
     User neo
     Port 2112

Host *
     Port 2222
```

上面代码中，Host remoteserver表示，下面的设置只对主机remoteserver生效。remoteserver只是一个别名，具体的主机由HostName命令指定，User和Port这两项分别表示用户名和端口。HostName、User、Port这三项前面的缩进并不是必需的，只是为了视觉上易于识别针对不同主机的设置。

后面的Host *表示对所有主机生效，*是一个通配符，比如Host *.edu表示只对一级域名为.edu的主机生效。这条命令下面的Port 2222表示所有主机的默认连接端口都是2222，这样就不用在登录时特别指定端口了。

注意，当 Host*与Host remoteserver下面有同一项设定时（比如两者都有Port设定），第一个出现的值生效。在本例中，连接remoteserver时，默认端口将是2112，而不是2222，如果 Host* 放在配置文件的顶部，那么默认端口将是2222。

以后，登录remote.example.com时，只要执行ssh remoteserver命令，就会自动套用 config 文件里面指定的参数。

```shell
$ ssh remoteserver
# 等同于
$ ssh -p 2112 neo@remote.example.com
```

## 客户端配置

~/.ssh/config 文件

下面是 ssh 客户端的一些主要配置命令，以及它们的范例值。

AddressFamily inet：表示只使用 IPv4 协议。如果设为inet6，表示只使用 IPv6 协议。

BindAddress 192.168.10.235：指定本机的 IP 地址（如果本机有多个 IP 地址）

CheckHostIP yes：检查 SSH 服务器的 IP 地址是否跟公钥数据库吻合。

Ciphers blowfish,3des：指定加密算法。

Compression yes：是否压缩传输信号。

ConnectionAttempts 10：客户端进行连接时，最大的尝试次数。

ConnectTimeout 60：客户端进行连接时，服务器在指定秒数内没有回复，则中断连接尝试。

DynamicForward 1080：指定动态转发端口。

GlobalKnownHostsFile /users/smith/.ssh/my_global_hosts_file：指定全局的公钥数据库文件的位置。

Host server.example.com：指定连接的域名或 IP 地址，也可以是别名，支持通配符。Host命令后面的所有配置，都是针对该主机的，直到下一个Host命令为止。

HostKeyAlgorithms ssh-dss,ssh-rsa：指定密钥算法，优先级从高到低排列。

HostName myserver.example.com：在Host命令使用别名的情况下，HostName指定域名或 IP 地址。

IdentityFile keyfile：指定私钥文件。

LocalForward 2001 localhost:143：指定本地端口转发。

LogLevel QUIET：指定日志详细程度。如果设为QUIET，将不输出大部分的警告和提示。

MACs hmac-sha1,hmac-md5：指定数据校验算法。

NumberOfPasswordPrompts 2：密码登录时，用户输错密码的最大尝试次数。

PasswordAuthentication no：指定是否支持密码登录。不过，这里只是客户端禁止，真正的禁止需要在 SSH 服务器设置。

Port 2035：指定客户端连接的 SSH 服务器端口。

PreferredAuthentications publickey,hostbased,password：指定各种登录方法的优先级。

Protocol 2：支持的 SSH 协议版本，多个版本之间使用逗号分隔。

PubKeyAuthentication yes：是否支持密钥登录。这里只是客户端设置，还需要在 SSH 服务器进行相应设置。

RemoteForward 2001 server:143：指定远程端口转发。

SendEnv COLOR：SSH 客户端向服务器发送的环境变量名，多个环境变量之间使用空格分隔。环境变量的值从客户端当前环境中拷贝。

ServerAliveCountMax 3：如果没有收到服务器的回应，客户端连续发送多少次keepalive信号，才断开连接。该项默认值为3。

ServerAliveInterval 300：客户端建立连接后，如果在给定秒数内，没有收到服务器发来的消息，客户端向服务器发送keepalive消息。如果不希望客户端发送，这一项设为0，即客户端不会主动断开连接。

StrictHostKeyChecking yes：yes表示严格检查，服务器公钥为未知或发生变化，则拒绝连接。no表示如果服务器公钥未知，则加入客户端公钥数据库，如果公钥发生变化，不改变客户端公钥数据库，输出一条警告，依然允许连接继续进行。ask（默认值）表示询问用户是否继续进行。

TCPKeepAlive yes：客户端是否定期向服务器发送keepalive信息。

User userName：指定远程登录的账户名。

UserKnownHostsFile /users/smith/.ssh/my_local_hosts_file：指定当前用户的known_hosts文件（服务器公钥指纹列表）的位置。

VerifyHostKeyDNS yes：是否通过检查 SSH 服务器的 DNS 记录，确认公钥指纹是否与known_hosts文件保存的一致。
