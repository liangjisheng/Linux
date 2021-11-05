# system

## 查看服务器基本信息

查看操作系统版本,这个命令适用于大多数linux发行版

cat /etc/issue

查看操作系统内核版本

uname -r

查看操作系统详细信息

uname -a

查看更多信息

more /etc/*release

## CPU基本配置查询

CPU物理个数: 主板上实际插入的cpu数量
CPU核心数: 单块CPU上面能处理数据的芯片组的数量，如双核，四核等（cpu核）
逻辑CPU数/线程数: 一般情况下，逻辑cpu =物理CPU个数×每颗核数，如果不命名的话，则表示服务器的CPU支持超线程技术

查看CPU的详细信息

cat /proc/cpuinfo
lscpu

查看CPU物理个数

grep 'physical id' /proc/cpuinfo | sort -u | wc -l

查看CPU核心数量

grep 'core id' /proc/cpuinfo | sort -u | wc -l

查看CPU线程数

cat /proc/cpuinfo| grep "processor"|wc -l

查看CPU型号

cat /proc/cpuinfo | grep name | sort | uniq

## 硬盘基本配置查询

查看基本硬盘使用情况

df -Th

显示全部的文件系统的使用情况

df -a

显示inode信息

df -i

以字节数显示区块占用情况

df -k

查询某个目录磁盘占用情况

指定目录大小汇总

du -sh

子目录深度

du -h --max-depth=1

列出明细的同时, 增加汇总值

du -c
du -ach --max-depth=2 /home/

tree -L 2 /home/

以树状的格式显示所有可用的块设备信息

lsblk

列出所有可用的设备, 通用唯一识别码(UUID), 文件系统类型以及卷标

blkid
