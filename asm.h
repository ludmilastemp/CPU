#ifndef STL_asm_
#define STL_asm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_function.h"
#include "STL_file_open.h"

/**
 * ������� ����������� ����� �� ������� asm � �������� ���
 */
int ASMToBin (const char* asmFile, const char* byteFile);

#endif /* STL_asm_ */
