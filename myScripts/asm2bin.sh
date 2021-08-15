assembly_file=`ls | egrep \.s$`
name=`basename $assembly_file .s`
as $assembly_file -o $name.o
objcopy $name.o -O binary $name.bin
xxd -b $name.bin>binary_instruction.txt
