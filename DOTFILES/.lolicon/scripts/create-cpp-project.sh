#!/bin/fish

if test $argv[1] = "-r"
  if test -e ~/C++/"$argv[2]"
    rm -rf ~/CPP/Cpp_Log/"$argv[2]"
    rm -rf ~/C++/"$argv[2]"
  else
    echo "Project doesn't exists !!!"
  end
else
  if test -e ~/C++/"$argv[1]"
    echo "Project already exists !!!"
    cd ~/C++/"$argv[1]"/
  else
    mkdir ~/CPP/Cpp_Log/"$argv[1]"
    mkdir ~/C++/"$argv[1]"
    cd ~/C++/"$argv[1]"/
    touch main.cpp
    vim main.cpp
  end
end
