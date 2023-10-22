#include "STL_spu.h"

static int Execute (const char* const str, int ip);

static int ExecuteCommand (const char* const str, int* ip, SPU_Struct* spu);

static int DecodeArg (const char* const str, int* ip, int command, SPU_Type* arg, int* reg);

static int ReadFile (char** str, const char* const fileName, int* ip);

int SPU (const char* fileName)
{
    assert (fileName);

    char* str = 0;
    int ip = 0;

    ReadFile (&str, fileName, &ip);

    Execute (str, ip);

    free (str);

    return 0;
}


static int Execute (const char* const str, int ip)
{
    assert (str);

    struct SPU_Struct spu = { };
    SpuStructCtor (&spu);

    int line = 0;

    int meow = 0;
    while (meow < 60)
    {
        meow++;

        spu.err = ExecuteCommand (str, &ip, &spu);

        if (spu.err == -1) break;

        if (spu.err)
        {
            STL_SpuErrPrint (spu.err);
            printf ("line = %d\n", line + 1);
            return spu.err;
        }
        line++;
    }

    SpuStructDtor (&spu);

    return 0;
}

#define DO_PUSH(var) StackPush (&(spu->stk), (var));
#define DO_POP(var)  StackPop  (&(spu->stk), (var));

#define DEF_CMD(name, opCode, arg, action)                              \
    case opCode:                                                        \
        (action);                                                       \
        break;

#define MAKE_COND_JMP(name, opCode, sign)                               \
    case opCode:                                                        \
        DO_POP (&var2);                                                 \
        DO_POP (&var1);                                                 \
        if (var1 sign var2) *ip = arg;                                  \
        break;

static int ExecuteCommand (const char* const str, int* ip, SPU_Struct* spu)
{
    assert (str);
    assert (ip);
    assert (spu);

    int command = 0;
    SPU_Type var1 = 0, var2 = 0;

    command = str[(*ip)++];

    SPU_Type arg = 0;
    int reg = 0;

    DecodeArg (str, ip, command, &arg, &reg);
    arg += spu->registers[reg];

    switch (command & 0x3F) /// 00 11 11 11
    {
        #include "STL_commands.h"

        #include "STL_jmp.h"

        default:
            printf ("I'm default\n");
            return ERROR_INCORRECT_FUNC;
    }

    return 0;
}
#undef DO_PUSH
#undef DO_POP

#undef DEF_CMD

#undef MAKE_COND_JMP

static int DecodeArg (const char* const str, int* ip, int command, SPU_Type* arg, int* reg)
{
    assert (str);
    assert (ip);
    assert (arg);
    assert (reg);

    if (command & T_ARG_INT)
    {
        *arg = *(const SPU_Type*)(str + *ip);
        *ip += sizeof (SPU_Type);
    }
    if (command & T_ARG_REG)
    {
        *reg = *(str + *ip);

        if (0 <= *reg && *reg <= nRegisters) ;
        else return ERROR_INCORRECT_VALUE;

        *ip += sizeof (char);
    }

    return 0;
}

static int ReadFile (char** str, const char* const fileName, int* ip)
{
    assert (str);
    assert (fileName);
    assert (ip);

    struct File file = { .name = fileName };
    STL_Fread (&file);

    *str = file.buf;

    if (CheckFileSignature (*str, ip, 6)) return ERROR_FILE_FORMAT;

    return 0;
}
