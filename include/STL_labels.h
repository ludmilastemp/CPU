#ifndef STL_spu_
#define STL_spu_

#include "STL_spu_struct_const.h"

#include <stdio.h>
#include <string.h>
#include <assert.h>

struct Label
{
    const char* name;
    int lenName;
    int byte;
};

struct Labels
{
    Label labels[10];
    int nLabels;
};

struct Fixup
{
    int byte;
    int labelIndex;
};

struct Fixups
{
    Fixup fixups[10];
    int nFixups;
};

int LabelsStructCtor  (Labels* labels);

int LabelsStructDtor  (Labels* labels);

int FixupsStructCtor  (Fixups* fixups);

int FixupsStructDtor  (Fixups* fixups);

int LabelsStructPrint (const Labels* labels);

int FixupsStructPrint (const Fixups* fixups, const Labels* labels);

int SetLabel  (const char* string, const int ip, Labels* labels, Fixups* fixups);

int SetLabelArg (const char* string, char* str, int* ip, Labels* labels, Fixups* fixups);

int CreateLabel (Labels* labels, const int nLabel, const char* name, const int byte);

int FindLabel (const char* string, Labels* labels);

int DoFixups  (char* str, const Labels* labels, const Fixups* fixups);

#endif /* STL_spu */
