#ifndef STL_disasm_
#define STL_disasm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_spu_struct_const.h"
#include "STL_spu_const.h"
#include "STL_header.h"
#include "STL_file_open.h"

/**
 * Функция декодирования файла из байтового кода в формат asm
 */
int Disasm (const char* byteFile, const char* asmFileNew);

#endif /* STL_disasm_ */
