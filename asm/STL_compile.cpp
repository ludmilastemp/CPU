#include "STL_compile.h"

static const int STL_Header_version = 7;

static int CompileFile (File* file,
                        NewString* strByte);

static int CompileOperation (const char* string,
                             NewString* strByte,
                             Stack_Label* labels,
                             Stack_Fixup* fixups);

static int ParseArgs (const char* string,
                      unsigned char opCode,
                      NewString* strByte,
                      Stack_Label* labels,
                      Stack_Fixup* fixups);

static int CheckArgIsLabel (const char* string,
                            bool* checkLabel);

static int CheckArgIsRam   (const char** string);

static int CheckArgIsImm   (const char** string,
                            int* arg);

static int CheckArgIsReg   (const char* string,
                            int* reg);

static int EmitOpcode (const OPCODE_T opCode,
                       NewString* strByte);

static int EmitImm    (const SPU_DATA_TYPE arg,
                       NewString* strByte);

static int EmitReg    (const int reg,
                       NewString* strByte);

static int SkipWhitespaces (const char* string);

static int WriteInBinFile  (const char* const binFile,
                            NewString* strByte);

static int MyStrtod        (const char* string);

int Compile (const char* const asmFile,
             const char* const binFile)
{
    assert (asmFile);
    assert (binFile);

    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);

    NewString strByte = {0, 0};

    strByte.str = (char*) calloc (file.size, sizeof (char));
    assert (strByte.str);

    strByte.ip = 0;

    WriteSignature (STL_Header_version, strByte.str, &strByte.ip)                                    && ({ return ERROR_EXIT; 1; });

    CompileFile (&file, &strByte)                                             && ({ return ERROR_EXIT; 1; });

    WriteInBinFile (binFile, &strByte)                                        && ({ return ERROR_EXIT; 1; });

    free (strByte.str);

    STL_Fclose (&file)                                              && ({ return ERROR_EXIT; 1; });

    return 0;
}

static int CompileFile (File* file,
                        NewString* strByte)
{
    assert (file);
    assert (strByte);

    Stack_Label labels = {};
    Stack_Fixup fixups = {};

    StackCtor (&labels);
    StackCtor (&fixups);

    int line = 0;
    int error = 0;

    while (line < file->nLines)
    {
        while ((file->strings[line]).len == 1) line++;

        error = CompileOperation ((file->strings[line++]).str,
                                   strByte, &labels, &fixups);

        if (error)
        {
            printf ("line = %d\n", line);
            STL_SpuErrPrint (error);
            return ERROR_EXIT;
        }
    }
                                                                            //  "����� ������� ������, ������� �� ��������� @d3phys"
    DoFixups (strByte->str, &labels, &fixups)                                    && ({ return ERROR_EXIT; 1; });

    LabelsDump (&labels);
    FixupsDump (&fixups);

    StackDtor (&labels);
    StackDtor (&fixups);

    return 0;
}

#define DEF_CMD(name, opCode, arg, ...)                                 \
    if (strnicmp (string, #name, strlen(#name)) == 0)                   \
    {                                                                   \
        if (arg)                                                        \
        {                                                               \
            ParseArgs (string + strlen(#name) + 1, opCode,              \
                       strByte, labels, fixups);                        \
        }                                                               \
        else                                                            \
        {                                                               \
            EmitOpcode (opCode, strByte);                               \
        }                                                               \
                                                                        \
    } else

#define MAKE_COND_JMP(name, opCode, ...)                                \
    if (strnicmp (string, #name, strlen(#name)) == 0)                   \
    {                                                                   \
        ParseArgs (string + strlen(#name) + 1, opCode,                  \
                   strByte, labels, fixups);                            \
                                                                        \
    } else

static int CompileOperation (const char* string,
                             NewString* strByte,
                             Stack_Label* labels,
                             Stack_Fixup* fixups)
{
    assert (string);
    assert (strByte);
    assert (labels);
    assert (fixups);

    string += SkipWhitespaces (string);
    if    (string[0] == 0)   return 0;

    if    (string[0] == ':')
    {
        SetLabel (string + 1, strByte->ip, labels);
    }
    else /* if */

    #include "../include/STL_commands.h"

    #include "../include/STL_jmp.h"

    /* else */
    {
        return ERROR_INCORRECT_FUNC;
    }

    return 0;
}
#undef DEF_CMD

#undef MAKE_COND_JMP

static int ParseArgs (const char* string,
                      OPCODE_T opCode,
                      NewString* strByte,
                      Stack_Label* labels,
                      Stack_Fixup* fixups)
{
    assert (string);
    assert (opCode);
    assert (strByte);
    assert (labels);
    assert (fixups);

    SPU_DATA_TYPE arg = 0;
    int  reg   = 0;
    bool checkLabel = 0;

    opCode |= CheckArgIsLabel (string, &checkLabel);
    opCode |= CheckArgIsRam (&string);
    opCode |= CheckArgIsImm (&string, &arg);
    opCode |= CheckArgIsReg (string, &reg);

    EmitOpcode (opCode, strByte);

    if (checkLabel)
    {
        SetLabelArg (string + 1, strByte->str, &strByte->ip, labels, fixups);
        return 0;
    }
    if (opCode & T_ARG_IMM)
    {
        EmitImm (arg, strByte);
    }
    if (opCode & T_ARG_REG)
    {
        EmitReg (reg, strByte);
    }
    if (opCode & (T_ARG_IMM || T_ARG_REG) == 0)
    {
        return ERROR_INCORRECT_VALUE;
    }

    return 0;
}

static int CheckArgIsLabel (const char* string,
                            bool* checkLabel)
{
    assert (string);
    assert (checkLabel);

    if (string[0] == ':')
    {
        *checkLabel = true;
        return T_ARG_IMM;
    }

    return 0;
}

static int CheckArgIsRam (const char** string)
{
    assert (string);
    assert (*string);

    if (*string[0] == '[')
    {
        (*string)++;
        return T_ARG_RAM;
    }

    return 0;
}

static int CheckArgIsImm (const char** string,
                          int* arg)
{
    assert (string);
    assert (*string);
    assert (arg);

    float var = 0;
    if (sscanf (*string, "%f", &var))
    {
        *arg = (SPU_DATA_TYPE)(var * floatPrecision);

        *string += MyStrtod (*string);

        return T_ARG_IMM;

    }

    return 0;
}

#define DEF_REG(name, regCode)                                          \
    else if (strnicmp (string, #name, strlen(#name)) == 0)              \
    {                                                                   \
        *reg = regCode;                                                 \
        string += strlen(#name);                                        \
        return T_ARG_REG;                                               \
    }

static int CheckArgIsReg (const char* string,
                          int* reg)
{
    assert (string);
    assert (reg);

    if (false) { ; }
    #include "../include/STL_registers.h"

    return 0;
}

#undef DEF_REG

static int EmitOpcode (const OPCODE_T opCode,
                       NewString* strByte)
{
    assert (strByte);

    strByte->str[strByte->ip++] = opCode;
    return 0;
}

static int EmitImm (const SPU_DATA_TYPE arg,
                    NewString* strByte)
{
    assert (strByte);

    *(SPU_DATA_TYPE*)(strByte->str + strByte->ip) = arg;
    strByte->ip += sizeof (SPU_DATA_TYPE);
    return 0;
}

static int EmitReg (const int reg,
                    NewString* strByte)
{
    assert (strByte);

    strByte->str[strByte->ip++] = (char)reg;
    return 0;
}

static int SkipWhitespaces (const char* string)
{
    assert (string);

    int i = 0;
    while (string[i] == ' ') i++;
    return i;
}

static int WriteInBinFile (const char* const binFile,
                           NewString* strByte)
{
    assert (binFile);
    assert (strByte);

    FILE* fp = fopen (binFile, "wb");
    assert (fp);

    fwrite (strByte->str, sizeof(char), strByte->ip, fp);

    fclose (fp);

    return 0;
}

static int MyStrtod (const char* string)
{
    assert (string);

    int i = 0;

    // strtod / atoi / atod / stod

    while ((string[i] >= '0' && string[i] <= '9') ||
            string[i] == ' ' || string[i] == '.')
    {
        i++;
    }

    //        strtof (string, &string);
    //        stod (string);
    //
    //        while (string[0] == ' ')
    //        {
    //            string++;
    //        }

    return i;
}
