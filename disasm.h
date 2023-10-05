#ifndef STL_disasm_
#define STL_disasm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_file_open.h"

/**
 * Функция декодирования файла из байтового кода в формат asm
 */
int ByteToASM (const char* byteFile, const char* asmFileNew);

#endif /* STL_disasm_ */
