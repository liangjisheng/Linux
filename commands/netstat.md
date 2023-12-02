# netstat

netstat 命令用于显示各种网络相关信息，如网络连接，路由表，接口状态 (Interface Statistics)，masquerade 连接，多播成员 (Multicast Memberships) 等等

常见参数

-a (all)显示所有选项，默认不显示LISTEN相关
-t (tcp)仅显示tcp相关选项
-u (udp)仅显示udp相关选项
-x 列出所有unix端口
-n 以数字形式显示地址和端口号
-l 仅列出有在 Listen (监听) 的服务状态
-p 显示建立相关链接的程序名
-r 显示路由信息，路由表
-e 显示扩展信息，例如uid等
-s 按各个协议进行统计
-c 每隔一个固定时间，执行该netstat命令
-o 显示与每个连接相关的进程 ID

```shell
# 列出所有端口, 包括监听和未监听的
netstat -a | more
# 列出所有 tcp 端口 
netstat -at
# 列出所有 udp 端口 
netstat -au
# 只显示监听端口 
netstat -l
# 只列出所有监听 tcp 端口 
netstat -lt
# 只列出所有监听 udp 端口 
netstat -lu
# 只列出所有监听 UNIX 端口
netstat -lx
# 查询进程所占用的端口号
netstat -ano | grep 进程ID
# 显示所有已建立的连接
netstat -ano | grep ESTABLISHED

# 显示所有端口的统计信息 
netstat -s
netstat -s | head -n 5
# 显示 TCP 或 UDP 端口的统计信息 
netstat -st
netstat -su

# 在 netstat 输出中显示 PID 和进程名称 
netstat -pt
netstat -pu
# 当你不想让主机，端口和用户名显示，使用 netstat -n。将会使用数字代替那些名称
netstat -an
# netstat 将每隔一秒输出网络信息
netstat -c
# 显示系统不支持的地址族
netstat --verbose
# 显示核心路由信息
netstat -r

# 找出程序运行的端口
# 并不是所有的进程都能找到，没有权限的会不显示，使用 root 权限查看所有的信息
netstat -antp | grep ssh
# 找出运行在指定端口的进程
netstat -antp | grep ':80'
# 显示网络接口列表
netstat -i
# 显示详细信息，像是使用 ifconfig
netstat -ie

# 查看连接某服务端口最多的的IP地址
netstat -nat | grep "192.168.1.15:22" | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -nr | head -20

# TCP 各种状态列表
netstat -ant | awk '{print $6}'
netstat -ant | awk '{print $6}' | sort | uniq -c | sort -rn
netstat -antp | grep 18081 | awk '{print $6}' | sort | uniq -c | sort -rn
netstat -antp | grep 3306 | awk '{print $6}' | sort | uniq -c | sort -rn
netstat -ant | awk '/^tcp/ {++S[$NF]} END {for (a in S) print a,S[a]}'

# 分析access.log获得访问前10位的ip地址
awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -10

# 显示每个进程的连接数
netstat -ano | grep ESTABLISHED | awk '{print $5}' | sort | uniq -c | sort -nr | head -10
netstat -ano | grep -i time_wait | awk '{print $5}' | sort | uniq -c | sort -nr | head -10
# 显示每个IP地址的连接数
netstat -ano | awk '{print $3}' | cut -d: -f1 | sort | uniq -c | sort -rn
# 显示每种类型TCP/UDP的连接数
netstat -ano | awk '{print $1}' | sort | uniq -c

# 本机地址连接最多
netstat -an | awk '{print $4}' | sort | uniq -c | sort -nr | head
netstat -an | awk -F: '{print $2}' | sort | uniq -c | sort -nr | head

# 远程地址连接最多
netstat -anp | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -r
netstat -anp | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -r
netstat -anp | grep TIME_WAIT | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -r
netstat -anp | grep SYN | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -r

# 使用 netstat 命令计算每个主机连接到本机的连接数
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n 
```

```shell
# 显示多播组信息
netstat -g
```
