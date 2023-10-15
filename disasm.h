#ifndef STL_disasm_
#define STL_disasm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_function.h"
#include "STL_spu_struct.h"

/**
 * Функция декодирования файла из байтового кода в формат asm
 */
int DisAsm (const char* byteFile, const char* asmFileNew);

#endif /* STL_disasm_ */
