#ifndef STL_function_
#define STL_function_

const int nFunc = 12;

const int OPERATION_NAME_MAX_LENGTH = 20;
const int FILE_MAX_SIZE_IN_BYTES = 1000;
const int SIGNATURE_LENGTH = 6;

#define DEF_CMD(name,opCode, ...)   \
    CMD_##name = opCode,

enum OpCode
{
    #include "STL_commands.h"
};
#undef DEF_CMD

enum SPU_Error
{
    ERROR_INCORRECT_FUNC        = 1 << 0,
    ERROR_INCORRECT_VALUE       = 1 << 1,
    ERROR_FILE_FORMAT           = 1 << 2,
    ERROR_COMMAND_NAME_TOO_LONG = 1 << 3
};

enum ArgType
{
    T_ARG_INT = 0x40,
    T_ARG_REG = 0x80
};

enum RegisterName
{
    REG_RAX,
    REG_RBX,
    REG_RCX,
    REG_RDX,
};

#endif /* STL_function_ */
