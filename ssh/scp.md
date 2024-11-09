# scp

```shell
scp source destination
scp user@host:foo.txt bar.txt
```

上面命令将远程主机（user@host）用户主目录下的foo.txt，复制为本机当前目录的bar.txt。可以看到，主机与文件之间要使用冒号（:）分隔。

```shell
# scp支持一次复制多个文件
$ scp source1 source2 destination
```

上面命令会将source1和source2两个文件，复制到destination。

注意，如果所要复制的文件，在目标位置已经存在同名文件，scp会在没有警告的情况下覆盖同名文件。

## 用法示例

本地文件复制到远程

```shell
$ scp SourceFile user@host:directory/TargetFile
$ scp file.txt remote_username@10.10.0.2:/remote/directory

# 将本机的 documents 目录拷贝到远程主机
# 会在远程主机创建 documents 目录
$ scp -r documents username@server_ip:/path_to_remote_directory

# 将本机整个目录拷贝到远程目录下
$ scp -r localmachine/path_to_the_directory username@server_ip:/path_to_remote_directory/

# 将本机目录下的所有内容拷贝到远程目录下
$ scp -r localmachine/path_to_the_directory/* username@server_ip:/path_to_remote_directory/
```

远程文件复制到本地

```shell
$ scp user@host:directory/SourceFile TargetFile
$ scp remote_username@10.10.0.2:/remote/file.txt /local/directory

# 拷贝一个远程目录到本机目录下
$ scp -r username@server_ip:/path_to_remote_directory local-machine/path_to_the_directory/

# 拷贝远程目录下的所有内容，到本机目录下
$ scp -r username@server_ip:/path_to_remote_directory/* local-machine/path_to_the_directory/
$ scp -r user@host:directory/SourceFolder TargetFolder
```

两个远程系统之间的复制

```shell
# 系统将提示你输入两个远程帐户的密码。数据将直接从一个远程主机传输到另一个远程主机
$ scp user@host1:directory/SourceFile user@host2:directory/SourceFile
$ scp user1@host1.com:/files/file.txt user2@host2.com:/files
```

## 配置项

```shell
# -c参数用来指定文件拷贝数据传输的加密算法
$ scp -c blowfish some_file your_username@remotehost.edu:~
# -C参数表示是否在传输时压缩文件
$ scp -c blowfish -C local_file your_username@remotehost.edu:~
# -F参数用来指定 ssh_config 文件，供 ssh 使用
$ scp -F /home/pungki/proxy_ssh_config Label.pdf root@172.20.10.8:/root
# -i参数用来指定密钥
$ scp -vCq -i private_key.pem ~/test.txt root@192.168.1.3:/some/path/test.txt
# -l参数用来限制传输数据的带宽速率，单位是 Kbit/sec。对于多人分享的带宽，这个参数可以留出一部分带宽供其他人使用
$ scp -l 80 yourusername@yourserver:/home/yourusername/* .
# 上面代码中，scp命令占用的带宽限制为每秒 80K 比特位，即每秒 10K 字节

# -p参数用来保留修改时间（modification time）、访问时间（access time）、文件状态（mode）等原始文件的信息。
$ scp -p ~/test.txt root@192.168.1.3:/some/path/test.txt
# -P参数用来指定远程主机的 SSH 端口。如果远程主机使用默认端口22，可以不用指定，否则需要用-P参数在命令中指定。
$ scp -P 2222 user@host:directory/SourceFile TargetFile
# -q参数用来关闭显示拷贝的进度条
$ scp -q Label.pdf mrarianto@202.x.x.x:.

# -r参数表示是否以递归方式复制目录
# -v参数用来显示详细的输出
$ scp -v ~/test.txt root@192.168.1.3:/root/help2356.txt
```
