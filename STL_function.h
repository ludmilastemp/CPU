#ifndef STL_function_
#define STL_function_

const int nFunc = 12;
const int nFuncWithArguments = 2;
const int INITIAL_VALUE_OF_FUNCTIONS = 30; /// любое значение >13

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
    "OUT",
    "HLT"
};

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

enum SPU_ERROR
{
    ERROR_INCORRECT_FUNC  = 1 << 0,
    ERROR_INCORRECT_VALUE = 1 << 1,
    ERROR_NOT_MY_FILE     = 1 << 2
};

#endif /* STL_function_ */
