#include "asm.h"
#include "disasm.h"
#include "STL_spu.h"

#include "STL_function.h"

// assembler - транслятор
// assembly - язык

// cpu -- central processing unit
// spu -- software processing unit
// fpu -- floating point unit

#define D(F)  \
    if (F) return EXIT_FAILURE;

// underflow not antioverflow :(
int main ()
{

D(  Compile ("asm.txt", "bin_txt.txt") )

D(  SPU ("bin_txt.txt") )

D(  DisAsm ("bin_txt.txt", "my_asm.txt") )

    printf ("\n\nEND!");

    return 0;
}

