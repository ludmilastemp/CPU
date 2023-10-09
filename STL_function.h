#ifndef STL_function_
#define STL_function_

const int nFunc = 12;
const int nFuncWithArguments = 2; // fncs
const int INITIAL_VALUE_OF_FUNCTIONS = 33; /// ����� �������� >13


// fread - ������� � ������
// wsl

// opcode names
const char* const funcText[nFunc] =
{
    "push",
    "pop",
    "add",
    "sub",
    "mul",
    "div",
    "sqrt",
    "sin",
    "cos",
    "in",
    "OUT", // why?
    "HLT"
};

//

// operation code
// opcode
enum Func
{
    SPU_PUSH = INITIAL_VALUE_OF_FUNCTIONS,
    SPU_POP,
    SPU_ADD,
    SPU_SUB,
    SPU_MUL,
    SPU_DIV,
    SPU_SQRT,
    SPU_SIN,
    SPU_COS,
    SPU_IN,
    SPU_OUT,
    SPU_HTL
};

// header
enum SPU_ERROR
{
    ERROR_INCORRECT_FUNC  = 1 << 0,
    ERROR_INCORRECT_VALUE = 1 << 1,
    ERROR_NOT_MY_FILE     = 1 << 2 // FILE_FORMAT_ERROR
};

const int funcArg[nFunc] =
{
    1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0,
    0,
    0,
    1,
    -1,
    0
};

#endif /* STL_function_ */
