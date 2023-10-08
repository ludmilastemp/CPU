#include "asm.h"

static int  TranslateToSPU (FILE* fp, String* strings);
static void STL_Print      (FILE* fp, const char* const fmt, ...);

int ASMToBin (const char* asmFile, const char* binFile)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);

    FILE* fp = fopen (binFile, "w");

    int line = 0;
    while (line < file.nLines)
    {
        TranslateToSPU (fp, &(file.strings[line++]));
    }

    fclose (fp);
}

static int TranslateToSPU (FILE* fp, String* strings)
{
    char com[1000] = "0";

    sscanf (strings->str, "%s", com);

    for (int i = 0; i < nFunc; i++)
    {
        if (strcmp (com, funcText[i]) == 0)
        {
            STL_Print (fp, "%d ", i);

            if (i < nFuncWithArguments)
            {
                sscanf (strings->str + strlen(com), "%s", com);

                STL_Print (fp, "%s", com);
            }

            STL_Print (fp, "\n");

            break;
        }
    }

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
