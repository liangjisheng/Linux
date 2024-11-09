# ssh log

SSH 在服务器端可以生成日志，记录登录当前服务器的情况。

SSH 日志是写在系统日志当中的，查看的时候需要从系统日志里面找到跟 SSH 相关的记录。

如果系统使用 Systemd，可以使用journalctl命令查看日志

```shell
journalctl -u ssh
```

上面示例中，返回的日志每一行就是一次登录尝试，按照从早到晚的顺序，其中包含了登录失败的尝试。-u参数是 Unit 单元的意思，-u ssh就是查看 SSH 单元，有的发行版需要写成-u sshd

```shell
# -b0参数可以查看自从上次登录后的日志
$ journalctl -t ssh -b0
# -r参数表示逆序输出，最新的在前面
$ journalctl -t ssh -b0 -r
# since和until参数可以指定日志的时间范围
$ journalctl -u ssh --since yesterday # 查看昨天的日志
$ journalctl -u ssh --since -3d --until -2d # 查看三天前的日志
$ journalctl -u ssh --since -1h # 查看上个小时的日志
$ journalctl -u ssh --until "2022-03-12 07:00:00" # 查看截至到某个时间点的日志
# 查看实时日志
$ journalctl -fu ssh
```

如果系统没有使用 Systemd，可以在/var/log/auth.log文件中找到 sshd 的日志。

```shell
$ sudo grep sshd /var/log/auth.log
# 下面的命令查看最后 500 行里面的 sshd 条目
$ sudo tail -n 500 /var/log/auth.log | grep sshd
# -f参数可以实时跟踪日志
$ sudo tail -f -n 500 /var/log/auth.log | grep sshd
# 如果只是想看谁登录了系统，而不是深入查看所有细节，可以使用lastlog命令
$ lastlog
```

sshd 的配置文件/etc/ssh/sshd_config，可以调整日志级别

LogLevel VERBOSE

如果为了调试，可以将日志调整为 DEBUG

LogLevel DEBUG
