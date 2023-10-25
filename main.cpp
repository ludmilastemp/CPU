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
D(  Compile ("asm4.txt", "bin.bin") )
    printf ("Compile OK!\n");

D(  SPU ("bin.bin") )

D(  Disasm ("bin.bin", "my_asm.txt") )

    printf ("\n\nEND!");

    return 0;
}

