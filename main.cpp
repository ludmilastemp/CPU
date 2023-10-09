#include "asm.h"
#include "disasm.h"
#include "STL_spu.h"

#include "STL_function.h"

#define D_ASMToBin(str1, str2)                  \
    if (ASMToBin ((str1), (str2))) return 0;

#define D_BinToASM(str1, str2)                  \
    if (BinToASM ((str1), (str2))) return 0;

#define D_SPU(str1)                             \
    if (SPU ((str1))) return 0;

int main ()
{
    D_ASMToBin ("asm2.txt", "bin_txt.txt");

    D_SPU ("bin_txt.txt");

    D_BinToASM ("bin_txt.txt", "my_asm.txt");

    printf ("\n\nEND!");
}

