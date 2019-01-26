#!/bin/bash

# gcc -c main.c
# gcc -o main.exe main.o -L./ -ladd_minus

gcc -c main.c
gcc -o main main.o -L./ -lmulti_div

exit 0
