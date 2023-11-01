compile: main_compile.o STL_compile.o include/STL_spu_struct_const.o include/STL_labels.o include/STL_header.o include/STL_file_open.o
	g++  main_compile.o STL_compile.o include/STL_spu_struct_const.o include/STL_labels.o include/STL_header.o include/STL_file_open.o -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wundef -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Weffc++ -Wmain -Wextra -Wall -g -pipe -fexceptions -Wcast-qual -Wconversion -Wctor-dtor-privacy -Wempty-body -Wformat-security -Wformat=2 -Wignored-qualifiers -Wlogical-op -Wno-missing-field-initializers -Wnon-virtual-dtor -Woverloaded-virtual -Wpointer-arith -Wsign-promo -Wstack-usage=8192 -Wstrict-aliasing -Wstrict-null-sentinel -Wtype-limits -Wwrite-strings -Werror=vla -D_DEBUG -D_EJUDGE_CLIENT_SIDE

disasm:  main_disasm.o disasm.o include/STL_spu_struct_const.o include/STL_header.o include/STL_file_open.o
	g++ main_disasm.o disasm.o include/STL_spu_struct_const.o include/STL_header.o include/STL_file_open.o -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wundef -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Weffc++ -Wmain -Wextra -Wall -g -pipe -fexceptions -Wcast-qual -Wconversion -Wctor-dtor-privacy -Wempty-body -Wformat-security -Wformat=2 -Wignored-qualifiers -Wlogical-op -Wno-missing-field-initializers -Wnon-virtual-dtor -Woverloaded-virtual -Wpointer-arith -Wsign-promo -Wstack-usage=8192 -Wstrict-aliasing -Wstrict-null-sentinel -Wtype-limits -Wwrite-strings -Werror=vla -D_DEBUG -D_EJUDGE_CLIENT_SIDE



main_compile.o: main_compile.cpp     STL_compile.o
	g++ 	 -c main_compile.cpp  -o main_compile.o

STL_compile.o:  STL_compile.cpp  include/STL_compile.h include/STL_spu_struct_const.o include/STL_labels.o include/STL_spu_const.h include/STL_header.o include/STL_file_open.o
	g++ 	 -c STL_compile.cpp       -o STL_compile.o



main_disasm.o:  main_disasm.cpp     disasm.o
	g++ 	 -c main_disasm.cpp  -o main_disasm.o

disasm.o:       disasm.cpp  include/disasm.h include/STL_spu_struct_const.o include/STL_spu_const.h include/STL_header.o include/STL_file_open.o
	g++ 	 -c disasm.cpp       -o disasm.o


include/STL_spu_struct_const.o: include/STL_spu_struct_const.cpp    include/STL_spu_struct_const.h
	g++                      -c include/STL_spu_struct_const.cpp -o include/STL_spu_struct_const.o

include/STL_labels.o:       STL_labels.cpp         include/STL_labels.h
	g++                  -c STL_labels.cpp      -o include/STL_labels.o

include/STL_header.o:       include/STL_header.cpp         include/STL_header.h
	g++                  -c include/STL_header.cpp      -o include/STL_header.o

include/STL_file_open.o:    include/STL_file_open.cpp      include/STL_file_open.h  include/STL_string.h
	g++ 	             -c include/STL_file_open.cpp   -o include/STL_file_open.o


clean:
	rm -rf main_compile.o STL_compile.o main_disasm.o disasm.o include/STL_spu_struct_const.o include/STL_labels.o include/STL_header.o include/STL_file_open.o

