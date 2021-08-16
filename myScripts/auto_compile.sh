TIMEFORMAT='Compile Time: %3R seconds'

main()
{
  if [ "$2" == "" ]; then
    if [ "$1" == "" ]; then
      program_name=`ls | egrep '\.c$|\.cpp$'`
      Compile
      ./$executable
    fi
    if [ "$1" == "c" ]; then
      program_name=`ls | egrep '\.c$|\.cpp$'`
      Compile
      ./$executable
    fi
    if [ "$1" == "-a" ]; then
      list_of_programs=$(ls *.{c,cpp} 2>/dev/null)
      for program_name in $list_of_programs; do
        Compile
      done
    fi
  fi
  if [ "$2" == "-a" ]; then
    if [ "$1" == "c" ]; then
      list_of_programs=$(ls *.{c,cpp} 2>/dev/null)
      for program_name in $list_of_programs; do
        Compile
      done
    fi
  fi
}

Compile()
{
  if [[ $program_name == *.c ]]; then
    program=`basename $program_name .c`
    compiler=gcc
    if [[ $1 == c ]]; then compiler=clang; fi
    time $compiler $program_name -o $program
    export executable=$program
  else
    if [[ $program_name == *.cpp ]]; then
      program=`basename $program_name .cpp`
      compiler=g++
      if [[ $1 == c ]]; then compiler=clang++; fi
      time $compiler $program_name -o $program
      export executable=$program
    else
      echo "No C or Cpp Program found"
    fi
  fi
}

main "$@";
