#ifndef STL_spu_struct_
#define STL_spu_struct_

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdarg.h>

#include "STL_function.h"
#include "Stack_1type/STL_stack.h"

struct SPU_Struct
{
    struct Stack stk;
    int registers[4];
    int err;
};

#define SpuStructCtor(stk)                                          \
    STL_SpuStructCtor ((stk))

#define SpuStructDtor(stk)                                          \
    STL_SpuStructDtor ((stk))

#define SpuStructVerificator(stk)                                   \
    STL_SpuStructVerificator ((stk))

#define SpuStructDump(stk)                                          \
    STL_SpuStructDump ((stk))

int
STL_SpuStructCtor (SPU_Struct* stk);

int
STL_SpuStructDtor (SPU_Struct* stk);

int
STL_SpuStructVerificator (SPU_Struct* stk);

void
STL_SpuStructDump (const SPU_Struct* stk);

char*
STL_SpuStructErrPrint (int err);

#endif /* STL_stack_ */
