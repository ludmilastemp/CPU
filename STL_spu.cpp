#include "STL_spu.h"

const int RAM_SIZE = 1000;

static SPU_DATA_TYPE ram[RAM_SIZE] = { 0 };
static int index_ret = 610;

static int Execute (const char* const str, int ip);

static int ExecuteCommand (const char* const str, int* ip, SPU_Struct* spu);

static int DecodeArg (const char* const str, int* ip, int command, SPU_DATA_TYPE* arg, int* reg);

static int ReadFile (char** str, const char* const fileName, int* ip);

#define verified  || AssertFailed ((__LINE__)

#define verified  || ({ return 1; })


int SPU (const char* fileName)
{
    assert (fileName);

    char* str = 0;
    int ip = 0;

    if (ReadFile (&str, fileName, &ip)) return ERROR_FILE_FORMAT;

    Execute (str, ip) == 0 onerror_ret;

    free (str);

    return 0;
}


static int Execute (const char* const str, int ip)
{
    assert (str);

    struct SPU_Struct spu = { };
    SpuStructCtor (&spu);

    int line = 0;

    while (true)
    {
        spu.err = ExecuteCommand (str, &ip, &spu);

//        StackDump (&spu.stk);

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
    SPU_DATA_TYPE var1 = 0, var2 = 0;

    command = str[(*ip)++];

    printf ("ip = %d\n", *ip - 1);
    printf ("command = 0x%x\n", command);
    printf ("rax = %d\n", spu->registers[1] / 100);
    printf ("rbx = %d\n", spu->registers[2] / 100);
    printf ("\n\n\n");

    SPU_DATA_TYPE arg = 0;
    int reg     = 0;
    int ram_ptr = 0;

    DecodeArg (str, ip, command, &arg, &reg);

//    arg *= floatPrecision;

    if (command & T_ARG_REG) arg += spu->registers[reg];
    if (command & T_ARG_RAM)
    {
        ram_ptr = arg / floatPrecision;
        arg = ram[arg / floatPrecision];
    }

    switch (command & 0x1F) /// 00 01 11 11
    {
        #include "STL_commands.h"

        #include "STL_jmp.h"

        default:
            printf ("I'm default\n");
            printf ("command = 0x%x\n", command);
            printf ("        = 0x%x\n", command & 0x1F);
            printf ("ip = %d\n", *ip);

            return ERROR_INCORRECT_FUNC;
    }

    return 0;
}
#undef DO_PUSH
#undef DO_POP

#undef DEF_CMD

#undef MAKE_COND_JMP

static int DecodeArg (const char* const str, int* ip, int command, SPU_DATA_TYPE* arg, int* reg)
{
    assert (str);
    assert (ip);
    assert (arg);
    assert (reg);

    if (command & T_ARG_CONST)
    {
        *arg = *(const SPU_DATA_TYPE*)(str + *ip);
        *ip += sizeof (SPU_DATA_TYPE);
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

    if (CheckFileSignature (*str, ip, 7)) return ERROR_FILE_FORMAT;

    return 0;
}
