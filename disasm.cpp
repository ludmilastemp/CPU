#include <stdio.h>
#include <stdarg.h>

#include "STL_file_open.h"

int DISASMToASM (FILE* fp, String* strings);
void STL_Print  (FILE* fp, const char* const fmt, ...);

int ByteToASM (const char* byteFile, const char* asmFileNew)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, byteFile);

    FILE* fp = fopen (asmFileNew, "w");

    int line = 0;
    while (line < file.nLines)
    {
        DISASMToASM (fp, &(file.strings[line++]));
    }

    fclose (fp);
}

int DISASMToASM (FILE* fp, String* strings)
{
    int i = 0;
    switch (strings->str[0])
    {
        case '0':
            STL_Print (fp, "push ");
            break;
        case '1':
            STL_Print (fp, "add ");
            break;
        case '2':
            STL_Print (fp, "sub ");
            break;
        case '3':
            STL_Print (fp, "mul ");
            break;
        case '4':
            STL_Print (fp, "div ");
            break;
        case '5':
            STL_Print (fp, "sqrt ");
            break;
        case '6':
            STL_Print (fp, "sin ");
            break;
        case '7':
            STL_Print (fp, "cos ");
            break;
        case '8':
            STL_Print (fp, "in ");
            break;
        case '9':
            STL_Print (fp, "OUT ");
            break;
        case 'E':
            STL_Print (fp, "HLT ");
            break;
    }

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
