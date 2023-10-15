#ifndef STL_file_open_
#define STL_file_open_

#include <stdlib.h>
#include <sys\stat.h>
#include <string.h> //
#include <stdarg.h>
#include <assert.h>

#include "STL_string.h"

struct File
{
    const char* name;
    FILE* fp;
    char* buf;
    size_t size;
    int nLines;
    String* strings;
};

char* STL_Fread (struct File* file);

String* STL_SplitFileIntoLines (struct File* file, const char* name);

int STL_Fclose (struct File* file);

void STL_PrintFile (FILE* fp, const char* const fmt, ...);

#endif
