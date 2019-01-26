#this is a command test makefile

.PHONY:all

# 反斜线\连接多行指令
all:
	@echo "cmd1 process \
	id is :" $$$$; \
	echo "cmd2 process id is :" $$$$
