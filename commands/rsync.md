# rsync

[rsync](https://wangdoc.com/ssh/rsync)  

rsync 是一个常用的 Linux 应用程序，用于文件同步。

它可以在本地计算机与远程计算机之间，或者两个本地目录之间同步文件（但不支持两台远程计算机之间的同步）。它也可以当作文件复制工具，替代cp和mv命令。

它名称里面的r指的是 remote，rsync 其实就是“远程同步”（remote sync）的意思。与其他文件传输工具（如 FTP 或 scp）不同，rsync 的最大特点是会检查发送方和接收方已有的文件，仅传输有变动的部分（默认规则是文件大小或修改时间有变动）

## install

```shell
# Debian
$ sudo apt-get install rsync

# Red Hat
$ sudo yum install rsync

# Arch Linux
$ sudo pacman -S rsync
```

注意，传输的双方都必须安装 rsync

## usage

rsync 可以用于本地计算机的两个目录之间的同步

### -r

```shell
rsync -r source destination
```

上面命令中，-r表示递归，即包含子目录。注意，-r是必须的，否则 rsync 运行不会成功。source目录表示源目录，destination表示目标目录。上面命令执行以后，目标目录下就会出现destination/source这个子目录。

如果有多个文件或目录需要同步，可以写成下面这样

```shell
rsync -r source1 source2 destination
```

### -a

-a参数可以替代-r，除了可以递归同步以外，还可以同步元信息（比如修改时间、权限等）。由于 rsync 默认使用文件大小和修改时间决定文件是否需要更新，所以-a比-r更有用。下面的用法才是常见的写法。

```shell
rsync -a source destination
```

目标目录destination如果不存在，rsync 会自动创建。执行上面的命令后，源目录source被完整地复制到了目标目录destination下面，即形成了destination/source的目录结构。

如果只想同步源目录source里面的内容到目标目录destination，则需要在源目录后面加上斜杠。

```shell
rsync -a source/ destination
```

上面命令执行后，source目录里面的内容，就都被复制到了destination目录里面，并不会在destination下面创建一个source子目录。

### -n

如果不确定 rsync 执行后会产生什么结果，可以先用-n或--dry-run参数模拟执行的结果

```shell
rsync -anv source/ destination
```

上面命令中，-n参数模拟命令执行的结果，并不真的执行命令。-v参数则是将结果输出到终端，这样就可以看到哪些内容会被同步。

### --delete

默认情况下，rsync 只确保源目录的所有内容（明确排除的文件除外）都复制到目标目录。它不会使两个目录保持相同，并且不会删除文件。如果要使得目标目录成为源目录的镜像副本，则必须使用--delete参数，这将删除只存在于目标目录、不存在于源目录的文件。

```shell
rsync -av --delete source/ destination
```

上面命令中，--delete参数会使得destination成为source的一个镜像

## 排除文件

有时，我们希望同步时排除某些文件或目录，这时可以用--exclude参数指定排除模式

```shell
$ rsync -av --exclude='*.txt' source/ destination
# 或者
$ rsync -av --exclude '*.txt' source/ destination
```

上面命令排除了所有 TXT 文件。

注意，rsync 会同步以“点”开头的隐藏文件，如果要排除隐藏文件，可以这样写--exclude=".*"

```shell
# 如果要排除某个目录里面的所有文件，但不希望排除目录本身，可以写成下面这样
$ rsync -av --exclude 'dir1/*' source/ destination
# 多个排除模式，可以用多个--exclude参数
$ rsync -av --exclude 'file1.txt' --exclude 'dir1/*' source/ destination
# 多个排除模式也可以利用 Bash 的大扩号的扩展功能，只用一个--exclude参数。
$ rsync -av --exclude={'file1.txt','dir1/*'} source/ destination
# 如果排除模式很多，可以将它们写入一个文件，每个模式一行，然后用--exclude-from参数指定这个文件。
$ rsync -av --exclude-from='exclude-file.txt' source/ destination
```

--include参数用来指定必须同步的文件模式，往往与--exclude结合使用

```shell
rsync -av --include="*.txt" --exclude='*' source/ destination
```

上面命令指定同步时，排除所有文件，但是会包括 TXT 文件

## 远程同步

### ssh 协议

rsync 除了支持本地两个目录之间的同步，也支持远程同步。它可以将本地内容，同步到远程服务器。

```shell
$ rsync -av source/ username@remote_host:destination
# 也可以将远程内容同步到本地。
$ rsync -av username@remote_host:source/ destination
```

rsync 默认使用 SSH 进行远程登录和数据传输。

由于早期 rsync 不使用 SSH 协议，需要用-e参数指定协议，后来才改的。所以，下面-e ssh可以省略。

```shell
rsync -av -e ssh source/ user@remote_host:/destination
```

但是，如果 ssh 命令有附加的参数，则必须使用-e参数指定所要执行的 SSH 命令。

```shell
rsync -av -e 'ssh -p 2234' source/ user@remote_host:/destination
```

上面命令中，-e参数指定 SSH 使用2234端口

### rsync 协议

除了使用 SSH，如果另一台服务器安装并运行了 rsync 守护程序，则也可以用rsync://协议（默认端口873）进行传输。具体写法是服务器与目标目录之间使用双冒号分隔::

```shell
rsync -av source/ 192.168.122.32::module/destination
```

注意，上面地址中的module并不是实际路径名，而是 rsync 守护程序指定的一个资源名，由管理员分配。

如果想知道 rsync 守护程序分配的所有 module 列表，可以执行下面命令。

```shell
rsync rsync://192.168.122.32
# rsync 协议除了使用双冒号，也可以直接用rsync://协议指定地址
rsync -av source/ rsync://192.168.122.32/module/destination
```
