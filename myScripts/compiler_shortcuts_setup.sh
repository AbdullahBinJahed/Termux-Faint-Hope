#!/bin/sh
NONE='\033[00m'
BGREEN='\033[01;32m'

echo "${BGREEN}Installation started...${NONE}"
wget https://raw.githubusercontent.com/AbdullahBinJahed/Termux/main/myScripts/compiler_shortcuts.sh
if [ ! -e "$HOME/.lolicon" ]; then mkdir "$HOME/.lolicon"; fi
rm "$HOME/.lolicon/compiler_shortcuts.sh"
mv "compiler_shortcuts.sh" "$HOME/.lolicon/"
als="alias c='source /data/data/com.termux/files/home/.lolicon/compiler_shortcuts.sh'"
echo "$als" >> "$HOME/.bashrc"
echo "${BGREEN}Installation finished now run c --help to see info${NONE}"
rm compiler_shortcuts_setup.sh
