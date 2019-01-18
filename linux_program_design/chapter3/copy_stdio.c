
// name    : copy_stdio.c
// function: 
// author  : liangjisheng
// time    : 2019-01-18 22:22:24
// version : 1.0

#include <stdio.h>
#include <stdlib.h>

int main() {
    int c;
    FILE *in, *out;

    in = fopen("file.in", "r");
    out = fopen("file.out", "w");

    while ((c = fgetc(in)) != EOF) {
        fputc(c, out);
    }

    exit(0);
}
