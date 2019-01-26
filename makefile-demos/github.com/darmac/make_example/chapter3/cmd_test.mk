#this is a command test makefile

.PHONY:all all_1

# $$$$会打印执行当前shell命令的进程ID,如果两次打印的ID一样，说明这两个命令是在同一个
# 进程中执行的，如果不一样，表示是在两个不同的进程中执行的
all:
	@echo "cmd1 process id is :" $$$$
	@echo "cmd2 process id is :" $$$$

# 同一行的命令会在同一个进程中被执行
all_1:
	@echo "cmd1 process id is :" $$$$; echo "cmd2 process id is :" $$$$
