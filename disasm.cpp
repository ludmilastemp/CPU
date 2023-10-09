#include "disasm.h"

int TranslateToASM (FILE* fp, String* strings);
void STL_Print     (FILE* fp, const char* const fmt, ...);

int BinToASM (const char* binFile, const char* asmFileNew)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, binFile);

    FILE* fp = fopen (asmFileNew, "wb");
    if (!strcmp ((file.strings[0]).str, "STL v2")) return 0; //ERROR

    int line = 1;
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

    char str[1000] = "0";

    sscanf (strings->str, "%c", &comand);

    STL_Print (fp, "%s ", funcText[comand - INITIAL_VALUE_OF_FUNCTIONS]);

//    sscanf (&(strings->str[1]), "%s", str);
//    STL_Print (fp, "%s\n", str);

    for (int j = 1; j < strings->len; j++)
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
