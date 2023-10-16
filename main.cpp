#include "asm.h"
#include "disasm.h"
#include "STL_spu.h"

// assembler - транслятор
// assembly - язык

// cpu -- central processing unit
// spu -- software processing unit
// fpu -- floating point unit

#define D(F)                    \
    if (F) return EXIT_FAILURE;

int main ()
{

D(  Compile ("asm.txt", "bin.bin") )

D(  SPU ("bin.bin") )

D(  DisAsm ("bin.bin", "my_asm.txt") )

    printf ("\n\nEND!");

    return 0;
}

