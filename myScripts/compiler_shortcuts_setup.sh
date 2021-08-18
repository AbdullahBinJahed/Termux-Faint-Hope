#!/bin/sh
NONE='\033[00m'
BGREEN='\033[01;32m'

echo "${BGREEN}Setup started...${NONE}"
wget https://raw.githubusercontent.com/AbdullahBinJahed/Termux/main/myScripts/compiler_shortcuts.sh 1>&2 2>/dev/null
sleep 1s
echo "${BGREEN}Script download complete${NONE}"
if [ ! -e "$HOME/.lolicon" ]; then mkdir "$HOME/.lolicon"; fi
rm "$HOME/.lolicon/compiler_shortcuts.sh"
mv "compiler_shortcuts.sh" "$HOME/.lolicon/"
if [ ! -e $HOME/.lolicon/compiler_shortcuts.sh ]; then
  als="alias c='source /data/data/com.termux/files/home/.lolicon/compiler_shortcuts.sh'"
  echo "$als" >> "$HOME/.bashrc"
fi
echo "${BGREEN}Setup complete. Now run 'c --help' to see info${NONE}"
rm compiler_shortcuts_setup.sh
