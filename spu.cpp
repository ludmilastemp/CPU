#include "spu.h"

static void STL_Print (FILE* fp, const char* const fmt, ...);

int SPU (const char* fileName)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, fileName);

    struct Stack stk = { };
    StackCtor (&stk);

    int line = 0;       int a = 0, b = 0;
    while (line < file.nLines)
    {
        switch ((file.strings[line]).str[0])
        {
            case '0':  // push
                a = atoi(&((file.strings[line]).str[2]));
                StackPush (&stk, a);
                break;
            case '1':  // add
                StackPop  (&stk, &b);
                StackPop  (&stk, &a);
                StackPush (&stk, a + b);
                break;
            case '2':  // sub
                StackPop  (&stk, &b);
                StackPop  (&stk, &a);
                StackPush (&stk, a - b);
                break;
            case '3':  // mul
                StackPop  (&stk, &b);
                StackPop  (&stk, &a);
                StackPush (&stk, a * b);
                break;
            case '4':  // div
                StackPop  (&stk, &b);
                StackPop  (&stk, &a);
                StackPush (&stk, a / b);
                break;
            case '5':  // sqrt
                StackPop  (&stk, &a);
                StackPush (&stk, sqrt(a));
                break;
            case '6':  // sin
                StackPop  (&stk, &a);
                StackPush (&stk, sin(a));
                break;
            case '7':  // cos
                StackPop  (&stk, &a);
                StackPush (&stk, cos(a));
                break;
            case '8':  // in
                printf ("\nPlease, enter a number: ");
                scanf ("%d", &a);
                StackPush (&stk, a);
                break;
            case '9':  // OUT
                StackPop  (&stk, &a);
                printf ("OUT = %d\n", a);
                break;
            case 'E':  // HTL
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
