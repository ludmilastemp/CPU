#include "asm.h"

static char* str = 0;
static int  ip = 0;

struct label
{
    const char* name;
    int lenName;
    int byte;
};

static label labels[10] = { };           // динамика
static int nLabel = 0;

struct fixup
{
    int byte;
    int labelIndex;
};

static fixup fixups[10] = { };
static int nFixup = 0;

static int CompileFile (File* file);

static int CompileOperation (const char* string);

static int ParseArg (const char* string, unsigned char opCode);

static int WriteInBinFile (const char* const binFile);

static int StrlenUpToSpace (const char* const string);

int Compile (const char* const asmFile, const char* const binFile)
{
    assert (asmFile);
    assert (binFile);

    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);

    str = (char*) calloc (file.size, sizeof (char));
    assert (str);

    WriteSignature (7, str, &ip);

    if (CompileFile (&file)) return 1;

    WriteInBinFile (binFile);

    STL_Fclose (&file);
//
//    for (int i = 0; i < 10; ++i)
//    {
//        printf ("labels[%d] \n", i);
//        printf ("\t name = <> \n", labels[i].name);
//        for (int j = 0; j < labels[i].lenName; ++j)
//        {
//            printf ("%c", labels[i].name + j);
//        }
//        printf ("\t byte = <%d> \n", labels[i].byte);
//    }

    return 0;
}

static int CompileFile (File* file)
{
    assert (file);

    int line = 0;
    int error = 0;

    while (line < file->nLines)
    {
        while ((file->strings[line]).len == 1) line++;

//        printf ("line = %d\n", line);

        error = CompileOperation ((file->strings[line++]).str);

        if (error)
        {
            printf ("line = %d\n", line);
            STL_SpuErrPrint (error);
            return error;
        }
    }

    for (int i = 0; i < nFixup; i++)
    {
        *(int*)(str + fixups[i].byte) = labels[fixups[i].labelIndex].byte;
    }

    return 0;
}

#define DEF_CMD(name, opCode, arg, ...)                                 \
    if (strnicmp (string, #name, strlen(#name)) == 0)                   \
    {                                                                   \
        if (arg)                                                        \
        {                                                               \
            ParseArg (string + strlen(#name) + 1, opCode);              \
        }                                                               \
        else                                                            \
        {                                                               \
            str[ip++] = opCode;                                         \
        }                                                               \
                                                                        \
    } else

#define MAKE_COND_JMP(name, opCode, ...)                                \
    if (strnicmp (string, #name, strlen(#name)) == 0)                   \
    {                                                                   \
        ParseArg (string + strlen(#name) + 1, opCode);                  \
    } else

static int CompileOperation (const char* string)
{
    assert (string);

    while (string[0] == ' ') string++;      /// пропуск \t
    if    (string[0] == 0)   return 0;

    if    (string[0] == ':')
    {
        int i = 0;
        for (; i < nLabel - 1; ++i)
        {
            if (strncmp (string + 1, labels[i].name, labels[i].lenName) == 0)
            {
                break;
            }
        }

        labels[i].name = string + 1;
        labels[i].lenName = StrlenUpToSpace (string + 1);
        labels[i].byte = ip;

        if (i == nLabel) nLabel++;
    }
    else /* if */

    #include "STL_commands.h"

    #include "STL_jmp.h"

    /* else */
    {
        printf ("<%s>\n", string);
        return ERROR_INCORRECT_FUNC;
    }

    return 0;
}
#undef DEF_CMD

#undef MAKE_COND_JMP

#define DEF_REG(name, opCode)                                           \
    if (strnicmp (string, #name, strlen(#name)) == 0)                   \
    {                                                                   \
        arg = opCode;                                                   \
        string += strlen(#name);                                        \
    } else

static int ParseArg (const char* string, unsigned char opCode)
{
    assert (string);

    int arg = 0;

    if (string[0] == ':')
    {
        str[ip++] = opCode | T_ARG_CONST;

        int i = 0;
        for (; i < nLabel; ++i)
        {
            if (strncmp (string + 1, labels[i].name, labels[i].lenName) == 0)
            {
                if (labels[i].byte != -1)
                {
                    *(int*)(str + ip) = labels[i].byte;
                }

                ip += sizeof (int);

                return 0;
            }
        }

        labels[i].name = string + 1;
        labels[i].lenName = StrlenUpToSpace (string + 1);

        fixups[nFixup].byte = ip;
        fixups[nFixup++].labelIndex = nLabel;

        nLabel++;

        ip += sizeof (int);

        return 0;
    }

    if (string[0] == '[')
    {
        opCode |= T_ARG_RAM;
        string++;
    }

    float var = 0;
    if (sscanf (string, "%f", &var))
    {
//        printf ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//        printf ("var = %f\n", var);
//        printf ("arg = %d\n", arg);
        arg = (int)(var * floatPrecision);

        opCode |= T_ARG_CONST;

        while ((string[0] >= '0' && string[0] <= '9') ||
                string[0] == ' ' || string[0] == '.')
        {
            string++;
        }

        if (string[0] == '\r' || string[0] == '\n')
        {
            str[ip++] = opCode | T_ARG_CONST;
            *(SPU_DATA_TYPE*)(str + ip) = arg;

            ip += sizeof (SPU_DATA_TYPE);

            return 0;
        }
    }

    if (opCode & T_ARG_RAM)
    {
        while (string[0] == ' ') string++;
        if (string[0] == ']')
        {
            str[ip++] = opCode;

            if (opCode & T_ARG_CONST)
            {
                *(SPU_DATA_TYPE*)(str + ip) = arg;
                ip += sizeof (SPU_DATA_TYPE);
            }
            return 0;
        }                                               // copycasta
    }

    str[ip++] = opCode | T_ARG_REG;

    if (opCode & T_ARG_CONST)
    {
        *(SPU_DATA_TYPE*)(str + ip) = arg;
        ip += sizeof (SPU_DATA_TYPE);
    }

    #include "STL_registers.h"

    /* else */ return ERROR_INCORRECT_VALUE;

    str[ip++] = (char)arg;

    if (opCode & T_ARG_RAM)
    {
        while (string[0] == ' ') string++;
        if (string[0] != ']') return ERROR_INCORRECT_VALUE;
    }

    return 0;
}

#undef DEF_REG

static int WriteInBinFile (const char* const binFile)
{
    assert (binFile);

    FILE* fp = fopen (binFile, "wb");
    assert (fp);

    fwrite (str, sizeof(char), ip, fp);

    fclose (fp);

    return 0;
}

static int StrlenUpToSpace (const char* const string)
{
    assert (string);

    int i = 0;
    while (string[i] != ' ' && string[i] != '\n' && string[i] != '\0') i++;

    return i - 1;
}

#undef TransToSPU
