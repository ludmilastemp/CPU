#include "STL_compile.h"

int main ()
{
    if (Compile ("examples/asm7.txt", "examples/bin.bin") ) printf ("ERROE! ERROR! ERROR!");
    printf ("Compile OK!\n");

    return 0;
}

