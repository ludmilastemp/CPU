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
    if (F)                      \
    {                           \
        printf ("ERROR");       \
        return EXIT_FAILURE;    \
    }

int main ()
{
                                            // 1    5
                                            // 2    in in in
                                            // 3    1 4 9 .. 64
                                            // 4    79
                                            // 5    777
// beee 3 main funcsssssssssssssssssss
D(  Compile ("asm6.txt", "bin.bin") )
    printf ("Compile OK!\n");

D(  Disasm ("bin.bin", "my_asm.txt") )
    printf ("Disasm OK!\n");

D(  SPU ("bin.bin") )

    printf ("\n\nEND!");

    return 0;
}

