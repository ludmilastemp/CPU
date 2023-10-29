#ifndef STL_asm_
#define STL_asm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_spu_struct_const.h"
#include "STL_spu_const.h"
#include "STL_header.h"
#include "STL_file_open.h"

/**
 * ������� ����������� ����� �� ������� asm � �������� ���
 */
int Compile (const char* const asmFile, const char* const byteFile);

#endif /* STL_asm_ */
