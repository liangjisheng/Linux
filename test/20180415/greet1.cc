#include "greet.h"
int display1(char *string);
int display2(char *string);

int main()
{
	char string[] = "Embedded Linux";
	display1(string);
	display2(string);
}
int display1(char *string)
{
	printf("The original is %s \n", string);
}
int display2(char *string)
{
	char *string2;
	int size,i;
	size = strlen(string);
	string2 = (char *)malloc(size + 1);
	for (i = 0; i < size; i++)
		string2[size - i - 1] = string[i];
	string2[size] = 0;
	printf("size = %d\n", size);
	printf("string2 len is: %d\n", (int)strlen(string2));
	printf("The string afterward is %s\n", string2);
}
