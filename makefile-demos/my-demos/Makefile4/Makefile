main.exe: main.o add.o divide.o minus.o multiply.o
	gcc main.o add.o divide.o minus.o multiply.o -o main.exe

HEADER = math.h

# 首先是%.o:%.c，这是一个模式规则，表示所有的.o目标都依赖于与它同名的.c文件
# 其中$<代表的是依赖关系表中的第一项（如果我们想引用的是整个关系表，那么就应该使用$^）
# 而$@代表的是当前语句的目标，即%.o
# 这样一来，make命令就会自动将所有的.c源文件编译成同名的.o文件。不用我们一项一项去指定了
%.o : %.c $(HEADER)
	gcc -c $< -o $@

#main.o: main.c $(HEADER)
#	gcc -c main.c $(HEADER)

#add.o: add.c $(HEADER)
#	gcc -c add.c $(HEADER)

#divide.o: divide.c $(HEADER)
#	gcc -c divide.c $(HEADER)

#minus.o: minus.c $(HEADER)
#	gcc -c minus.c $(HEADER)

#multiply.o: multiply.c $(HEADER)
#	gcc -c multiply.c $(HEADER)

clean:
	gcc rm *.o *.exe
