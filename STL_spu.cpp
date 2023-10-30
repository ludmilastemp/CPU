#include "include/STL_spu.h"

const int RAM_SIZE = 1000;

static SPU_DATA_TYPE ram[RAM_SIZE] = { 0 };
static int index_ret = 610;

static int Execute (const char* const str, int ip);

static int ExecuteCommand (const char* const str, int* ip, SPU_Struct* spu);

static int DecodeArg (const char* const str, int* ip, int command,
        SPU_Struct* spu, SPU_DATA_TYPE* arg, int** argPtr);

static int ReadFile (char** str, const char* const fileName, int* ip);

// #define verified  || AssertFailed ((__LINE__)

// #define verified  || ({ return 1; })

int SPU (const char* fileName)
{
    assert (fileName);

    char* str = 0;
    int ip = 0;

    if (ReadFile (&str, fileName, &ip)) return ERROR_FILE_FORMAT;

    Execute (str, ip); // == 0 onerror_ret;

    free (str);

//    for (int i = 0; i < 20; ++i)
//    {
//        for (int j = 0; j < 40; ++j)
//        {
//            if (ram[i * 40 + j] == 0) printf (".");
//            else printf ("*");
//        }
//        printf ("\n");
//    }

    return 0;
}


static int Execute (const char* const str, int ip)
{
    assert (str);

    struct SPU_Struct spu = { };
    SpuStructCtor (&spu);

    while (true)
    {
        spu.err = ExecuteCommand (str, &ip, &spu);

//        StackDump (&spu.stk);

        if (spu.err == -1) break;

        if (spu.err)
        {
            STL_SpuErrPrint (spu.err);
            return spu.err;
        }
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

//    printf ("ip = %d\n", *ip - 1);
//    printf ("command = 0x%x\n", command);

//    printf ("rax = %d\n", spu->registers[1] / 100);
//    printf ("rbx = %d\n", spu->registers[2] / 100);
//    printf ("\n\n\n");

    SPU_DATA_TYPE arg = 0;
    int reg     = 0;
    int* argPtr = 0;

    DecodeArg (str, ip, command, spu, &arg, &argPtr);


    switch (command & 0x1F) /// 00 01 11 11
    {
        #include "include/STL_commands.h"

        #include "include/STL_jmp.h"

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

static int DecodeArg (const char* const str, int* ip, int command,
        SPU_Struct* spu, SPU_DATA_TYPE* arg, int** argPtr)
{
    assert (str);
    assert (ip);
    assert (spu);
    assert (arg);
    assert (argPtr);

    if (command & T_ARG_CONST)
    {
        *arg = *(const SPU_DATA_TYPE*)(str + *ip);
        *ip += sizeof (SPU_DATA_TYPE);
    }

    if (command & T_ARG_REG)
    {
        int reg = *(str + *ip);

        if (0 <= reg && reg <= nRegisters) ;
        else return ERROR_INCORRECT_VALUE;

        *ip += sizeof (char);

        *arg += spu->registers[reg];
        *argPtr = &(spu->registers[reg]);
    }

    if (command & T_ARG_RAM)
    {
        *arg = ram[*arg / floatPrecision];
        *argPtr = &(ram[*arg / floatPrecision]);
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
