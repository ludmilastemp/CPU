compile: asm/main.o asm/STL_compile.o include/STL_spu_struct_const.o asm/STL_label.o lib/STL_header.o lib/STL_file_open.o asm/stack_label_func.o asm/stack_label_error.o asm/stack_fixup_func.o asm/stack_fixup_error.o
	g++  asm/main.o asm/STL_compile.o include/STL_spu_struct_const.o asm/STL_label.o lib/STL_header.o lib/STL_file_open.o asm/stack_label_func.o asm/stack_label_error.o asm/stack_fixup_func.o asm/stack_fixup_error.o -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wundef -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Weffc++ -Wmain -Wextra -Wall -g -pipe -fexceptions -Wcast-qual -Wconversion -Wctor-dtor-privacy -Wempty-body -Wformat-security -Wformat=2 -Wignored-qualifiers -Wlogical-op -Wno-missing-field-initializers -Wnon-virtual-dtor -Woverloaded-virtual -Wpointer-arith -Wsign-promo -Wstack-usage=8192 -Wstrict-aliasing -Wstrict-null-sentinel -Wtype-limits -Wwrite-strings -Werror=vla -D_DEBUG -D_EJUDGE_CLIENT_SIDE

disasm: disasm/main.o disasm/disasm.o include/STL_spu_struct_const.o lib/STL_header.o lib/STL_file_open.o
	g++ disasm/main.o disasm/disasm.o include/STL_spu_struct_const.o lib/STL_header.o lib/STL_file_open.o -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wundef -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Weffc++ -Wmain -Wextra -Wall -g -pipe -fexceptions -Wcast-qual -Wconversion -Wctor-dtor-privacy -Wempty-body -Wformat-security -Wformat=2 -Wignored-qualifiers -Wlogical-op -Wno-missing-field-initializers -Wnon-virtual-dtor -Woverloaded-virtual -Wpointer-arith -Wsign-promo -Wstack-usage=8192 -Wstrict-aliasing -Wstrict-null-sentinel -Wtype-limits -Wwrite-strings -Werror=vla -D_DEBUG -D_EJUDGE_CLIENT_SIDE


asm/main.o: asm/main.cpp     asm/STL_compile.o
	g++  -c asm/main.cpp  -o asm/main.o

asm/STL_compile.o:  asm/STL_compile.cpp    asm/STL_compile.h include/STL_spu_struct_const.o asm/STL_label.o include/STL_spu_const.h lib/STL_header.o lib/STL_file_open.o
	g++ 	     -c asm/STL_compile.cpp -o asm/STL_compile.o

asm/STL_label.o: asm/STL_label.cpp    asm/STL_label.h    asm/STL_label_struct.h
	g++       -c asm/STL_label.cpp -o asm/STL_label.o


disasm/main.o: disasm/main.cpp    disasm/disasm.o
	g++ 	-c disasm/main.cpp -o disasm/main.o

disasm/disasm.o: disasm/disasm.cpp    disasm/disasm.h include/STL_spu_struct_const.o include/STL_spu_const.h lib/STL_header.o lib/STL_file_open.o
	g++ 	  -c disasm/disasm.cpp -o disasm/disasm.o


include/STL_spu_struct_const.o: include/STL_spu_struct_const.cpp    include/STL_spu_struct_const.h
	g++                      -c include/STL_spu_struct_const.cpp -o include/STL_spu_struct_const.o


lib/STL_header.o:    lib/STL_header.cpp       lib/STL_header.h
	g++           -c lib/STL_header.cpp    -o lib/STL_header.o

lib/STL_file_open.o: lib/STL_file_open.cpp    lib/STL_file_open.h    lib/STL_string.h
	g++ 	      -c lib/STL_file_open.cpp -o lib/STL_file_open.o


clean:
	rm -rf asm/main.o asm/STL_compile.o disasm/main.o disasm/disasm.o include/STL_spu_struct_const.o asm/STL_label.o lib/STL_header.o lib/STL_file_open.o

