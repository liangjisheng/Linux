# this is a makefile to test cd and pwd cmd

.PHONY:all all_1

# make会分别调用shell去执行每一条指令，而非使用一个shell进程按顺序将所有指令都执行一遍
all:
	@pwd
	cd ..
	@pwd

all_1:
	@pwd; cd ..; pwd
