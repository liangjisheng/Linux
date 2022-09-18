# disk

[filesystem](https://support.microsoft.com/zh-cn/topic/%E5%AF%B9%E4%BA%8E-ntfs-fat-%E5%92%8C-exfat-%E7%9A%84%E9%BB%98%E8%AE%A4%E7%B0%87%E5%A4%A7%E5%B0%8F-9772e6f1-e31a-00d7-e18f-73169155af95)
[mac 读写 NTFS 文件系统](https://blog.csdn.net/CoderDCLiu/article/details/122865043)
[mac 读写 NTFS 文件系统](https://qiujunya.com/article/2021/2/21/182.html)
[mac 修改文件系统块大小](https://apple.stackexchange.com/questions/213879/reformat-exfat-with-specific-device-block-size-and-cluster-size)
[mac 修改文件系统块大小](https://apple.stackexchange.com/questions/78802/what-are-the-sector-sizes-on-mac-os-x)
[diskutil](https://blog.csdn.net/weixin_41136293/article/details/108766145)

[find](http://t.zoukankan.com/pta188-p-8678387.html)

```shell
find . -name "*.exe" | xargs rm -f
```

当 find 找到一个文件名中含有空格的文件时, 后面的操作就可能会有问题
有一个参数 -print0, 和默认的 -print 相比，当输入中有空格时，输出的序列不是以空格分隔，而是以 null 字符分隔。而 xargs 也有一个参数 -0，可以接受以 null 而非含有空格的输入流

```shell
find . -name "*.exe" -print0 | xargs -0 rm -f
find . -name "*.exp" -print0 | xargs -0 rm -f
find . -name "*.git" -print0 | xargs -0 sudo rm -rf
find . -name "vendor" -print0 | xargs -0 sudo rm -rf
find . -name "node_modules" -print0 | xargs -0 sudo rm -rf
find . -name "*.obj" -print0 | xargs -0 sudo rm -rf
find . -name "*.pdb" -print0 | xargs -0 sudo rm -rf
find . -name "*.lib" -print0 | xargs -0 sudo rm -rf
find . -name "*.dll" -print0 | xargs -0 sudo rm -rf
find . -name "*.a" -print0 | xargs -0 sudo rm -rf
find . -name "*.so" -print0 | xargs -0 sudo rm -rf
find . -name "*.ilk" -print0 | xargs -0 sudo rm -rf
find . -name "*.log" -print0 | xargs -0 sudo rm -rf
find . -name "*.tlog" -print0 | xargs -0 sudo rm -rf
find . -name "*.LIB" -print0 | xargs -0 sudo rm -rf
find . -name "*.pch" -print0 | xargs -0 sudo rm -rf
```

```shell
# 查看前 100 个文件
ls | head -n 100
```

显示每个文件夹的大小

```shell
# 显示当前目录占用磁盘空间的总大小
du -sh ./
du -sh
# 显示当前目录下所有文件和文件夹占用磁盘空间大小
du -sh ./*
du -sh *
# 当前目录路径一层文件占用磁盘空间大小
du -d 1 -h
# 可以根据需要查看路径2层的目录占用磁盘空间大小
du -d 2 -h
# 显示当前文件夹下所有文件和文件夹的大小,包含隐藏文件和隐藏文件夹
du -sh * .[^.]*
# 显示当前文件夹下所有文件和文件夹的大小,包含隐藏文件和隐藏文件夹和总计
du -csh * .[^.]*
```

不修源文件任何属性拷贝文件, 并显示进度, 如果使用 cp 的话新文件的创建修改时间都会变成当前时间

```shell
# 拷 test 目录下的所有文件和文件夹到指定目录
rsync -rah --progress /User/liangjisheng/test /Volumes/ljsElements
# head 生成一个随机文件
head -c 4095 </dev/urandom > random
```

```shell
# 显示文件的编码格式
file -I main.go
# main.go: text/x-c; charset=utf-8
```

mac 文件系统

mac 有自己的 HFS 格式，只有 mac 系统使用 HFS. mac 不仅支持 HFS, 还支持 Fat 和 exFat 的读写, 但在 NTFS 下是只读的。这个问题是 mac 的一个缺点

目前高系统版本 mac 的文件系统都是 APFS

[APFS](https://support.apple.com/zh-cn/guide/disk-utility/dsku19ed921c/19.0/mac/10.15)
[APFS](https://support.apple.com/zh-cn/guide/disk-utility/dskua9e6a110/19.0/mac/10.15)

```shell
# 显示当前目录下磁盘块大小 filesystem block size
sudo stat -f %k .
```

```shell
# 直接输入显示命令介绍
sudo diskutil
sudo diskutil list
sudo diskutil listFilesystems
sudo diskutil info /dev/disk2
sudo diskutil info /dev/disk2s2

sudo diskutil enableOwnership /Volumes/ljsElements

sudo diskutil verifyDisk /dev/disk2
sudo diskutil repairDisk /dev/disk2

sudo diskutil reformat /dev/disk2

sudo diskutil unmountDisk /dev/disk2
sudo diskutil mountDisk /dev/disk2
```

eraseDisk 擦除磁盘或分区, 并且格式化为指定的文件系统格式

```shell
sudo diskutil eraseDisk ExFAT ljsElements GPT /dev/disk2
```

```conf
Volume name      : ljsElements
Partition offset : 411648 sectors (210763776 bytes)
Volume size      : 1953112064 sectors (999993376768 bytes)
Bytes per sector : 512
Bytes per cluster: 131072
FAT offset       : 2048 sectors (1048576 bytes)
# FAT sectors    : 61440
Number of FATs   : 1
Cluster offset   : 63488 sectors (32505856 bytes)
# Clusters       : 7629096
Volume Serial #  : 62bc67aa
Bitmap start     : 2
Bitmap file size : 953637
Upcase start     : 10
Upcase file size : 5836
Root start       : 11
```

执行完 eraseDisk 后, 就不用执行新建分区操作了

```shell
sudo diskutil partitionDisk /dev/disk2 1 GPT ExFAT ljsElements R
```

```conf
Started partitioning on disk2
Unmounting disk
Creating the partition map
Waiting for partitions to activate
Formatting disk2s2 as ExFAT with name ljsElements
Volume name      : ljsElements
Partition offset : 411648 sectors (210763776 bytes)
Volume size      : 1953112064 sectors (999993376768 bytes)
Bytes per sector : 512
Bytes per cluster: 131072
FAT offset       : 2048 sectors (1048576 bytes)
# FAT sectors    : 61440
Number of FATs   : 1
Cluster offset   : 63488 sectors (32505856 bytes)
# Clusters       : 7629096
Volume Serial #  : 62bc6a0d
Bitmap start     : 2
Bitmap file size : 953637
Upcase start     : 10
Upcase file size : 5836
Root start       : 11
Mounting disk
Finished partitioning on disk2
/dev/disk2 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *1.0 TB     disk2
   1:                        EFI EFI                     209.7 MB   disk2s1
   2:       Microsoft Basic Data ljsElements              1000.0 GB  disk2s2
```

修改 exfat 文件系统块大小

```shell
# 显示设备基本信息
sudo newfs_exfat -N /dev/disk2

sudo diskutil unmount /dev/disk2s2

# 显示磁盘基本信息, 需要先 unmount, 否则会报 Resource busy 错误
sudo newfs_exfat -N /dev/disk2s2

# reformat volume name ljsElements Allocation Block Size to 4k
# -b block size (in bytes)
# -c sectors/cluster
# -v filesystem/volume name 指定修改后的 volumn name
sudo newfs_exfat -v ljsElements -b 4096 /dev/disk2s2
# 或者使用下列命令修改块大小为 4k
# sudo newfs_exfat -v ljsElements -c 8 /dev/disk2s2
```

修改块大小后输出

```conf
Cluster size differs from command line argument; skipping reformat
Volume name      : ExFAT
Partition offset : 411648 sectors (210763776 bytes)
Volume size      : 1953112064 sectors (999993376768 bytes)
Bytes per sector : 512
Bytes per cluster: 4096
FAT offset       : 2048 sectors (1048576 bytes)
# FAT sectors    : 1906688
Number of FATs   : 1
Cluster offset   : 1908736 sectors (977272832 bytes)
# Clusters       : 243900416
Volume Serial #  : 62bdbe1b
Bitmap start     : 2
Bitmap file size : 30487552
Upcase start     : 7446
Upcase file size : 5836
Root start       : 7448
```

```shell
sudo diskutil mount /dev/disk2s2
```

当 /dev/disk2s2 不能写的时候可以使用下面的方法解决

执行 sudo mount 后观察到 /dev/disk2s2 是 read-only 的

```conf
/dev/disk2s2 on /Volumes/ljsElements (exfat, local, nodev, nosuid, read-only, noowners)
```

修改方法参考这篇[文章](https://apple.stackexchange.com/questions/354363/brand-new-external-hard-drive-formatted-exfat-is-mounted-read-only)

或者用下面的3个命令

```shell
sudo umount /dev/disk2s2
sudo mkdir /Volumes/ljsElements
sudo mount_exfat /dev/disk2s2 /Volumes/ljsElements
```

此时再执行 mount 就没有 read-only 了

```conf
/dev/disk2s2 on /Volumes/ljsElements (exfat, local, noowners)
```

当推出硬盘并再次重新插入的时候, 执行 mount 显示如下

```conf
/dev/disk2s2 on /Volumes/ljsElements (exfat, local, nodev, nosuid, noowners)
```
