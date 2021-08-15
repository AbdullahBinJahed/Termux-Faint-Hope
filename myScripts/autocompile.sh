TIMEFORMAT='Compile Time: %3R seconds'
#cprogram=`ls ./*.{c,cpp}`
program_name=`ls | egrep '\.c$|\.cpp$'`

if [[ $program_name == *.c ]]
then
  program=`basename $program_name .c`
  compiler=gcc
  if [[ $1 == c ]]
  then
    compiler=clang
  fi
  time $compiler $program_name -o $program
  ./$program
else
  if [[ $program_name == *.cpp ]]
  then
    program=`basename $program_name .cpp`
    compiler=g++
    if [[ $1 == c ]]
    then
      compiler=clang++
    fi
    time $compiler $program_name -o $program
    ./$program
  else
    echo "No C or Cpp Program found"
  fi
fi
