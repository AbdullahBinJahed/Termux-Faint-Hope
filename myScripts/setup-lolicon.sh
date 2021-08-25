#!/bin/bash
NONE='\033[00m'
BGREEN='\033[01;32m'

clear
echo "${BGREEN}Setup started...${NONE}"
pkg update && pkg upgrade
apt update && apt upgrade
echo "${BGREEN}Installing packages...${NONE}"
pkg install clang vim nodejs python python3 cmatrix curl wget fish gh git gtk3 ncurses cmake make man neovim net-tools tree vim-gtk x11-repo yarn zsh -y
echo "${BGREEN}Package Installation Completed${NONE}"
mkdir ~/.lolicon
mkdir ~/.lolicon/scripts
echo "${BGREEN}Cloning AbdullahBinJahed/Termux...${NONE}"
git clone https://github.com/AbdullahBinJahed/Termux.git
cd Termux/myScripts/
chmod +x setup-cmp-shct.sh
./setup-cmp-shct.sh
mv -f welcome.sh ~/.lolicon
mv -f ghpus.sh ~/.lolicon/scripts
cd ../DOTFILES/
echo "${BGREEN}Copying DOTFILES...${NONE}"
cp -rf .config ~/
cp -rf .local ~/
cp -rf .termux ~/
cp -rf .vim ~/
cp -rf .bashrc ~/
cp -rf .vimrc ~/
cp -rf .viminfo ~/
echo "${BGREEN}Removed Startup message...${NONE}"
mv /data/data/com.termux/files/usr/etc/motd /data/data/com.termux/files/usr/etc/__not_needed_motd
cd ../../
echo "${BGREEN}Deleting AbdullahBinJahed/Termux...${NONE}"
rm -rf Termux
echo "${BGREEN}Changing default shell from bash to fish...${NONE}"
chsh -s fish
echo "${BGREEN}Setup Completed${NONE}"
termux-reload-settings
exit
