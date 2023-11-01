#include "include/STL_labels.h"

static int StrlenUpToSpace (const char* const string);

int LabelsStructCtor (Labels* labels)
{
    assert (labels);

    labels->nLabels = 0;

    for (int i = 0; i < 10; ++i)
    {
        // labels = ...
    }

    return 0;
}

int LabelsStructDtor (Labels* labels)
{
    assert (labels);

    labels->nLabels = 0;

    for (int i = 0; i < 10; ++i)
    {
        // labels = ...
    }

    return 0;
}

int FixupsStructCtor (Fixups* fixups)
{
    assert (fixups);

    fixups->nFixups = 0;

    for (int i = 0; i < 10; ++i)
    {
        // labels = ...
    }

    return 0;
}

int FixupsStructDtor (Fixups* fixups)
{
    assert (fixups);

    fixups->nFixups = 0;

    for (int i = 0; i < 10; ++i)
    {
        // fixups = ...
    }

    return 0;
}

int LabelsStructPrint (const Labels* labels)
{
    assert (labels);

    for (int i = 0; i < labels->nLabels; ++i)
    {
        printf ("labels[%d] \n", i);
        printf ("\t name = <");
        for (int j = 0; j < labels->labels[i].lenName; ++j)
        {
            printf ("%c", (labels->labels[i].name)[j]);
        }
        printf (">\n");
        printf ("\t lenN = %d \n", labels->labels[i].lenName);
        printf ("\t byte = %d \n", labels->labels[i].byte);
    }

    return 0;
}

int FixupsStructPrint (const Fixups* fixups, const Labels* labels)
{
    assert (fixups);
    assert (labels);

    for (int i = 0; i < fixups->nFixups; i++)
    {
        printf ("fixup = %d\n", i);
        printf ("\t index = %d\n", fixups->fixups[i].labelIndex);
        printf ("\t byte  = %d\n", fixups->fixups[i].byte);
    }

    return 0;
}

int SetLabel (const char* string, const int ip, Labels* labels, Fixups* fixups)
{
    assert (string);
    assert (ip >= 0);
    assert (labels);
    assert (fixups);

    int nLabel = FindLabel (string, labels);

    CreateLabel (labels, nLabel, string, ip);

    return 0;
}

int SetLabelArg (const char* string, char* str, int* ip, Labels* labels, Fixups* fixups)
{
    assert (string);
    assert (str);
    assert (ip);
    assert (labels);
    assert (fixups);

    int nLabel = FindLabel (string, labels);

    if (nLabel < labels->nLabels && labels->labels[nLabel].byte != -1) // Label::POISON)  // POISON
    {
        *(SPU_DATA_TYPE*)(str + *ip) = labels->labels[nLabel].byte;

        *ip += sizeof (SPU_DATA_TYPE);

        return 0;
    }

    fixups->fixups[fixups->nFixups].byte = *ip;
    fixups->fixups[fixups->nFixups++].labelIndex = labels->nLabels;

    if (nLabel == labels->nLabels)
    {
        CreateLabel (labels, nLabel, string, -1);
    }

    *ip += sizeof (SPU_DATA_TYPE);

    return 0;
}

int CreateLabel (Labels* labels, const int nLabel, const char* name, int byte = -1)
{
    assert (labels);
    assert (nLabel >= 0);
    assert (name);

    labels->labels[nLabel].name = name;
    labels->labels[nLabel].lenName = StrlenUpToSpace (name);
    labels->labels[nLabel].byte = byte;

    if (nLabel == labels->nLabels) labels->nLabels++;
}

int FindLabel (const char* string, Labels* labels)
{
    assert (labels);

    int i = 0;

    for (; i <= labels->nLabels - 1; ++i)
    {
        if (strncmp (string, labels->labels[i].name, labels->labels[i].lenName) == 0)
        {
            break;
        }
    }

    return i;
}

int DoFixups (char* str, const Labels* labels, const Fixups* fixups)
{
    assert (labels);
    assert (fixups);

    for (int i = 0; i < fixups->nFixups; i++)
    {
        *(SPU_DATA_TYPE*)(str + fixups->fixups[i].byte) = labels->labels[fixups->fixups[i].labelIndex].byte;
    }

    return 0;
}

static int StrlenUpToSpace (const char* const string)
{
    assert (string);

    int i = 0;
    while (string[i] != ' ' && string[i] != '\n' && string[i] != '\0') i++;

    return i - 1;
}
