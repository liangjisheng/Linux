#this is a makefile example

#.PHONY说明clean是一个伪目标，而不与一个名为clean的文件相对应
.PHONY: clean

depen = main.o

main : clean $(depen)
	gcc -o main $(depen)

# @表示隐藏命令语句
main.o:main.c
	@gcc -c main.c

testa:
	@touch testa

testb:
	@touch testb

# rm前面的-使得make忽略该指令的错误
clean:
	@-rm $(depen)
