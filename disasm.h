#ifndef STL_disasm_
#define STL_disasm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_const.h"
#include "STL_header.h"
#include "STL_spu_struct.h"
#include "STL_file_open.h"

/**
 * ������� ������������� ����� �� ��������� ���� � ������ asm
 */
int Disasm (const char* byteFile, const char* asmFileNew);

#endif /* STL_disasm_ */
