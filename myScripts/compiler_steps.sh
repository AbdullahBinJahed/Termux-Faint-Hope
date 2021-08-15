program_name=`ls | egrep '\.c$|\.cpp$'`

if [[ $program_name == *.c ]]
  then
    name=`basename $program_name .c`
    # First we have to run the preprocessor to the source file
    clang $program_name -E > $name.i
    
    # Next step is turning the preprocessed file into assembly
    clang $name.i -S
    
    # Now comes the compilation step ... it's gonna turn the assembly file into machine instructions
    as $name.s -o $name.o
    
    # Finally comes linking the object file with neccessary system libraries
    ld -dynamic-linker /system/bin/linker -o a.out /data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../../../lib/crtbegin_dynamic.o -L/data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0 -L/data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../../../lib -L/data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../.. -L/data/data/com.termux/files/usr/lib -L/system/lib $(pwd)/$name.o -lgcc -ldl -lc -lgcc -ldl /data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../../../lib/crtend_android.o -pie -o $name
    
  else
  if [[ $program_name == *.cpp ]]
  then
    name=`basename $program_name .cpp`
    # First we have to run the preprocessor to the source file
        clang++ $program_name -E > $name.i
        
        # Next step is turning the preprocessed file into assembly
        clang++ -x c++ $name.i -S
        
        # Now comes the compilation step ... it's gonna turn the assembly file into machine instructions
        as $name.s -o $name.o
        
        # Finally comes linking the object file with neccessary system libraries
        ld -dynamic-linker /system/bin/linker -o a.out /data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../../../lib/crtbegin_dynamic.o -L/data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0 -L/data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../../../lib -L/data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../.. -L/data/data/com.termux/files/usr/lib -L/system/lib $(pwd)/$name.o -lc++_shared -lgcc -ldl -lm -lc -lgcc -ldl /data/data/com.termux/files/usr/lib/gcc/arm-linux-androideabi/11.1.0/../../../../lib/crtend_android.o -pie -o $name
  else
    echo "No C or Cpp Program found"
  fi
fi
