TIMEFORMAT='Compile Time: %3R seconds'
#cprogram=`ls ./*.{c,cpp}`
programname=`ls | egrep '\.c$|\.cpp$'`


if [[ $programname == *.c ]]
then
  program=`basename $programname .c`
  time clang $programname -o $program
  ./$program
else
  if [[ $programname == *.cpp ]]
  then
    program=`basename $programname .cpp`
    time clang++ $programname -o $program
    ./$program
  else
    echo "No C or Cpp Program found"
  fi
fi
