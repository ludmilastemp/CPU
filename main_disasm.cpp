#include "include/disasm.h"

int main ()
{
    if (Disasm ("bin.bin", "my_asm.txt") ) return 1;
    printf ("Disasm OK!\n");

    return 0;
}

