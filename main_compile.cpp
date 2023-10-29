#include "include/STL_compile.h"

int main ()
{
    if (Compile ("asm8.txt", "bin.bin") ) return 1;
    printf ("Compile OK!\n");

    return 0;
}

