#!/bin/bash
NONE='\033[00m'
BGREEN='\033[01;32m'

clear
echo -e "${BGREEN}Setup started...${NONE}"
pkg update -y
pkg upgrade -y
apt update -y
apt upgrade -y
echo -e "${BGREEN}Installing packages...${NONE}"
pkg install clang vim nodejs python cmatrix curl wget fish gh git ncurses cmake make man neovim net-tools tree x11-repo yarn zsh -y
echo -e "${BGREEN}Package Installation Completed${NONE}"
mkdir ~/.lolicon
mkdir ~/.lolicon/scripts
echo -e "${BGREEN}Cloning AbdullahBinJahed/Termux-Faint-Hope...${NONE}"
git clone https://github.com/AbdullahBinJahed/Termux-Faint-Hope.git
cd Termux-Faint-Hope/myScripts/
chmod +x setup-cmp-shct.sh
source setup-cmp-shct.sh
echo -e "${BGREEN}Installing gtk3 and vim-gtk...${NONE}"
pkg install gtk3 vim-gtk -y
echo -e "${BGREEN}Copying scripts...${NONE}"
cp -f welcome.sh ~/.lolicon
cp -f ghpush.sh ~/.lolicon/scripts
cd ../DOTFILES/
echo -e "${BGREEN}Copying DOTFILES...${NONE}"
cp -rf .config ~/
cp -rf .termux ~/
cp -rf .vim ~/
cp -rf .bashrc ~/
cp -rf .vimrc ~/
cp -rf .lolicon ~/
echo -e "${BGREEN}Installing vim plugin...${NONE}"
vim -c'PlugInstall --sync' +qa
echo -e "${BGREEN}Removed Startup message...${NONE}"
rm /data/data/com.termux/files/usr/etc/motd
cd ../../
echo -e "${BGREEN}Deleting AbdullahBinJahed/Termux-Faint-Hope...${NONE}"
rm -rf Termux-Faint-Hope
echo -e "${BGREEN}Changing default shell from bash to fish...${NONE}"
chsh -s fish
echo -e "${BGREEN}Setup Completed${NONE}"
termux-reload-settings
exit
