#include "disasm.h"

static char* str = 0;
static int index = 0;

static int DisasmFile (const char* const strBin, int indexBin);

static int DisasmOperation (const char* const strBin, int* indexBin);

static int PrintArg (const char* const strBin, int* indexBin, int command);

static int CheckFileSignature (const char* const str, const char* const signature);

static int ReadBinFile (char** strBin, const char* const binFile, int* indexBin);

static int WriteInFile (const char* const asmFileNew);

int Disasm (const char* binFile, const char* asmFileNew)
{                               // typedef
    char* strBin = 0;
    int indexBin = 0;

    ReadBinFile (&strBin, binFile, &indexBin);

    DisasmFile (strBin, indexBin);

    WriteInFile (asmFileNew);

    free (strBin);

    return 0;
}

static int DisasmFile (const char* const strBin, int indexBin)
{
    int line = 0;
    int error = 0;
    while (true)
    {
        error = DisasmOperation (strBin, &indexBin);

        if (error == -1) break;

        if (error)
        {
            STL_SpuErrPrint (error);
            printf ("line = %d\n", line + 1);
            return error;
        }

        line++;

        str[index++] = '\n';
    }
}

#define DEF_CMD(name, opCode, ...)                                      \
    case opCode:                                                        \
        {                                                               \
                                                                        \
        int len = strlen (#name);                                       \
        strncpy (str + index, #name, len);                              \
        index += len;                                                   \
                                                                        \
        str[index++] = ' ';                                             \
                                                                        \
        }                                                               \
        break;

#define MAKE_COND_JMP(name, opCode, ...)                                \
    case opCode:                                                        \
        {                                                               \
                                                                        \
        int len = strlen (#name);                                       \
        strncpy (str + index, #name, len);                              \
        index += len;                                                   \
                                                                        \
        str[index++] = ' ';                                             \
                                                                        \
        }                                                               \
        break;

int DisasmOperation (const char* const strBin, int* indexBin)
{
    char strTemp[10] = "";

    sprintf (strTemp, "%3d", *indexBin);
    strcpy (str + index, strTemp);

    index += strlen (strTemp);
    str[index++] = ' ';

    int command = strBin[(*indexBin)++];

    if (command == -1) return -1;

    switch (command & 0x3F)
    {
        #include "STL_commands.h"

        #include "STL_jmp.h"

        default:
            printf ("I default\n");
            printf ("str = <%s>\n", str + index);
            return ERROR_INCORRECT_FUNC;
    }

    PrintArg (strBin, indexBin, command);

    return 0;
}
#undef DEF_CMD

static int PrintArg (const char* const strBin, int* indexBin, int command)
{
    int arg = 0;
    char argc[10] = "";

    if (command & T_ARG_INT)
    {
        arg = *(int*)(strBin + *indexBin);

        sprintf (argc, "%d", arg);
        strcpy (str + index, argc);

        index += strlen (argc);
        *indexBin += sizeof (int);

        str[index++] = ' ';
    }

    if (command & T_ARG_REG)
    {
        arg = *(strBin + *indexBin);

        strcpy (str + index, "reg_");
        index += sizeof ("reg_") - 1;

        str[index++] = arg + '0';

        if (0 <= arg && arg <= 8) ;
        else return ERROR_INCORRECT_VALUE;

        *indexBin += sizeof (char);
    }

    return 0;
}

static int ReadBinFile (char** strBin, const char* const binFile, int* indexBin)
{
    assert (strBin);
    assert (binFile);
    assert (indexBin);

    struct File file = { .name = binFile };
    STL_Fread (&file);

    *strBin = file.buf;
    *(*strBin + file.size - 1) = -1;

    if (CheckFileSignature (*strBin, indexBin, 6)) return ERROR_FILE_FORMAT;

    str = (char*) calloc (file.size * 10, sizeof (char));
    assert (str);                  ///////////////////////////////

    return 0;
}

static int WriteInFile (const char* const asmFileNew)
{
    assert (asmFileNew);

    FILE* fp = fopen (asmFileNew, "wb");
    assert (fp);

    fwrite (str, sizeof(char), index, fp);

    fclose (fp);
}

