# MIT License

# Author: It is I ... ABJ
# Copyright (c) 2021 Abdullah Bin Jahed

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#!/bin/bash
TIMEFORMAT='Compile Time: %3R seconds'
compile_mode="single_file"
compiler=gcc
action="Compile"
run="false"
debug=false

NONE='\033[00m'
BGREEN='\033[01;32m'
GREEN='\033[00;32m'
RED='\033[01;31m'
CYAN='\033[01;36m'
BOLD='\033[1m'

main()
{
  ArgCheck "$@"
  if ( ls ./*.c 1>/dev/null 2>&1 ) || ( ls ./*.cpp 1>/dev/null 2>&1 ); then
    if [ "$compile_mode" = "all_files" ]; then
      list_of_programs=$(ls -- *.{c,cpp} 2>/dev/null)
      for program_name in $list_of_programs; do
        FileCheck
        $action
      done
    else
      if [ "$compile_mode" = "file_arg" ]; then
        FileCheck
        $action
      fi
      if [ "$compile_mode" = "single_file" ]; then
        file_count=$(ls -1 -- *.{c,cpp} 2>/dev/null | wc -l)
        if [ "$file_count" = 1 ]; then
          program_name=$(ls -- *.{c,cpp} 2>/dev/null)
          FileCheck
          $action
        else
          echo
          echo -e "${RED}Too many files!!! use the -a switch${NONE}"
          kill -INT $$
        fi
      fi
      if [ "$run" == "true" ]; then PathCheck; fi
    fi
  else
    echo "No C or C++ program found"
    return 1
  fi
}

Compile()
{
  if [ $debug = true ]; then
    echo -e "${GREEN}Compiling ${BOLD}$program_name${GREEN} with debug flag...${NONE}"
    time $compiler "$program_name" -o "$program" -g
  else
    echo -e "${GREEN}Compiling ${BOLD}$program_name${GREEN}...${NONE}"
    time $compiler "$program_name" -o "$program"
  fi
}

Preprocessor()
{
  echo -e "${GREEN}Preprocessing ${BOLD}$program_name${GREEN}...${NONE}"
  $compiler "$program_name" -E > "$program".i
}

Compiler()
{
  echo -e "${GREEN}Creating assembly of ${BOLD}$program_name${GREEN}...${NONE}"
  $compiler "$program_name" -S
}

Assembler()
{
  Compiler
  echo -e "${GREEN}Running Assembler to create object code of ${BOLD}$program_name${GREEN}...${NONE}"
  as "$program".s -o "$program".o
  rm "$program".s
}

Linker()
{
  if [ ! -e "$program".o ]; then Assembler; fi
  echo -e "${GREEN}Linking and saving the linker args into ${BOLD}linker_args_for_$program.txt${NONE}"
  $compiler -v "$program_name" > report.txt 2>&1
  rm a.out 2>/dev/null
  path=$(pwd)/$program.o
  grep -oP '(?<=^ \"/data/data/com.termux/files/usr/bin/ld\" ).*' report.txt > templdargs.txt
  rm report.txt
  sed 's|[a-zA-Z0-9\/\.]*tmp[.a-zA-Z0-9\/\-]*|'"$path"'|g' templdargs.txt > linker_args_for_"$program".txt
  rm templdargs.txt
  ld @linker_args_for_"$program".txt -o "$program"
  rm "$program".o 2>/dev/null
}

Binary()
{
  if [ -e "$program".o ]; then
    echo -e "${GREEN}Creating binary of ${BOLD}$program.o${GREEN}...${NONE}"
    objcopy "$program".o -O binary "$program".bin
    xxd -b "$program".bin > binary_instruction_of_"$program".txt
    rm "$program".bin
  fi
  if [ ! -e "$program".o ]; then
    Compile
    echo -e "${GREEN}Creating binary of ${BOLD}$program_name${GREEN}...${NONE}"
    objcopy "$program" -O binary "$program".bin
    xxd -b "$program".bin > binary_instruction_of_"$program".txt
    rm "$program".bin
  fi
}

ArgCheck()
{
  if [ -z "$1" ]; then
    action="Compile"
    run="true"
  else
    for arg in "$@"; do
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
        -db )
          debug=true
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
          compiler=clang
          action="Linker"
          ;;
        --help )
          Help
          kill -INT $$
          ;;
        --update )
          echo
          echo -e "${BGREEN}Updating...${NONE}"
          sleep 1.5s
          curl -LO# https://raw.githubusercontent.com/AbdullahBinJahed/Termux-Faint-Hope/main/myScripts/cmp-shct.sh
          mv -f cmp-shct.sh $HOME/.lolicon/cmp-shct.sh
          echo
          echo -e "${BGREEN}Update complete${NONE}"
          kill -INT $$
          ;;
        *.c )
          compile_mode="file_arg"
          program_name="$arg"
          run="true"
          ;;
        *.cpp )
          compile_mode="file_arg"
          program_name="$arg"
          run="true"
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
  if [[ "$program_name" == *.c ]]; then
    program=$(basename "$program_name" .c)
    if [ $compiler == g++ ]; then compiler=gcc; fi
    if [ $compiler == clang++ ]; then compiler=clang; fi
  fi
  
  if [[ "$program_name" == *.cpp ]]; then
    program=$(basename "$program_name" .cpp)
    if [ $compiler == gcc ]; then compiler=g++; fi
    if [ $compiler == clang ]; then compiler=clang++; fi
  fi
}

PathCheck()
{
  SPCK_PATH=/storage/emulated/0/Android/data/io.spck/files/*
  EXEC_PATH=$(readlink -f ./"$program_name")
  PROJ_NAME=$(basename "$(dirname "$EXEC_PATH")")
  if [[ $EXEC_PATH = $SPCK_PATH ]]; then
    if [ ! -e ~/CPP/"$PROJ_NAME" ]; then mkdir -p ~/CPP/"$PROJ_NAME"; fi
    if [ -e ./"$program" ]; then
      mv -f ./"$program" ~/CPP/"$PROJ_NAME"
      chmod +x ~/CPP/"$PROJ_NAME"/"$program"
      echo -e ""$BGREEN"Running program from SPCK..."$NONE""
      ~/CPP/"$PROJ_NAME"/"$program"
    else
      echo -e "$RED""Compilation failed !!!""$NONE"
    fi
  else
    if [ -e ./"$program" ]; then
      echo -e ""$BGREEN"Running program..."$NONE""
      ./"$program"
    else
      echo -e "$RED""Compilation failed !!!""$NONE"
    fi
  fi
}

Help()
{
  echo "Usage: c [ARGS] [FILENAME]"
  echo -e "${CYAN}Shortcuts for some compiler processes${NONE}"
  echo
  echo "Arguments:"
  printf "  -a                      select all .c or .cpp files\n"
  printf "  -asm                    runs the assembler to create object files *.o\n"
  printf "  -bin                    creates the binary instructions and saves them in a file\n"
  printf "  -c                      use the Clang Compiler\n"
  printf "  -cmp                    runs the Compiler to create assembly code *.s\n"
  printf "  -db                     compiles with the debug flag\n"
  printf "  --help                  prints this message\n"
  printf '%-4s%-22s%s\n%-26s%s\n' "  -l" "" "links the object file with linker and saves what" "" "arguments were passed to linker into a *.txt file"
  printf "  -p                      only Preprocess programs and saves them in *.i file\n"
  printf "  --update                updates the script\n"
  echo
  echo
  echo "No arguments will compile and run single .c or .cpp program in current directory"
}

main "$@";
