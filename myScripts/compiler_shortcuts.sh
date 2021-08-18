TIMEFORMAT='Compile Time: %3R seconds'
compile_mode="single_file"
compiler=gcc
action="Compile"

NONE='\033[00m'
GREEN='\033[01;32m'
RED='\033[01;31m'
CYAN='\033[01;36m'
BOLD='\033[1m'

main()
{
  if ( ls *.c 1>/dev/null 2>&1 ) || ( ls *.cpp 1>/dev/null 2>&1 ); then
    ArgCheck "$@"
    if [ $compile_mode == "all_files" ]; then
      list_of_programs=$(ls *.{c,cpp} 2>/dev/null)
      for program_name in $list_of_programs; do
        FileCheck
        $action
      done
    else
      program_name=`ls | egrep '\.c$|\.cpp$'`
      FileCheck
      $action
      if [ -f $program ]; then ./$program; fi
    fi
  else
    echo "File doesn't exist"
    return 1
  fi
}

Compile()
{
  echo -e "${GREEN}Compiling $program_name...${NONE}"
  time $compiler $program_name -o $program
}

Preprocess()
{
  echo -e "${GREEN}Preprocessing $program_name...${NONE}"
  $compiler $program_name -E > $program.i
}

Compilation()
{
  echo -e "${GREEN}Running compilation process for $program_name...${NONE}"
  $compiler $program_name -S
}

Assemble()
{
  Compilation
  echo -e "${GREEN}Creating assembly of $program_name...${NONE}"
  as $program.s -o $program.o
  rm $program.s
}

Link()
{
  if [ ! -e $program.o ]; then Assemble; fi
  echo -e "${GREEN}Linking and saving the linker args into ${program}_linker_args.txt${NONE}"
  $compiler -v $program_name > report.txt 2>&1
  rm a.out 2>/dev/null
  path=$(pwd)/$program.o
  grep -oP '(?<=^ \"/data/data/com.termux/files/usr/bin/ld\" ).*' report.txt > templdargs.txt
  rm report.txt
  sed 's|[a-zA-Z0-9\/\.]*tmp[.a-zA-Z0-9\/\-]*|'"$path"'|g' templdargs.txt > ${program}_linker_args.txt
  rm templdargs.txt
  ld @${program}_linker_args.txt -o $program
  rm $program.o 2>/dev/null
}

Binary()
{
  if [ ! -e $program.o ]; then Assemble; fi
  echo -e "${GREEN}Creating binary of $program_name...${NONE}"
  objcopy $program.o -O binary $program.bin
  rm $program.o
  xxd -b $program.bin > ${program}_binary_instruction.txt
  rm $program.bin
}

ArgCheck()
{
  if [ -z "$1" ]; then action="Compile"
  else
    for arg in $@; do
      case $arg in
        -a )
          compile_mode="all_files"
          ;;
        -bin )
          action="Binary"
          ;;
        -c )
          compiler=clang
          ;;
        -p )
          action="Preprocess"
          ;;
        -cmp )
          action="Compilation"
          ;;
        -asm )
          action="Assemble"
          ;;
        -l )
          action="Link"
          ;;
        --help )
          Help
          kill -INT $$
          ;;
        * )
          echo
          echo -e "${BOLD}${RED}Invalid Argument${NONE}"
          kill -INT $$
          ;;
        esac
    done
  fi
}

FileCheck()
{
  if [ $program_name == *.c ]; then
    program=`basename $program_name .c`
    if [ $compiler == g++ ]; then compiler=gcc; fi
    if [ $compiler == clang++ ]; then compiler=clang; fi
  fi
  
  if [ $program_name == *.cpp ]; then
    program=`basename $program_name .cpp`
    if [ $compiler == gcc ]; then compiler=g++; fi
    if [ $compiler == clang ]; then compiler=clang++; fi
  fi
}

Help()
{
  echo "Usage: c [ARGS]"
  echo -e "${CYAN}Shortcuts for some compiler processes${NONE}"
  echo
  echo "Arguments:"
  echo "  -a                         select all .c or .cpp files"
  echo "  -asm                       turns programs into assembly and saves them in *.s file"
  echo "  -bin                       creates the binary instructions and saves them in a file"
  echo "  -c                         use the Clang Compiler"
  echo "  -cmp                       creates object file or machine code of the programs"
  echo "  --help                     prints this message"
  echo "  -l                         links the object file with linker and saves what arguments                               passed to linker into a *.txt file"
  echo "  -p                         only Preprocess programs and saves them in *.i file"
}

main "$@";
