#include "STL_spu.h"

static int  ExecuteFunc (const char* const str, SPU_Struct* spu);
static void STL_Print (FILE* fp, const char* const fmt, ...);

#define CheckFile(str1, str2)                                   \
    do                                                          \
    {                                                           \
        if (strncmp ((str1), (str2), 6) != 0)                   \
        {                                                       \
            STL_SpuStructErrPrint (ERROR_NOT_MY_FILE);          \
            return ERROR_NOT_MY_FILE;                           \
        }                                                       \
    } while (false)
                                         // длина кодировки const

#define ExecFunc(fp,spuStr)                                        \
    do                                                          \
    {                                                           \
        spu.err = ExecuteFunc ((fp), (spuStr));                 \
        if (spu.err)                                            \
        {                                                       \
            STL_SpuStructErrPrint (spu.err);                    \
            printf ("line = %d\n", line);                       \
            return spu.err;                                     \
        }                                                       \
    } while (false)

int SPU (const char* fileName)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, fileName);

    CheckFile ((file.strings[0]).str, "STL v3");

    struct SPU_Struct spu = { };
    SpuStructCtor (&spu);

    int line = 1;

    while (line < file.nLines)
    {
        ExecFunc ((file.strings[line]).str, &spu);
        line++;
    }

    return 0;
}

static int ExecuteFunc (const char* const str, SPU_Struct* spu)
{
    int comand = 0;
    int var1 = 0, var2 = 0;

    sscanf (str, "%c", &comand);

    switch (comand)
    {
        case SPU_PUSH:
            if (sscanf (&(str[1]), "%d", &var1))
            {
                StackPush (&(spu->stk), var1);
                break;
            }

            {

            int reg = 0;
            int check = 0;

            sscanf (&(str[1]), "r%[abcd]x%n", &reg, &check);

            if (check == 3)
            {
                if (reg == 'a') StackPush (&(spu->stk), spu->rax);
                if (reg == 'b') StackPush (&(spu->stk), spu->rbx);
                if (reg == 'c') StackPush (&(spu->stk), spu->rcx);
                if (reg == 'd') StackPush (&(spu->stk), spu->rdx);
            }
            else return ERROR_INCORRECT_VALUE;

            }

            break;
        case SPU_POP:
            {

            int reg = 0;
            int check = 0;

            sscanf (&(str[1]), "r%[abcd]x%n", &reg, &check);

            if (check == 3)
            {
                if (reg == 'a') StackPop (&(spu->stk), &(spu->rax));
                if (reg == 'b') StackPop (&(spu->stk), &(spu->rbx));
                if (reg == 'c') StackPop (&(spu->stk), &(spu->rcx));
                if (reg == 'd') StackPop (&(spu->stk), &(spu->rdx));
            }
            else return ERROR_INCORRECT_VALUE;

            }

            break;
        case SPU_ADD:
            StackPop  (&(spu->stk), &var2);
            StackPop  (&(spu->stk), &var1);
            StackPush (&(spu->stk), var1 + var2);
            break;
        case SPU_SUB:
            StackPop  (&(spu->stk), &var2);
            StackPop  (&(spu->stk), &var1);
            StackPush (&(spu->stk), var1 - var2);
            break;
        case SPU_MUL:
            StackPop  (&(spu->stk), &var2);
            StackPop  (&(spu->stk), &var1);
            StackPush (&(spu->stk), var1 * var2);
            break;
        case SPU_DIV:
            StackPop  (&(spu->stk), &var2);
            StackPop  (&(spu->stk), &var1);
            StackPush (&(spu->stk), var1 / var2);
            break;
        case SPU_SQRT:
            StackPop  (&(spu->stk), &var1);
            StackPush (&(spu->stk), sqrt(var1));
            break;
        case SPU_SIN:
            StackPop  (&(spu->stk), &var1);
            StackPush (&(spu->stk), sin(var1));
            break;
        case SPU_COS:
            StackPop  (&(spu->stk), &var1);
            StackPush (&(spu->stk), cos(var1));
            break;
        case SPU_IN:
            printf ("\nPlease, enter var: ");
            scanf ("%d", &var1);
            StackPush (&(spu->stk), var1);
            break;
        case SPU_OUT:
            StackPop  (&(spu->stk), &var1);
            printf ("OUT = %d\n", var1);
            break;
        case SPU_HTL:
            SpuStructDtor (spu);
            return 0;
        default:
            printf ("VCE XYN");
            return ERROR_INCORRECT_FUNC;
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
