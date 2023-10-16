#ifndef STL_spu_struct_
#define STL_spu_struct_

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdarg.h>

#include "Stack_1type/STL_stack.h"

const int SIGNATURE_LENGTH = 6;

struct STL_Header
{
   //char magic[5] = "SLT_v";
   //char version = 5;
   //...
};

struct SPU_Struct
{
    struct Stack stk;
    int registers[4];
    int err;
};

#define DEF_CMD(name,opCode, ...)   \
    CMD_##name = opCode,

enum OpCode
{
    #include "STL_commands.h"
};
#undef DEF_CMD

enum RegisterName
{
    REG_RAX,
    REG_RBX,
    REG_RCX,
    REG_RDX,    //
};

enum ArgType
{
    T_ARG_INT = 0x40,  /// 1 << 6
    T_ARG_REG = 0x80,  /// 1 << 7
};

enum SPU_Error
{
    ERROR_INCORRECT_FUNC        = 1 << 0,
    ERROR_INCORRECT_VALUE       = 1 << 1,
    ERROR_FILE_FORMAT           = 1 << 2,
    ERROR_COMMAND_NAME_TOO_LONG = 1 << 3,
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
