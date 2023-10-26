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

// beee 3 main funcsssssssssssssssssss
D(  Compile ("asm6.txt", "bin.bin") )
    printf ("Compile OK!\n");

D(  Disasm ("bin.bin", "my_asm.txt") )
    printf ("Disasm OK!\n");

D(  SPU ("bin.bin") )

    printf ("\n\nEND!");


//    for (int i = 0; i < 10; ++i)
//    {
//        for (int j = 0; j < 20; ++j)
//        {
//            if ((i - 5) * (i - 5) + (j - 10) * (j - 10) <= 4 * 4) ram[20 * i + j] = 5;
//            else ram[20 * i + j] = 0;
//        }
//    }
//
//    for (int i = 0; i < 10; ++i)
//    {
//        for (int j = 0; j < 20; ++j)
//        {
//            if (ram[i * 20 + j] == 0) printf (".");
//            else printf ("*");
//        }
//        printf ("\n");
//    }

    return 0;
}

