#include "STL_spu.h"

static int Execute (const char* const str);

static int ExecuteCommand (const char* const str, int* index, SPU_Struct* spu);

static int ParseArg (const char* const str, int* arg, int type);

static int CheckFileSignature (const char* const str, const char* const signature);

static int ReadFile (char* str, const char* const fileName, int* index);

int SPU (const char* fileName)
{
    char str[FILE_MAX_SIZE_IN_BYTES] = "";
    // getFileSIze calloc!!!!!
    int index = 0;

    ReadFile (str, fileName, &index);

    Execute (str + index);

    return 0;
}

static int Execute (const char* const str)
{
    struct SPU_Struct spu = { };
    SpuStructCtor (&spu);

    int index = 0;
    int nCommand = *(int*)(str + index);
    index += 4;

    int line = 0;
    while (line < nCommand)
    {
        spu.err = ExecuteCommand (str, &index, &spu);

        if (spu.err)
        {
            STL_SpuErrPrint (spu.err);
            printf ("line = %d\n", line + 1);
            return spu.err;
        }
        line++;
    }

    SpuStructDtor (&spu);
}

#define DO_PUSH(var) StackPush (&(spu->stk), (var));
#define DO_POP(var)  StackPop  (&(spu->stk), (var));

#define DEF_CMD(name, opCode, nArg, action)                             \
    case opCode:                                                        \
        (action);                                                       \
        break;

static int ExecuteCommand (const char* const str, int* index, SPU_Struct* spu)
{
    int command = 0;
    int var1 = 0, var2 = 0;

    command = str[(*index)++];

    // �� command -> Write int
    //                     reg

    switch (command & 0x3F) /// 00 11 11 11
    {
        #include "STL_commands.h"

        default:
            printf ("I'm default\n");
            return ERROR_INCORRECT_FUNC;
    }

    return 0;
}
#undef DO_PUSH
#undef DO_POP

#undef DEF_CMD

// decodeArg   instruction
static int ParseArg (const char* const str, int* arg, int type)
{
    if (type & T_ARG_INT)
    {
        *arg = *(int*)(str);
    }
    else if (type & T_ARG_REG)
    {
        *arg = *str;

        if (0 <= *arg && *arg <= 4) ;
        else return ERROR_INCORRECT_VALUE;
    }
    else
    {
        return ERROR_INCORRECT_FUNC;
    }

    return 0;
}

static int CheckFileSignature (const char* const str, const char* const signature)
{
    if (strncmp ((str), (signature), SIGNATURE_LENGTH) != 0)
    {
        STL_SpuErrPrint (ERROR_FILE_FORMAT);
        return ERROR_FILE_FORMAT;
    }
    return 0;
}

static int ReadFile (char* str, const char* const fileName, int* index)
{
    FILE* fp = fopen (fileName, "rb");

    fread (str, sizeof(char), FILE_MAX_SIZE_IN_BYTES, fp);

    if (CheckFileSignature (str, "STL v5")) return ERROR_FILE_FORMAT;
    *index += SIGNATURE_LENGTH;

    fclose (fp);

    return 0;
}
