#!/bin/bash

# 因为&，进程被置于后台，由jobs命令可以查看到，可使用%n(n是后台进程的进程号)
# 使用fg命令将它再次至于前台
# 如果Shell接受到了SIGHUP信号，Shell会将这个信号发送给它下面的所有进程，
# 包括后台，直到所有进程都结束，才退出
# 如果使用disown命令将进程从jobs列表中移除了，那么上面的都不再适用
# 但是注意它始终连接到启动它的Shell所以，原Shell终止后,只要disown
# 的进程对任何stdin,stdout或stderr操作，就会产生错误

# nohup foo
# 1. 它会会将foo进程的stdin关闭，也就是说foo无法从stdin读数据，即便是再次从后台唤醒到前台；
# 2. 将foo进程的stdou和stderr重定向到nohup.out文件，所以foo进程不会因输出而产生错误；
# 3. 同时它还防止foo进程接受Shell的SIGHUP信号
# 但是注意nohup不会将进程从Shell的jobs列表中移除，并且并不将其防止后台
# (当然一般配合nohup使用都会与&联合使用置其后台)

# 总结来说：
# &： 将进程置于后台，使Shell不用等待它的结束而继续接受用户输入(stdin)。
# disown: 将进程从jobs列表中移除, 但依然与Shell有连接
# nohup: 将进程与父Shell完全脱离，且子进程不会接受NOHUP信号，并不能用fg或者jobs命令找到它

TARGET=main
INPUT=name
go build -o $TARGET main.go

# 子进程完全脱离Shell的命令
nohup ./$TARGET <./$INPUT >nohup.out 2>&1 &