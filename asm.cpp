#include "asm.h"

static int  TranslateToSPU (FILE* fp, String* strings);
static void STL_Print      (FILE* fp, const char* const fmt, ...);

#define TransToSPU(fp,str)                                      \
    do                                                          \
    {                                                           \
        int errDef = TranslateToSPU ((fp), (str));              \
        if (errDef)                                             \
        {                                                       \
            STL_SpuStructErrPrint (errDef);                     \
            printf ("line = %d\n", line);                       \
            return errDef;                                      \
        }                                                       \
    } while (false)

int ASMToBin (const char* asmFile, const char* binFile)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);

    FILE* fp = fopen (binFile, "wb");

    STL_Print (fp, "STL v3\n");

    int line = 0;
    while (line < file.nLines)
    {
        TransToSPU (fp, &(file.strings[line++]));
    }

    fclose (fp);

    return 0;
}

static int TranslateToSPU (FILE* fp, String* strings)
{
    char str[1000] = "0";

    sscanf (strings->str, "%s", str);

    int func = 0;
    for (; func < nFunc; func++)
    {
        if (strcmp (str, funcText[func]) == 0) break;
    }

    if (func == nFunc) return ERROR_INCORRECT_FUNC;

    STL_Print (fp, "%c", func + INITIAL_VALUE_OF_FUNCTIONS);

    if (func < nFuncWithArguments)
    {
        int variable = 0;

        if (sscanf (strings->str + strlen(str), "%d", &variable))
        {
            STL_Print (fp, "%d", variable);
        }
        else
        {
            int reg = 0;
            int check = 0;

            sscanf (strings->str + strlen(str) + 1, "r%[abcd]x%n", &reg, &check);

            if (check == 3) STL_Print (fp, "r%cx", reg);
            else return ERROR_INCORRECT_VALUE;
        }
    }

    STL_Print (fp, "\n");

    return 0;
}

static void STL_Print (FILE* fp, const char* const fmt, ...)
{
    assert   (fmt);

    va_list   args = {};

    va_start (args, fmt);

    vfprintf (fp, fmt, args);

    va_end   (args);
}
#undef TransToSPU

