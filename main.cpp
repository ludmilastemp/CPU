#include "asm.h"
#include "disasm.h"
#include "STL_spu.h"

// assembler - транслятор
// assembly - язык

// ISA -- instruction set architecture
// to readme (максимально сухо, но полно)

// cpu -- central processing unit
// spu -- software processing unit
// fpu -- floating point unit

#define D(F)                    \
    if (F) return EXIT_FAILURE;

int main ()
{
// beee 3 main funcsssssssssssssssssss
D(  Compile ("asm.txt", "bin.bin") )

D(  SPU ("bin.bin") )

D(  DisAsm ("bin.bin", "my_asm.txt") )

    printf ("\n\nEND!");

    return 0;
}

