# 密钥登录

[key login](https://wangdoc.com/ssh/key)  

SSH 密钥登录分为以下的步骤。

预备步骤，客户端通过ssh-keygen生成自己的公钥和私钥。

第一步，手动将客户端的公钥放入远程服务器的指定位置。

第二步，客户端向服务器发起 SSH 登录的请求。

第三步，服务器收到用户 SSH 登录的请求，发送一些随机数据给用户，要求用户证明自己的身份。

第四步，客户端收到服务器发来的数据，使用私钥对数据进行签名，然后再发还给服务器。

第五步，服务器收到客户端发来的加密签名后，使用对应的公钥解密，然后跟原始数据比较。如果一致，就允许用户登录。

## ssh-keygen

OpenSSH 提供了一个工具程序ssh-keygen命令，用来生成密钥

-t 参数用来指定密钥的加密算法
-b 参数指定密钥的二进制位数。这个参数值越大，密钥就越不容易破解，但是加密解密的计算开销也会加大
-C 参数可以为密钥文件指定新的注释
-f 参数指定生成的私钥文件
-F 参数检查某个主机名是否在known_hosts文件里面
-N 参数用于指定私钥的密码（passphrase）
-p 参数用于重新指定私钥的密码（passphrase）。它与-N的不同之处在于，新密码不在命令中指定，而是执行后再输入。ssh 先要求输入旧密码，然后要求输入两遍新密码。
-R 参数将指定的主机公钥指纹移出known_hosts文件

```shell
ssh-keygen -f ~/.ssh/id_ed25519_liangjisheng -t ed25519
ssh-keygen -f ~/.ssh/id_rsa_deploy -t rsa -b 4096 -C deploy_artgo
ssh-keygen -F example.com
ssh-keygen -R example.com
```

## 手动上传公钥

生成密钥以后，公钥必须上传到服务器，才能使用公钥登录。

OpenSSH 规定，用户公钥保存在服务器的~/.ssh/authorized_keys文件。你要以哪个用户的身份登录到服务器，密钥就必须保存在该用户主目录的~/.ssh/authorized_keys文件。只要把公钥添加到这个文件之中，就相当于公钥上传到服务器了。每个公钥占据一行。如果该文件不存在，可以手动创建。

用户可以手动编辑该文件，把公钥粘贴进去，也可以在本机计算机上，执行下面的命令。

```shell
cat ~/.ssh/id_rsa.pub | ssh user@host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

注意，authorized_keys文件的权限要设为644，即只有文件所有者才能写。如果权限设置不对，SSH 服务器可能会拒绝读取该文件。

```shell
chmod 644 ~/.ssh/authorized_keys
```

## ssh-copy-id 自动上传公钥

OpenSSH 自带一个ssh-copy-id命令，可以自动将公钥拷贝到远程服务器的~/.ssh/authorized_keys文件。如果~/.ssh/authorized_keys文件不存在，ssh-copy-id命令会自动创建该文件。

用户在本地计算机执行下面的命令，就可以把本地的公钥拷贝到服务器。

```shell
ssh-copy-id -i key_file user@host
ssh-copy-id -i id_rsa user@host
```

上面命令中，-i参数用来指定公钥文件，user是所要登录的账户名，host是服务器地址。如果省略用户名，默认为当前的本机用户名。执行完该命令，公钥就会拷贝到服务器。

注意，公钥文件可以不指定路径和.pub后缀名，ssh-copy-id会自动在~/.ssh目录里面寻找。

上面命令中，公钥文件会自动匹配到 ~/.ssh/id_rsa.pub

ssh-copy-id会采用密码登录，系统会提示输入远程服务器的密码。

注意，ssh-copy-id是直接将公钥添加到authorized_keys文件的末尾。如果authorized_keys文件的末尾不是一个换行符，会导致新的公钥添加到前一个公钥的末尾，两个公钥连在一起，使得它们都无法生效。所以，如果authorized_keys文件已经存在，使用ssh-copy-id命令之前，务必保证authorized_keys文件的末尾是换行符（假设该文件已经存在）。

## ssh-agent

私钥设置了密码以后，每次使用都必须输入密码，有时让人感觉非常麻烦。比如，连续使用scp命令远程拷贝文件时，每次都要求输入密码。

ssh-agent命令就是为了解决这个问题而设计的，它让用户在整个 Bash 对话（session）之中，只在第一次使用 SSH 命令时输入密码，然后将私钥保存在内存中，后面都不需要再输入私钥的密码了。

[使用参考](https://wangdoc.com/ssh/key)  

## ssh-add

ssh-add命令用来将私钥加入ssh-agent，它有如下的参数

```shell
# 把对应的私钥重新加入到 mac 的 keychain 服务
ssh-add -K /Users/liangjisheng/.ssh/id_rsa
# -d参数从内存中删除指定的私钥
ssh-add -d name-of-key-file
# -D参数从内存中删除所有已经添加的私钥
ssh-add -D
# -l参数列出所有已经添加的私钥
ssh-add -l
```

## 关闭密码登录

为了安全性，启用密钥登录之后，最好关闭服务器的密码登录。

对于 OpenSSH，具体方法就是打开服务器 sshd 的配置文件/etc/ssh/sshd_config，将PasswordAuthentication这一项设为no

```conf
PasswordAuthentication no
```

修改配置文件以后，不要忘了重新启动 sshd，否则不会生效。
