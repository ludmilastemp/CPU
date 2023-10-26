#include "asm.h"

int main ()
{
    if (Compile ("asm7.txt", "bin.bin") ) return 1;
    printf ("Compile OK!\n");

    return 0;
}

