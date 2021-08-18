#!/bin/sh
TIMEFORMAT='Compile Time: %3R seconds'
compile_mode="single_file"
compiler=gcc
action="Compile"
run="false"

NONE='\033[00m'
#GREEN='\033[01;32m'
GREEN='\033[00;32m'
RED='\033[01;31m'
CYAN='\033[01;36m'
BOLD='\033[1m'

main()
{
    ArgCheck "$@"
  if ( ls *.c 1>/dev/null 2>&1 ) || ( ls *.cpp 1>/dev/null 2>&1 ); then
    if [ "$compile_mode" == "all_files" ]; then
      list_of_programs=$(ls *.{c,cpp} 2>/dev/null)
      for program_name in $list_of_programs; do
        FileCheck
        $action
      done
    else
      program_name=$(ls | grep -E '\.c$|\.cpp$')
      FileCheck
      $action
      if [ "$run" == "true" ]; then ./$program; fi
    fi
  else
    echo "No C or C++ program found"
    return 1
  fi
}

Compile()
{
  echo -e "${GREEN}Compiling ${BOLD}$program_name${GREEN}...${NONE}"
  time $compiler $program_name -o $program
}

Preprocessor()
{
  echo -e "${GREEN}Preprocessing ${BOLD}$program_name${GREEN}...${NONE}"
  $compiler $program_name -E > $program.i
}

Compiler()
{
  echo -e "${GREEN}Running compilation process for ${BOLD}$program_name${GREEN}...${NONE}"
  $compiler $program_name -S
}

Assembler()
{
  Compiler
  echo -e "${GREEN}Creating assembly of ${BOLD}$program_name${GREEN}...${NONE}"
  as $program.s -o $program.o
  rm $program.s
}

Linker()
{
  if [ ! -e $program.o ]; then Assembler; fi
  echo -e "${GREEN}Linking and saving the linker args into ${BOLD}${program}_linker_args.txt${NONE}"
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
  if [ -e $program.o ]; then
    echo -e "${GREEN}Creating binary of ${BOLD}$program.o${GREEN}...${NONE}"
    objcopy $program.o -O binary $program.bin
    xxd -b $program.bin > ${program}_binary_instruction.txt
    rm $program.bin
  fi
  if [ ! -e $program.o ]; then
    Compile
    echo -e "${GREEN}Creating binary of ${BOLD}$program_name${GREEN}...${NONE}"
    objcopy $program -O binary $program.bin
    xxd -b $program.bin > ${program}_binary_instruction.txt
    rm $program.bin
  fi
}

ArgCheck()
{
  if [ -z "$1" ]; then
    action="Compile"
    run="true"
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
          action="Preprocessor"
          ;;
        -cmp )
          action="Compiler"
          ;;
        -asm )
          action="Assembler"
          ;;
        -l )
          action="Linker"
          ;;
        --help )
          Help
          kill -INT $$
          ;;
        --update )
          wget https://raw.githubusercontent.com/AbdullahBinJahed/Termux/main/myScripts/compiler_shortcuts.sh
          rm $HOME/.lolicon/compiler_shortcuts.sh && mv compiler_shortcuts.sh $HOME/.lolicon/
          kill -INT $$
          ;;
        * )
          echo -e "${RED}Invalid Argument${NONE}"
          echo
          Help
          kill -INT $$
          ;;
        esac
    done
  fi
}

FileCheck()
{
  if [[ $program_name == *.c ]]; then
    program=`basename $program_name .c`
    if [ $compiler == g++ ]; then compiler=gcc; fi
    if [ $compiler == clang++ ]; then compiler=clang; fi
  fi
  
  if [[ $program_name == *.cpp ]]; then
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
  echo "  -asm                       Runs the assembler to create object files *.o"
  echo "  -bin                       creates the binary instructions and saves them in a file"
  echo "  -c                         use the Clang Compiler"
  echo "  -cmp                       Runs the Compiler to create assembly code *.s"
  echo "  --help                     prints this message"
  echo "  -l                         links the object file with linker and saves what arguments                               passed to linker into a *.txt file"
  echo "  -p                         only Preprocess programs and saves them in *.i file"
  echo "  --update                   updates the script"
}

main "$@";
