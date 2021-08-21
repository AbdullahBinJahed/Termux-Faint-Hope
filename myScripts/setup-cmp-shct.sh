#!/bin/sh
NONE='\033[00m'
BGREEN='\033[01;32m'

echo "${BGREEN}Setup started...${NONE}"
echo "${BGREEN}Adding the its-pointless repo to install gcc...${NONE}"
wget https://its-pointless.github.io/setup-pointless-repo.sh
chmod +x setup-pointless-repo.sh
./setup-pointless-repo.sh
rm setup-pointless-repo.sh
echo "${BGREEN}Installing gcc-11...${NONE}"
pkg install gcc-11
setupgcc-11
setup-patchforgcc
echo "${BGREEN}Downloading cmp-shct${NONE}"
wget https://raw.githubusercontent.com/AbdullahBinJahed/Termux/main/myScripts/cmp-shct.sh
sleep 1s
echo "${BGREEN}Script download complete${NONE}"
if [ ! -e "$HOME/.lolicon" ]; then mkdir "$HOME/.lolicon"; fi
if [ ! -e $HOME/.lolicon/cmp-shct.sh ]; then
  als="alias c='bash /data/data/com.termux/files/home/.lolicon/cmp-shct.sh'"
  echo "$als" >> "$HOME/.bashrc"
fi
rm "$HOME/.lolicon/cmp-shct.sh" 2>/dev/null
mv cmp-shct.sh "$HOME/.lolicon/"
echo "${BGREEN}Setup complete. Now run 'c --help' to see info${NONE}"
rm setup-cmp-shct.sh
