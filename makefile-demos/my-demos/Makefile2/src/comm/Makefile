libcomm.a: comm.o
	ar -r libcomm.a comm.o
	mv libcomm.a ../../lib

comm.o: comm.cpp
	g++ -m64 -c comm.cpp -o comm.o

.PHONY:clean
clean:
	rm -f *.o
