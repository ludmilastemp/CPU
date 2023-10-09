#include "disasm.h"

int TranslateToASM (FILE* fp, String* strings);
void STL_Print     (FILE* fp, const char* const fmt, ...);

#define CheckFile(str1, str2)                                   \
    do                                                          \
    {                                                           \
        if (strncmp ((str1), (str2), 6) != 0)                       \
        {                                                       \
            STL_SpuStructErrPrint (ERROR_NOT_MY_FILE);          \
            return ERROR_NOT_MY_FILE;                           \
        }                                                       \
    } while (false)

#define TransToASM(fp,str)                                      \
    do                                                          \
    {                                                           \
        int errDef = TranslateToASM ((fp), (str));              \
        if (errDef)                                             \
        {                                                       \
            STL_SpuStructErrPrint (errDef);                     \
            printf ("line = %d\n", line);                       \
            return errDef;                                      \
        }                                                       \
    } while (false)

int BinToASM (const char* binFile, const char* asmFileNew)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, binFile);

    FILE* fp = fopen (asmFileNew, "wb");
    CheckFile ((file.strings[0]).str, "STL v3");

    int line = 1;
    while (line < file.nLines)
    {
        TransToASM (fp, &(file.strings[line++]));
    }

    fclose (fp);

    return 0;
}

int TranslateToASM (FILE* fp, String* strings)
{
    int comand = 0;

    char str[1000] = "0";

    sscanf (strings->str, "%c", &comand);

    STL_Print (fp, "%s ", funcText[comand - INITIAL_VALUE_OF_FUNCTIONS]);

    for (int i = 1; i < strings->len; i++)
        STL_Print (fp, "%c", strings->str[i]);
    STL_Print (fp, "\n");

    return 0;
}

void STL_Print (FILE* fp, const char* const fmt, ...)
{
    assert   (fmt);

    va_list   args = {};

    va_start (args, fmt);

    vfprintf (fp, fmt, args);

    va_end   (args);
}
