#include "spu.h"

static void STL_Print (FILE* fp, const char* const fmt, ...);

int SPU (const char* fileName)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, fileName);

    struct SPU_Struct spu = { };
    SpuStructCtor (&spu);

    int line = 0;
    int comand = 0;

    while (line < file.nLines)
    {
        int a = 0, b = 0;

        sscanf ((file.strings[line]).str, "%d", &comand);

        switch (comand)
        {
            case SPU_PUSH:
                a = atoi(&((file.strings[line]).str[2]));
                StackPush (&(spu.stk), a);
                break;
            case SPU_ADD:
                StackPop  (&(spu.stk), &b);
                StackPop  (&(spu.stk), &a);
                StackPush (&(spu.stk), a + b);
                break;
            case SPU_SUB:
                StackPop  (&(spu.stk), &b);
                StackPop  (&(spu.stk), &a);
                StackPush (&(spu.stk), a - b);
                break;
            case SPU_MUL:
                StackPop  (&(spu.stk), &b);
                StackPop  (&(spu.stk), &a);
                StackPush (&(spu.stk), a * b);
                break;
            case SPU_DIV:
                StackPop  (&(spu.stk), &b);
                StackPop  (&(spu.stk), &a);
                StackPush (&(spu.stk), a / b);
                break;
            case SPU_SQRT:
                StackPop  (&(spu.stk), &a);
                StackPush (&(spu.stk), sqrt(a));
                break;
            case SPU_SIN:
                StackPop  (&(spu.stk), &a);
                StackPush (&(spu.stk), sin(a));
                break;
            case SPU_COS:
                StackPop  (&(spu.stk), &a);
                StackPush (&(spu.stk), cos(a));
                break;
            case SPU_IN:
                printf ("\nPlease, enter a number: ");
                scanf ("%d", &a);
                StackPush (&(spu.stk), a);
                break;
            case SPU_OUT:
                StackPop  (&(spu.stk), &a);
                printf ("OUT = %d\n", a);
                break;
            case SPU_HTL:
                SpuStructDtor (&spu);
                return 0;
        }

        line++;
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
