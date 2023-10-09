#include "asm.h"          //dct gbcfnm d cnhjre? gjnjv tt pfgbcfnm d afqk

// assembler - ����������
// assembly - ����

// compileOperation
                                                  //s
static int  TranslateToSPU (FILE* fp, String* string);
static void STL_Print      (FILE* fp, const char* const fmt, ...);

// KISS -- keep it stupid simple (keep it simple, stupid)
#define TransToSPU(fp,str)                                      \
    do                                                          \
    {                                                           \
        int errDef = TranslateToSPU ((fp), (str));              \
        if (errDef)                                             \
        {                                                       \
            STL_SpuStructErrPrint (errDef);                     \
            printf ("line = %d\n", line);                       \
            return errDef;                                      \
        }                                                       \
    } while (false)

int ASMToBin (const char* asmFile, const char* binFile)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);

    FILE* fp = fopen (binFile, "wb");

    STL_Print (fp, "STL v3\n");

    int line = 0;
    while (line < file.nLines)
    {
        TransToSPU (fp, &(file.strings[line++]));
    }

    fclose (fp);

    return 0;
}

static int TranslateToSPU (FILE* fp, String* strings)
{
    // read word             // ��������� �� �������
    // find opcode
    // read word
    // parse arg

    char str[1000] = "0";      // const

    sscanf (strings->str, "%s", str); // buffer overflow

    int func = 0;
    for (; func < nFunc; func++)
    {
        if (strcmp (str, funcText[func]) == 0) break;
    }

    if (func == nFunc) return ERROR_INCORRECT_FUNC;

    STL_Print (fp, "%c", func + INITIAL_VALUE_OF_FUNCTIONS);

    if (func < nFuncWithArguments) /// cvt[ b uht[
    {
        int var = 0;

        if (sscanf (strings->str + strlen(str), "%d", &var))
        {
            STL_Print (fp, "%d", var);
            // fread();  fwrite()
            // char* ptr;
            // *(int*)ptr = 23;
//            STL_Print (fp, "<%d> ",  var & 0xF0000000);   >><<
//            STL_Print (fp, "<%d> ",  var & 0x0F000000);
//            STL_Print (fp, "<%d> ",  var & 0x00F00000);
//            STL_Print (fp, "<%d> ",  var & 0x000F0000);
//            STL_Print (fp, "<%d> ",  var & 0x0000F000);
//            STL_Print (fp, "<%d> ",  var & 0x00000F00);
//            STL_Print (fp, "<%d> ",  var & 0x000000F0);
//            STL_Print (fp, "<%d> ",  var & 0x0000000F);
        }
        else
        {
            int reg = 0;
            int check = 0;

            sscanf (strings->str + strlen(str) + 1, "r%[abcd]x%n", &reg, &check);

            if (check == 3) STL_Print (fp, "r%cx", reg);
            else return ERROR_INCORRECT_VALUE;
        }
    }

    STL_Print (fp, "\n");

    return 0;
}

int CheckAntiOverflow (const char* binFile)
{
    struct File file = { };
    STL_SplitFileIntoLines (&file, binFile);

    int check = 0;
    int comand = 0;
    int line = 1;
    while (line < file.nLines)
    {
        comand = (file.strings[line]).str[0];
        //sscanf (str, "%c", &comand);

        check += funcArg[comand - INITIAL_VALUE_OF_FUNCTIONS];
        if (check < 0) return -1;

        line++;
    }
    if (check > 0) return 1;

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
#undef TransToSPU

