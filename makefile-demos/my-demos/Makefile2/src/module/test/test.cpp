#include <iostream>
#include <string>

#include "..\..\include\comm.h"

using namespace std;

int main()
{
    string hello = "     Hello World!    ";
    cout << trim(hello) << endl;

    return 0;    
}