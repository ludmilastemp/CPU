#ifndef STL_asm_
#define STL_asm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_file_open.h"

/**
 * Функция кодирования файла из формата asm в байтовый код
 */
int ASMToByte (const char* asmFile, const char* byteFile);

#endif /* STL_asm_ */
