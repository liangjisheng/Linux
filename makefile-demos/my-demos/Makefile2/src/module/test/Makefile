test.exe: test.cpp
	g++ -m64 -I../../include -L../../../lib test.cpp -lcomm -o test.exe
	mv ./test.exe ../../../bin

.PHONY:clean
clean:
	rm -f *.o