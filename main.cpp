#include "asm.h"
#include "disasm.h"
#include "spu.h"


//#include "Running/running.h"

#include "function.h"

int main ()
{
    /*
    FILE *fp = fopen("bin_txt.txt", "r");
    assert(fp);

    FILE *fpBinTxt = fopen("bin_txt.txt", "w");
    assert(fpBinTxt);

    if(!TxtInBinTxt(fp, fpBinTxt)) printf("OK!");   *

    FILE *fp = fopen("bin_txt.txt", "r");
    assert(fp);

    FILE *fpBin = fopen("bin.txt", "wb");
    assert(fpBin);

    if(!TxtInBin(fp, fpBin)) printf("OK!");  //*

    fclose (fpBin);

    FILE *fpBin2 = fopen("bin.txt", "rb");
    assert(fpBin);

    BinInConsole(fpBin2);                    *

    return 0;                                 */

    ASMToBin ("asm.txt", "bin_txt.txt");
    //printf ("\nASMToBin OK!\n");

    //BinToASM ("bin_txt.txt", "my_asm.txt");
    //printf ("BinToASM OK!\n");

    SPU ("bin_txt.txt");

    printf ("\n\nEND!");
}

