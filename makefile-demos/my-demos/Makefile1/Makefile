main.exe: main.o max.o
	gcc -o main.exe main.o max.o

main.o: main.c max.h
	gcc -c main.c

max.o: max.c max.h
	gcc -c max.c

.PHONY:clean
clean:
	rm -f *.o
