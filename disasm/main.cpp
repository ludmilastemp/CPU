#include "disasm.h"

int main ()
{
    if (Disasm ("examples/bin.bin", "examples/my_asm.txt") ) return 1;
    printf ("Disasm OK!\n");

    return 0;
}

