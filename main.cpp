#include "asm.h"
#include "disasm.h"
#include "spu.h"

int main ()
{
    ASMToByte ("asm.txt", "byte.txt");

    ByteToASM ("byte.txt", "my_asm.txt");

    SPU ("byte.txt");
}

