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

    //printf ("%d\n", Func[2]);
                             /*
    struct Stack stk = { };

    int elem = 0;

    StackCtor (&stk);
    StackPush (&stk, 5);

    //StackDump (&stk);
    StackVerificator (&stk);

    StackPop  (&stk, &elem);
    StackDtor (&stk);   */

    //printf ("elem = %d", elem);

    ASMToBin ("asm.txt", "bin_txt.txt");

    BinToASM ("bin_txt.txt", "my_asm.txt");

    SPU ("bin_txt.txt");

    printf ("\n\nEND!");
}

