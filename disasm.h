#ifndef STL_disasm_
#define STL_disasm_

#include <stdio.h>
#include <stdarg.h>

#include "STL_function.h"
#include "STL_file_open.h"

/**
 * ������� ������������� ����� �� ��������� ���� � ������ asm
 */
int BinToASM (const char* byteFile, const char* asmFileNew);

#endif /* STL_disasm_ */
