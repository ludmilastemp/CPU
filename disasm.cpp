#include "disasm.h"

int TranslateToASM (FILE* fp, String* strings);
void STL_Print     (FILE* fp, const char* const fmt, ...);

int BinToASM (const char* binFile, const char* asmFileNew)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, binFile);

    FILE* fp = fopen (asmFileNew, "w");

    int line = 0;
    while (line < file.nLines)
    {
        TranslateToASM (fp, &(file.strings[line++]));
    }

    fclose (fp);
}

int TranslateToASM (FILE* fp, String* strings)
{
    int i = 0;
    int comand = 0;

    sscanf (strings->str, "%d", &comand);

    STL_Print (fp, "%s ", funcText[comand]);

    for (int j = 2; j < strings->len; j++)
        STL_Print (fp, "%c", strings->str[j]);
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
