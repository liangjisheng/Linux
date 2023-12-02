# ssh

[ssh 客户端配置](https://ohmyweekly.github.io/notes/2020-10-01-ssh-configuration/)
[ssh 客户端配置](https://goteleport.com/blog/ssh-config/)
[ssh 正确使用](https://goteleport.com/blog/how-to-ssh-properly/)
[Teleport OpenSSH 的现代替代品](https://github.com/gravitational/teleport)

ssh-keygen 生成 ed25519 公私钥

```shell
ssh-keygen -f ~/.ssh/id_ed25519_liangjisheng -t ed25519
```

ssh 客户端配置
ssh 客户端从三个地方读取配置，顺序如下

1. 系统范围内的 /etc/ssh/ssh_config
2. 在 ~/.ssh/ssh_config 中的用户特定配置
3. 直接提供给 ssh 的命令行标志

命令行标志，可以覆盖用户特定的配置，可以覆盖全局配置

mac 上的客户端配置文件应该是 ~/.ssh/config

## 常用配置

* port - 远程 ssh 守护进程运行的端口。如果守护进程运行在默认的 22 号端口上，则不需要定义这个选项。在不同的端口上运行 ssh 守护进程被认为是一个很好的做法，因为这样可以减少僵尸探测的数量。
* Hostname - 用于建立连接的真实主机名，如 DNS 或 IP 地址。这对缩短主机名很有用。例如，你可以让一个方便的 ssh mongo 带你到 mongo-12.staging.example.com
* ProxyJump - 这个选项将通过连接的服务器进行隧道简化为一个标志，-J，用一个别名来命名中间主机（本地客户端和最终目的地之间的主机）。这只适用于较新的客户端（OpenSSH 7.3+）
* orwardAgent & AddKeysToAgent - 在主机之间跳转（当你在另一个 ssh 会话中再次键入 ssh 时）需要重复验证。要做到这一点，ssh 凭证必须存储在中间服务器上，但这不是一个安全的做法。这两个选项允许另一个通常被称为 ssh-agent 的进程自动将你的本地 ssh 凭证加载到内存中，并通过一个安全转发的 UNIX 套接字将其提供给中间机器的 ssh 客户端。ForwardAgent 可以实现这种转发行为，而 AddKeysToAgent 则可以自动将密钥加载到内存中
* IdentityFile - 这个选项指定了 ssh 客户端应该尝试验证的密钥的路径。这并不妨碍 ssh 客户端尝试 ~/.ssh 或 ssh-agent 中的密钥。常用于由于某种原因，密钥没有存储在默认位置的情况下。
* IdentitiesOnly - 通常和 IdentityFile 一起使用，这个选项会告诉 ssh 客户端到底要提交哪个密钥，并放弃 ~/.ssh 或 ssh-agent 中的任何密钥。因为如果尝试了太多无效的密钥，ssh 会抛出一个认证错误，这个选项可以帮助客户端精确地识别要提交的密钥。即使在 ssh_config 中启用了 IdentitiesOnly，任何在命令行输入的身份信息也会被尝试。
* CertificateFile - 考虑到密钥在很大程度上已经过时了，这个选项可以和 IdentityFile 一起使用来指定要提交的证书。这并不总是必要的。当证书颁发机构签署一个密钥来创建证书时，-cert.pub 将自动附加到密钥的文件名中。在加载密钥之前，ssh 客户端将首先尝试使用预期的命名惯例从提供的文件名中加载证书。然而，如果密钥和证书文件名不遵循这种模式，那么必须使用 CertificateFile，否则将无法找到证书。
* SetEnv & SendEnv - 这些选项允许 ssh 客户端向指定的主机发送本地环境变量。主机服务器必须通过在 /etc/ssh/sshd_config 中将 AcceptEnv 设置为 Yes 来接受这些环境变量
* ServerAliveInterval & ServerAliveCountMax -如果 ssh 客户端在指定的时间间隔内没有收到任何数据，它将请求主机服务器做出响应。这可以防止负载均衡器和服务器因不活动而放弃连接。
* HostKeyAlias - ssh 客户端会被指示使用 ~/.ssh/known_hosts 中的密钥别名，而不是 HostName。这对于具有动态变化的 IP 地址的主机或在一台主机上运行的多个服务器来说非常有用。
* PreferredAuthentication - 这个选项决定了验证方法的尝试顺序。默认值是 gssapi-with-mic, hostbased, publickey, keyboard-interactive 和 password.

```conf
Host github.com
  User git
  ProxyCommand nc -v -x 127.0.0.1:11086 %h %p
  IdentityFile ~/.ssh/id_rsa
  ; PasswordAuthentication no
  ; PubKeyAuthentication yes

Host github-liangjisheng
  HostName github.com
  User git
  ; Port 1024
  ProxyCommand nc -v -x 127.0.0.1:11086 %h %p
  Preferredauthentications publickey
  IdentityFile ~/.ssh/id_rsa_liangjisheng

Host *
  ForwardAgent yes
  IdentitiesOnly yes
  AddKeysToAgent yes
  ServerAliveInterval 60
  StrictHostKeyChecking no
```

需要注意的是。因为 ssh 客户端是按顺序解释选项的, 通用配置该放在文件的底部。如果放在最上面，在客户端读取下面的特定主机选项之前，选项值就会被固定下来。在上面的案例中，把 (Host *) 放在文件的开头会导致用户为 Default
