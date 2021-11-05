# dd

[dd](https://blog.51cto.com/mengzhaofu/1844489)

```shell
# 这里生成2个文件，分别存放1到9的数字以及a到z的字母
echo {1..9} | tr -d '[:space:]' | tee  f1
# 123456789
echo {a..z} | tr -d '[:space:]' | tee  f2
# abcdefghijklmnopqrstuvwxyz
```

如何将 f2 文件中的 cdef 转换为 f1 文件中的 6789

```shell
# 使用dd命令指定跳过多少个bs指定的单位：字节，注意需要不截断
dd if=f1 of=f2 skip=5 seek=2 bs=1 conv=notrunc
# 默认是截断，会把后面所有的数据都去掉
dd if=f1 of=f2 skip=5 seek=2 bs=1
```

大小写转换

```shell
# 再次生成一个f3文件来保存a-z小写字母
echo {a..z} | sed 's/[[:space:]]//g' | tee f3
# 将f3中小写字母全部转换为大写字母
dd if=f3 of=f4 conv=ucase
# 再将f3中的大小字母全部转换为小写字母
dd if=f4 of=f5 conv=lcase
# 不用写入新文件直接转换文件中数据别不修改源文件
dd if=f3 conv=ucase 2> /dev/null
# 直接操作源文件数据进行转换
echo `dd if=f3 conv=ucase 2> /dev/null` > f3
# 注意: 这里想要直接操作源文件, if=f3 of=f3是不行的
```

操作磁盘数据

```shell
# 查看/dev/sda下的分区
sudo fdisk -l /dev/sda | grep '^/dev'
# 将/dev/sda下的mbr信息配分到文件中
dd if=/dev/sda of=mbr.bak bs=512 count=1
# 将/dev/sda下的mbr复制给其它空硬盘
dd if=mbr.bak of=/dev/sdc bs=512 count=1 2 > /dev/null
sudo fdisk -l /dev/sdc | grep '^/dev'

# 只破坏硬盘的 bootloader
dd if=/dev/zero of=/dev/sdc bs=446 count=1 conv=notrunc
#这里使用十六进制查看，前面446字节全被写入0，但是后面的分区信息以及55aa标示任然保留，当然，/dev/sdc并不是系统盘，bootloader是用于引导系统的, 这里不影响存数据
hexdump -C -n 512 /dev/sdc
sudo fdisk -l /dev/sdc 2> /dev/null | grep '^/dev'
```

有二进制文件fileA，size>2K。现在想从第64个字节位置开始读取，需要读取的大小是128Byts。又有fileB, 想把上面读取到的128Bytes写到第32个字节开始的位置，替换128Bytes，请问如何实现？

```shell
dd if=fileA  of=fileB bs=128 skip=63 seek=31 count=1  conv=notrunc
dd if=fileA  of=fileB bs=1 skip=63 seek=31 count=128  conv=notrunc
```

磁盘数据备份, dd在对于不同的数据对象操作时，数据流可能会有所不同，比如，如果是对于一个文本文件，那么输出的流就很简单，就是一种字符流，当然内部是将字节流转换为字符流的过程，因此，在操作存文本数据时，dd命令输出的数据还是可以文本查看工具进行查看的，但是，如果操作的并非一个纯文本文件，比如说是某种设备上的数据，那么把一种设备对象当一个文件流来操作，就是直接操作数据最底层的二进制数据了

```shell
# 将本地的/dev/sdx整块磁盘备份到/dev/sdy
dd if=/dev/sdx of=/dev/sdy
# 将/dev/sdx全盘数据备份到指定路径的 p_w_picpath 文件
dd if=/dev/sdx of=/path/to/p_w_picpath
# 备份/dev/sdx全盘数据, 并利用gzip工具进行压缩, 保存到指定路径
dd if=/dev/sdx | gzip > /path/to/p_w_picpath.gz
```

磁盘数据还原

```shell
# 将备份文件恢复到指定盘
dd if=/path/to/p_w_picpath of=/dev/sdx
# 解压备份文件恢复到指定盘
gzip -dc /path/to/p_w_picpath.gz | dd of=/dev/sdx
# 这里的所有操作都是控制一种数据的流向，本质上原理是一样的
# 拷贝内存资料到硬盘
dd if=/dev/mem of=/root/mem.bin bs=1024
# 从光盘拷贝数据制作为iso镜像文件
dd if=/dev/cdrom of=/root/cd.iso
# 销毁磁盘数据
dd if=/dev/urandom of=/dev/sda1
# 利用数据数将磁盘填充满，用于销毁磁盘中数据，使其无法再恢复
```

测试最最快数据的bs大小输出

```shell
dd if=/dev/zero bs=1024 count=1000000 of=1Gb.file
d if=/dev/zero bs=2048 count=500000 of=1Gb.file
dd if=/dev/zero bs=4096 count=250000 of=1Gb.file
# 这里说明, 如果写入一个G数据, 使用bs=4096是最好的
```

测试磁盘的读写速度

```shell
dd if=1Gb.file bs=64k | dd of=/dev/null
dd if=/dev/zero of=1Gb.file bs=1024 count=1000000
```

修复硬盘, 当硬盘较长时间（比如1，2年）放置不使用后，磁盘上会产生消磁点。当磁头读到这些区域时会遇到困难，并可能导致I/O错误。当这种情况影响到硬盘的第一个扇区时，可能导致硬盘报废。上边的命令有可能使这些数据起死回生。且这个过程是安全, 高效的.

```shell
dd if=/dev/sda of=/dev/sda
#此操作只适用于硬盘设备文件，如果为文件则数据完全消失
```
