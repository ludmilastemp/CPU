#ifndef STL_function_
#define STL_function_

const int nFunc = 11;
const int nFuncWithArguments = 1;

const char* const funcText[nFunc] =
{
    "push",
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
    SPU_PUSH,
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

#endif /* STL_function_ */
