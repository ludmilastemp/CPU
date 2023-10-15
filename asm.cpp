#include "asm.h"

static char str[FILE_MAX_SIZE_IN_BYTES] = "";
static int  index = 0;

static int CompileFile (File* file);

static int CompileOperation (String* string);

static int ParseArg (const char* const string, int* arg, int* type);

static int WriteSignature (const char* const signature);

static int WriteNumberOperation (const int count);

static int WriteInBinFile (const char* const binFile);

int Compile (const char* const asmFile, const char* const binFile)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);

    WriteSignature ("STL v4\n");
    WriteNumberOperation (file.nLines);

    CompileFile (&file);

    WriteInBinFile (binFile);

    STL_Fclose (&file);

    return 0;
}

static int CompileFile (File* file)
{
    int line = 0;
    int error = 0;
    while (line < file->nLines)
    {
        error = CompileOperation (&(file->strings[line++]));

        if (error)
        {
            printf ("line = %d\n", line);
            STL_SpuStructErrPrint (error);
            return error;
        }
    }

    return 0;
}

#define DEF_CMD(name, num, nArg, ...)                                   \
    if (stricmp (command, #name) == 0)                                  \
    {                                                                   \
        if (nArg)                                                       \
        {                                                               \
            int var = 0;                                                \
            int type = 0;                                               \
                                                                        \
            ParseArg (string->str + strlen(command) + 1, &var, &type);  \
                                                                        \
            str[index++] = num | type;                                  \
            *(int*)(str + index) = var;                                 \
                                                                        \
            if      (type == T_ARG_INT) index += 4;                     \
            else if (type == T_ARG_REG) index += 1;                     \
            else return ERROR_INCORRECT_VALUE;                          \
        }                                                               \
        else                                                            \
        {                                                               \
            str[index++] = num;                                         \
        }                                                               \
                                                                        \
    } else

static int CompileOperation (String* string)
{
    char command[OPERATION_NAME_MAX_LENGTH] = "";

    int len = sscanf (string->str, "%s", command);
    if (len > OPERATION_NAME_MAX_LENGTH - 1) return ERROR_COMMAND_NAME_TOO_LONG;

    #include "STL_commands.h"

    /* else */ return ERROR_INCORRECT_FUNC;

    return 0;
}
#undef DEF_CMD

static int ParseArg (const char* const string, int* arg, int* type = 0)
{
    if (sscanf (string, "%d", arg))
    {
        *type = T_ARG_INT;
        *(int*)(str + index) = *arg;
    }
    else
    {
        int check = 0;

        sscanf (string, "r%[abcd]x%n", arg, &check);

        if (check == 3)
        {
            *type = T_ARG_REG;
                 if (*arg == 'a') *arg = REG_RAX;
            else if (*arg == 'b') *arg = REG_RBX;
            else if (*arg == 'c') *arg = REG_RCX;
            else if (*arg == 'd') *arg = REG_RDX;
        }
        else return ERROR_INCORRECT_VALUE;
    }

    return 0;
}

static int WriteSignature (const char* const signature)
{
    strncpy (str, signature, SIGNATURE_LENGTH);
    index += SIGNATURE_LENGTH;
}

static int WriteNumberOperation (const int count)
{
    *(int*)(str + index) = count;
    index += 4;
}

static int WriteInBinFile (const char* const binFile)
{
    FILE* fp = fopen (binFile, "wb");

    fwrite (str, sizeof(char), index, fp);

    fclose (fp);

    return 0;
}

#undef TransToSPU
