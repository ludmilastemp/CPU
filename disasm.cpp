#include "disasm.h"

static char str[FILE_MAX_SIZE_IN_BYTES] = "";
static int index = 0;

static int DisAsmFile (const char* const strBin);

static int DisAsmOperation (const char* const strBin, int* indexBin);

static int PrintArg (const char* const strBin, int* type);

static int CheckFileSignature (const char* const str, const char* const signature);

static int ReadBinFile (char* strBin, const char* const binFile, int* indexBin);

static int WriteInFile (const char* const asmFileNew);

int DisAsm (const char* binFile, const char* asmFileNew)
{                               // typedef
    char strBin[FILE_MAX_SIZE_IN_BYTES] = "";
    int indexBin = 0;

    ReadBinFile (strBin, binFile, &indexBin);

    DisAsmFile (strBin + indexBin);

    WriteInFile (asmFileNew);

    return 0;
}

static int DisAsmFile (const char* const strBin)
{
    int indexBin = 0;

    int nCommand = *(int*)(strBin + indexBin);
    indexBin += sizeof (int);

    int line = 0;
    int error = 0;
    while (line < nCommand)
    {
    //             a
        error = DisAsmOperation (strBin, &indexBin);

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

#define DEF_CMD(name, opCode, nArg, ...)                                 \
    case opCode:                                                        \
        {                                                               \
                                                                        \
        int len = strlen (#name);                                       \
        strncpy (str + index, #name, len);                              \
        index += len;                                                   \
                                                                        \
        str[index++] = ' ';                                             \
                                                                        \
        if (nArg)                                                       \
        {                                                               \
            int type = command & (T_ARG_INT | T_ARG_REG);               \
                                                                        \
            PrintArg (strBin + *indexBin, &type);                       \
                                                                        \
            if      (type == T_ARG_INT) *indexBin += sizeof (int);      \
            else if (type == T_ARG_REG) *indexBin += sizeof (char);     \
            else return ERROR_INCORRECT_VALUE;                          \
        }                                                               \
                                                                        \
        }                                                               \
        break;

int DisAsmOperation (const char* const strBin, int* indexBin)
{
    int command = 0;
    command = strBin[(*indexBin)++];

    switch (command & 0x3F)
    {
        #include "STL_commands.h"

        default:
            printf ("I default\n");
            return ERROR_INCORRECT_FUNC;
    }

    return 0;
}
#undef DEF_CMD

static int PrintArg (const char* const strBin, int* type)
{
    int arg = 0;
    char argc[10] = "";
    if (*type & T_ARG_INT)
    {
        arg = *(int*)(strBin);
        sprintf (argc, "%d", arg);
        strcpy (str + index, argc);
        index += strlen (argc);

        *type = T_ARG_INT;
    }
    else if (*type & T_ARG_REG)
    {
        arg = *strBin;
        sprintf (argc, "r%cx", arg + 'a');
        strcpy (str + index, argc);
        index += strlen (argc);

        if (0 <= arg && arg <= 4) ;
        else return ERROR_INCORRECT_VALUE;

        *type = T_ARG_REG;
    }
    else
    {
        *type = 0;
    }

    return 0;
}

// binfmt - yfpdfybt afqkf dct xnj c [tlthjv
// copypasta

// cpu exception (invalid memory, invalid instruction)
static int CheckFileSignature (const char* const str1, const char* const signature)
{
    if (strncmp ((str1), (signature), SIGNATURE_LENGTH) != 0)
    {
        STL_SpuErrPrint (ERROR_FILE_FORMAT); //????
        return ERROR_FILE_FORMAT;
    }

    return 0;
}

static int ReadBinFile (char* strBin, const char* const binFile, int* indexBin)
{
    // assert!!!

    FILE* fp = fopen (binFile, "rb");
    // naked fopen

    fread (strBin, sizeof(char), FILE_MAX_SIZE_IN_BYTES, fp);

    if (CheckFileSignature (strBin, "STL v5")) return ERROR_FILE_FORMAT;
    *indexBin += SIGNATURE_LENGTH;

    fclose (fp);

    return 0;
}

static int WriteInFile (const char* const asmFileNew)
{
    FILE* fp = fopen (asmFileNew, "wb");
    // naked fopen

    fwrite (str, sizeof(char), index, fp);

    fclose (fp);
}

