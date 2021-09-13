#!/bin/bash
NONE='\033[00m'
BGREEN='\033[01;32m'

echo -e "${BGREEN}Cmp-Shct Setup started...${NONE}"
pkg install clang
echo -e "${BGREEN}Adding the its-pointless repo to install gcc...${NONE}"
wget https://its-pointless.github.io/setup-pointless-repo.sh
chmod +x setup-pointless-repo.sh
bash ./setup-pointless-repo.sh
rm setup-pointless-repo.sh
echo -e "${BGREEN}Installing gcc-11...${NONE}"
pkg install gcc-11 -y
setupgcc-11
setup-patchforgcc
echo -e "${BGREEN}Installing GNU Debugger...${NONE}"
pkg install gdb cgdb gdbm-static -y
echo -e "${BGREEN}Downloading cmp-shct${NONE}"
curl -LO# https://raw.githubusercontent.com/AbdullahBinJahed/Termux-Faint-Hope/main/myScripts/cmp-shct.sh
sleep 1s
echo -e "${BGREEN}Script download complete${NONE}"
if [ ! -e ~/.lolicon ]; then mkdir ~/.lolicon; fi
if [ ! -e ~/.lolicon/cmp-shct.sh ]; then
  als="alias c='bash /data/data/com.termux/files/home/.lolicon/cmp-shct.sh'"
  echo "$als" >> ~/.bashrc
fi
echo -e "${BGREEN}Updating cmp-shct if already exists...${NONE}"
if [ -e ~/.lolicon/cmp-shct.sh ]; then
  rm ~/.lolicon/cmp-shct.sh 2>/dev/null
fi
mv cmp-shct.sh ~/.lolicon/

echo -e "${BGREEN}Creating symlinks and directory to use with Spck${NONE}"
termux-setup-storage
mkdir /storage/emulated/0/Android/data/io.spck 2>/dev/null
mkdir /storage/emulated/0/Android/data/io.spck/files 2>/dev/null
mkdir /storage/emulated/0/Android/data/io.spck/files/C++ 2>/dev/null
ln -s /storage/emulated/0/Android/data/io.spck/files/C++ ~/C++
mkdir ~/CPP
echo -e "${BGREEN}Setup complete. Now run 'c --help' to see info${NONE}"
rm ./setup-cmp-shct.sh
source ~/.bashrc
