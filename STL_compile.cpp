#include "include/STL_compile.h"

#include <string.h>

static char* str = 0;
static int  ip = 0;

Labels labels = {};
Fixups fixups = {};

static int CompileFile (File* file);

static int CompileOperation (const char* string);

static int ParseArg (const char* string, unsigned char opCode);

static int WriteInBinFile (const char* const binFile);

int Compile (const char* const asmFile, const char* const binFile)
{
    assert (asmFile);
    assert (binFile);

    struct File file = { };
    STL_SplitFileIntoLines (&file, asmFile);
    1;
    str = (char*) calloc (file.size, sizeof (char));
    assert (str);
                // const
    WriteSignature (7, str, &ip)                                    && ({ return ERROR_EXIT; 1; });

    CompileFile (&file)                                             && ({ return ERROR_EXIT; 1; });

    WriteInBinFile (binFile)                                        && ({ return ERROR_EXIT; 1; });

    STL_Fclose (&file)                                              && ({ return ERROR_EXIT; 1; });

    return 0;
}

static int CompileFile (File* file)
{
    assert (file);

    LabelsStructCtor (&labels)                                      && ({ return ERROR_EXIT; 1; });
    FixupsStructCtor (&fixups)                                      && ({ return ERROR_EXIT; 1; });

    int line = 0;
    int error = 0;

    while (line < file->nLines)
    {
        while ((file->strings[line]).len == 1) line++;

        error = CompileOperation ((file->strings[line++]).str);

        if (error)
        {
            printf ("line = %d\n", line);
            STL_SpuErrPrint (error);
            return ERROR_EXIT;
        }
    }
                                                            //      "очень опасный дефайн, никогда не используй @d3phys"
    DoFixups (str, &labels, &fixups)                                && ({ return ERROR_EXIT; 1; });
               // Dump
    LabelsStructPrint (&labels);
    FixupsStructPrint (&fixups, &labels);

    LabelsStructDtor (&labels)                                      && ({ return ERROR_EXIT; 1; });
    FixupsStructDtor (&fixups)                                      && ({ return ERROR_EXIT; 1; });

    return 0;
}

#define DEF_CMD(name, opCode, arg, ...)                                 \
    if (strnicmp (string, #name, strlen(#name)) == 0)                   \
    {                                                                   \
        if (arg)                                                        \
        {                                                               \
            ParseArg (string + strlen(#name) + 1, opCode);              \
        }                                                               \
        else                                                            \
        {                                                               \
            str[ip++] = opCode;                                         \
        }                                                               \
                                                                        \
    } else

#define MAKE_COND_JMP(name, opCode, ...)                                \
    if (strnicmp (string, #name, strlen(#name)) == 0)                   \
    {                                                                   \
        ParseArg (string + strlen(#name) + 1, opCode);                  \
                                                                        \
    } else

static int CompileOperation (const char* string)
{
    assert (string);

    while (string[0] == ' ') string++;      /// пропуск \t

    if    (string[0] == 0)   return 0;      // их уже не должно быть

    if    (string[0] == ':')
    {
        SetLabel (string + 1, ip, &labels, &fixups);
    }
    else /* if */

    #include "include/STL_commands.h"

    #include "include/STL_jmp.h"

    /* else */
    {
        return ERROR_INCORRECT_FUNC;
    }

    return 0;
}
#undef DEF_CMD

#undef MAKE_COND_JMP

#define DEF_REG(name, opCode)                                           \
    if (strnicmp (string, #name, strlen(#name)) == 0)               \
    {                                                                   \
        arg = opCode;                                                   \
        string += strlen(#name);                                        \
    }                     else



// push [rax + 10]
// Opcode_t opcode = switch () 0x23
// mem rax 10
//
static int ParseArg (const char* string, unsigned char opCode) // typedef opcode_t
{
    assert (string);

    SPU_DATA_TYPE arg = 0;

    if (string[0] == ':')
    {
        str[ip++] = opCode | T_ARG_CONST;

        SetLabelArg (string + 1, str, &ip, &labels, &fixups);

        return 0;
    }

    if (string[0] == '[')
    {
        opCode |= T_ARG_RAM;
        string++;
    }

    float var = 0;
    if (sscanf (string, "%f", &var))
    {
        arg = (SPU_DATA_TYPE)(var * floatPrecision);

        opCode |= T_ARG_CONST;

// strtod / atoi / atod / stod
        while ((string[0] >= '0' && string[0] <= '9') ||
                string[0] == ' ' || string[0] == '.')
        {
            string++;
        }

//        strtof (string, &string);
//        stod (string);
//
//        while (string[0] == ' ')
//        {
//            string++;
//        }

        if (string[0] == '\r' || string[0] == '\n')
        {
            str[ip++] = opCode;
            *(SPU_DATA_TYPE*)(str + ip) = arg;

            ip += sizeof (SPU_DATA_TYPE);

            return 0;
        }
    }

    if (opCode & T_ARG_RAM)
    {
        while (string[0] == ' ') string++;
        if (string[0] == ']')
        {
            str[ip++] = opCode;

            if (opCode & T_ARG_CONST) // IMM = immediate
            {
                *(SPU_DATA_TYPE*)(str + ip) = arg;
                ip += sizeof (SPU_DATA_TYPE);
            }

            return 0;
        }
    }

    str[ip++] = opCode | T_ARG_REG;

    if (opCode & T_ARG_CONST)
    {
        *(SPU_DATA_TYPE*)(str + ip) = arg; // emit
        ip += sizeof (SPU_DATA_TYPE);
    }

// emit_imm()
// emit_reg()
// emit_opcode()
// emit_byte()

    #include "include/STL_registers.h"

    /* else */ return ERROR_INCORRECT_VALUE;


    str[ip++] = (char)arg;

    if (opCode & T_ARG_RAM)
    {
        while (string[0] == ' ') string++; // SkipWhitespaces() isspace()
        if (string[0] != ']') return ERROR_INCORRECT_VALUE;
    }

    return 0;
}

#undef DEF_REG

static int WriteInBinFile (const char* const binFile)
{
    assert (binFile);

    FILE* fp = fopen (binFile, "wb");
    assert (fp);

    fwrite (str, sizeof(char), ip, fp);

    fclose (fp);

    return 0;
}

#undef TransToSPU  // ????????????
