#ifndef STL_disasm_
#define STL_disasm_

#include <stdio.h>
#include <stdarg.h>

#include "../include/STL_spu_struct_const.h"
#include "../include/STL_spu_const.h"
#include "../lib/STL_header.h"
#include "../lib/STL_file_open.h"

/**
 * ������� ������������� ����� �� ��������� ���� � ������ asm
 */
int Disasm (const char* byteFile, const char* asmFileNew);

#endif /* STL_disasm_ */
