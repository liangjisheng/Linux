# history

命令历史记录中加时间,默认 history 命令是没有时间的
通过下面命令让历史记录中带上命令执行时间

```shell
export HISTTIMEFORMAT='%F %T '
```

如果想要实现更细化的记录, 比如登陆过系统的用户、IP地址、操作命令以及操作时间一一对应
可以通过在/etc/profile里面加入以下代码实现

```shell
export HISTTIMEFORMAT="%F %T `who \-u am i 2>/dev/null| awk '{print $NF}'|sed \-e 's/[()]//g'` `whoami` "
```
