#ifndef STL_spu_struct_
#define STL_spu_struct_

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "Stack_1type/STL_stack.h"

struct SPU_Struct
{
    struct Stack stk;
    int rax;
    int rbx;
    int rcx;
    int rdx;
};

#define SpuStructCtor(stk)                                          \
    STL_SpuStructCtor ((stk))

#define SpuStructDtor(stk)                                          \
    STL_SpuStructDtor ((stk))

#define SpuStructVerificator(stk)                                   \
    STL_SpuStructVerificator ((stk))

#define SpuStructDump(stk)                                          \
    STL_SpuStructDump ((stk));

int
STL_SpuStructCtor (SPU_Struct* stk);

int
STL_SpuStructDtor (SPU_Struct* stk);

int
STL_SpuStructVerificator (SPU_Struct* stk);

void
STL_SpuStructDump (const SPU_Struct* stk);

#endif /* STL_stack_ */
