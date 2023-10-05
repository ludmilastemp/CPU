#include "asm.h"

static int  TranslateToCPU (FILE* fp, String* strings);
static void STL_Print      (FILE* fp, const char* const fmt, ...);

int ASMToByte (const char* asmFile, const char* byteFile)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);

    FILE* fp = fopen (byteFile, "w");

    int line = 0;
    while (line < file.nLines)
    {
        TranslateToCPU (fp, &(file.strings[line++]));
    }

    fclose (fp);
}

static int TranslateToCPU (FILE* fp, String* strings)
{
    char com[1000] = "0";

    int i = 0;
    while (strings->str[i] != ' ' && strings->str[i] != '\n')
    {
        com[i] = strings->str[i];
        i++;
    }

    if (strcmp (com, "push") == 0) STL_Print (fp, "0 ");
    if (strcmp (com, "add" ) == 0) STL_Print (fp, "1 ");
    if (strcmp (com, "sub" ) == 0) STL_Print (fp, "2 ");
    if (strcmp (com, "mul" ) == 0) STL_Print (fp, "3 ");
    if (strcmp (com, "div" ) == 0) STL_Print (fp, "4 ");
    if (strcmp (com, "sqrt") == 0) STL_Print (fp, "5 ");
    if (strcmp (com, "sin" ) == 0) STL_Print (fp, "6 ");
    if (strcmp (com, "cos" ) == 0) STL_Print (fp, "7 ");
    if (strcmp (com, "in"  ) == 0) STL_Print (fp, "8 ");
    if (strcmp (com, "OUT" ) == 0) STL_Print (fp, "9 ");
    if (strcmp (com, "HLT" ) == 0) STL_Print (fp, "E ");

    for (int j = strlen(com) + 1; j < strings->len; j++)
        STL_Print (fp, "%c", strings->str[j]);
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
