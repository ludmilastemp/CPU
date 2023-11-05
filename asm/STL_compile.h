#ifndef STL_compile_
#define STL_compile_

#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#include "../include/STL_spu_struct_const.h"
#include "../include/STL_spu_const.h"
#include "../lib/STL_file_open.h"
#include "../lib/STL_header.h"
#include "STL_label.h"

/**
 * Функция кодирования файла из формата asm в байтовый код
 */
int Compile (const char* const asmFile, const char* const byteFile);

#endif /* STL_compile_ */
