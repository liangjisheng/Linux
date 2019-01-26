# Makefile version 1
# main: main.cpp support1.cpp support1.hpp  
#	g++ main.cpp support1.cpp -o main



# Makefile version 2
# main.exe : main.o support.o
#	g++ main.o support.o -o main.exe

# main.o : main.cpp support.hpp
#	g++ -c main.cpp

# support.o : support.cpp support.hpp
#	g++ -c support.cpp



# Makefile version 3
CC := g++
FLAGS := -std=c++11 -w

# $@称为自动化变量，是目标文件的名字
main.exe : support.o main.o
	$(CC) $(FLAGS) main.o support.o -o $@

support.o : support.cpp support.hpp
	$(CC) $(FLAGS) -c support.cpp

main.o : main.cpp support.hpp
	$(CC) $(FLAGS) -c main.cpp

# shell命令前面的@表示不显示这条命令
clean:
	@rm -f *.o
	@rm -f *.gch
	@rm -f *.exe

foo:
	@echo "Testing"
