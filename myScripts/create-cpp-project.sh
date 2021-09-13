#!/data/data/com.termux/files/usr/bin/fish

if test $argv[1] = "-r"
  rm -rf ~/CPP/Cpp_Log/"$argv[2]" 2>/dev/null
  rm -rf ~/C++/"$argv[2]" 2>/dev/null
  cd ..
else
  mkdir ~/CPP/Cpp_Log/"$argv[1]" 2>/dev/null
  mkdir ~/C++/"$argv[1]" 2>/dev/null
  cd ~/C++/"$argv[1]"/
  touch main.cpp
  vim main.cpp
end
