#include "asm.h"
#include "disasm.h"
#include "STL_spu.h"

#include "STL_function.h"

// EXIT_FAILURE
// EXIT_SUCCESS

#define D_ASMToBin(str1, str2)                  \
    if (ASMToBin ((str1), (str2))) return 0;

#define D_BinToASM(str1, str2)                  \
    if (BinToASM ((str1), (str2))) return 0;

#define D_SPU(str1)                             \
    if (SPU ((str1))) return 0;

int main ()
{
    int var = 3000;
                                               {
    //FILE* fp = fopen ("bin_txt.bin", "wb");

    //fprintf (fp, "%c\n", var);
    //fprintf (fp, "%c\n", var & 0xFFFFFFFF + 1);
//    fprintf (fp, "<%c> ",  var & 0xFF000000 + 1);
//    fprintf (fp, "<%c> ",  var & 0x00FF0000 + 1);
//    fprintf (fp, "<%c> ",  var & 0x0000FF00 + 1);
//    fprintf (fp, "<%c>\n", var & 0x000000FF + 1);

//    fprintf (stderr, "%d\n",   var & 0xFFFFFFFF);
//    fprintf (stderr, "<%d> ",  var & 0xF0000000);
//    fprintf (stderr, "<%d> ",  var & 0x0F000000);
//    fprintf (stderr, "<%d> ",  var & 0x00F00000);
//    fprintf (stderr, "<%d> ",  var & 0x000F0000);
//    fprintf (stderr, "<%d> ",  var & 0x0000F000);
//    fprintf (stderr, "<%d> ",  var & 0x00000F00);
//    fprintf (stderr, "<%d> ",  var & 0x000000F0);
//    fprintf (stderr, "<%d>\n", var & 0x0000000F);
}




    //return 0;

//D(  ASMToBin ("asm.txt", "bin_txt.txt") )

    CheckAntiOverflow ("bin_txt.txt");

    D_SPU ("bin_txt.txt");

    D_BinToASM ("bin_txt.txt", "my_asm.txt");

    printf ("\n\nEND!");

    return 0;
}

