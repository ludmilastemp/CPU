#ifndef STL_spu_struct_
#define STL_spu_struct_

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdarg.h>

#include "Stack_1type/STL_stack.h"

typedef int SPU_DATA_TYPE;   /// не забудь поменять тип в стеке

const int floatPrecision = 100;

const int nRegisters = 8;

struct SPU_Struct
{
    struct Stack stk;
    SPU_DATA_TYPE registers[nRegisters];
    int err;
};

enum ArgType
{
    T_ARG_REG = 0x20,    /// 1 << 5     32
    T_ARG_RAM = 0x40,    /// 1 << 6     64
    T_ARG_CONST = 0x80,  /// 1 << 7     128
};

enum SPU_Error
{
    ERROR_INCORRECT_FUNC        = 1 << 0,
    ERROR_INCORRECT_VALUE       = 1 << 1,
    ERROR_FILE_FORMAT           = 1 << 2,
    ERROR_COMMAND_NAME_TOO_LONG = 1 << 3,
    ERROR_NOT_MEMORY            = 1 << 4,
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
STL_SpuErrPrint (int err);

#endif /* STL_stack_ */
