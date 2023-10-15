#include "STL_spu_struct.h"

static char errStr[500] = "ERROR ";

static void STL_Print (const char* const fmt, ...);

int
STL_SpuStructCtor (SPU_Struct* spu)
{
    assert (spu);

    StackCtor (&(spu->stk));

    spu->registers[0] = 0;
    spu->registers[1] = 0;
    spu->registers[2] = 0;
    spu->registers[3] = 0;

    spu->err = 0;

    return 0;
}

int
STL_SpuStructDtor (SPU_Struct* spu)
{
    assert (spu);

    StackDtor (&(spu->stk));

    spu->registers[0] = 0;
    spu->registers[1] = 0;
    spu->registers[2] = 0;
    spu->registers[3] = 0;

    spu->err = 0;

    spu = nullptr;

    return 0;
}

int
STL_SpuStructVerificator (SPU_Struct* spu)
{
    assert (spu);

    StackVerificator (&(spu->stk));

    return spu->stk.err + spu->err;
}

void
STL_SpuStructDump (const SPU_Struct* spu)
{
    StackDump (&(spu->stk));

    STL_Print ("rax = %d\n", spu->registers[0]);
    STL_Print ("rbx = %d\n", spu->registers[1]);
    STL_Print ("rcx = %d\n", spu->registers[2]);
    STL_Print ("rdx = %d\n", spu->registers[3]);
}

char*
STL_SpuStructErrPrint (int err)
{
    char str[100] = " ";

    sprintf (errStr, "\n\n");

#define SpuStructPrintErrCheck(x)            \
    if (err % (2 * x) >= x)                  \
    {                                        \
        sprintf (str, "ERROR! " #x "\n");    \
        strcat (errStr, str);                \
    }

    SpuStructPrintErrCheck (ERROR_INCORRECT_FUNC);
    SpuStructPrintErrCheck (ERROR_INCORRECT_VALUE);
    SpuStructPrintErrCheck (ERROR_FILE_FORMAT);

#undef StackPrintErrCheck

    STL_Print ("%s", errStr);

    return errStr;
}

static void STL_Print (const char* const fmt, ...)
{
    assert   (fmt);

    va_list   args = {};

    va_start (args, fmt);

    vfprintf (stderr, fmt, args);

    va_end   (args);
}


#undef Verificator
