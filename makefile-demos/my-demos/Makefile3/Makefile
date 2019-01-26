
cc = gcc
prom = main.exe
# shell函数主要用于执行shell命令，具体到这里就是找出当前目录下所有的.c和.h文件
deps = $(shell find ./ -name "*.h")
src = $(shell find ./ -name "*.c")
# 而$(src:%.c=%.o)则是一个字符替换函数，它会将src所有的.c字串替换成.o，
# 实际上就等于列出了所有.c文件要编译的结果
obj = $(src: %.c=%.o)

# 有了这两个设定，无论我们今后在该工程加入多少.c和.h文件，Makefile都能自动将其纳入到工程中来


$(prom): $(obj)
	$(cc) -o $(prom) $(obj)

%.o : %.c $(deps)
	$(cc) -c $< -o $@

clean:
	rm -f $(obj)

cleanExe:
	rm -f $(prom)
