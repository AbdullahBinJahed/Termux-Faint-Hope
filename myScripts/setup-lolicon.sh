#!/bin/bash
NONE='\033[00m'
BGREEN='\033[01;32m'
RED='\033[01;31m'

clear
echo -e "$BGREEN"Setup started..."$NONE"

apt update -y --force-yes
apt upgrade -y --force-yes
pkg update -y --force-yes
pkg upgrade -y --force-yes

echo -e "$BGREEN"Installing packages..."$NONE"
sleep 1
echo -e "$BGREEN"Installing crucial packages..."$NONE"
pkg i -y wget curl cmatrix vim git gh man neofetch tree fish

echo -e "Do you want to download additional packages? [y/n] \c"
read consent
if [ $consent = "y" ] || [ $consent = "Y" ];then
  echo -e "$BGREEN"Installing additional packages..."$NONE"
  pkg i -y coreutils binutils cronie file imagemagick ncurses neovim proot tmux termux-api termux-elf-cleaner termux-exec termux-services termux-tools zsh
fi
consent=""

echo -e "Do you want to download C/C++ packages? [y/n] \c"
read consent
if [ $consent = "y" ] || [ $consent = "Y" ];then
  echo -e "$BGREEN"Installing C/C++ packages..."$NONE"
  pkg install cgdb clang cmake gdb lldb make -y
  echo -e "$BGREEN"Downloading setup-cmp-shct"$NONE"
  curl -LO# https://raw.githubusercontent.com/AbdullahBinJahed/Termux-Faint-Hope/main/myScripts/setup-cmp-shct.sh
  chmod +x setup-cmp-shct.sh
  bash setup-cmp-shct.sh
fi
consent=""

echo -e "Do you want to download Node.js and React packages? [y/n] \c"
read consent
if [ $consent = "y" ] || [ $consent = "Y" ];then
  echo -e "$BGREEN"Installing Node.js..."$NONE"
  pkg install nodejs yarn -y
  echo -e "$BGREEN"Installing React packages..."$NONE"
  npm install -g npm@6
  npm install -g tar
  npm install -g create-react-app
  consent=""
  echo -e "Do you want to create a test React app now? [y/n] \c"
  read consent
  if [ $consent = "y" ] || [ $consent = "Y" ];then
    echo
    echo
    echo -e "$RED"This may take a long time so please wait until it"'"s finished"$NONE"
    sleep 4
    npx create-react-app my-react-app
  fi
fi
consent=""

echo -e "Do you want to download Python packages? [y/n] \c"
read consent
if [ $consent = "y" ] || [ $consent = "Y" ];then
  echo -e "$BGREEN"Installing Python packages..."$NONE"
  curl -L https://its-pointless.github.io/setup-pointless-repo.sh | sh
  pkg install python numpy scipy vim-python -y
  /data/data/com.termux/files/usr/bin/python3 -m pip install --upgrade pip
  pip3 install wheel
  pip3 install PythonTurtle
  pip3 install pudb
  pip3 install speedtest-cli
  consent=""
  echo -e "Do you want to install pygame? [y/n] \c"
  read consent
  if [ $consent = "y" ] || [ $consent = "Y" ];then
    echo -e "$BGREEN"Installing pygame packages..."$NONE"
    pkg install build-essential x11-repo -y
    pkg install freetype sdl sdl2 sdl2-image sdl2-mixer sdl2-ttf xorgproto libopenmpt libgomp-11 -y
    pip3 install cython
    wget https://www.pygame.org/ftp/pygame-1.9.6.tar.gz
    tar -xvf pygame-1.9.6.tar.gz
    cd pygame-1.9.6
    python3 setup.py -config -auto -sdl2
    python3 setup.py install cython
  fi
fi
consent=""

echo -e "Do you want to download Graphical/X11 packages? [y/n] \c"
read consent
if [ $consent = "y" ] || [ $consent = "Y" ];then
  echo -e "$BGREEN"Installing X11 packages..."$NONE"
  pkg install x11-repo
  pkg install freeglut gl4es glew glu gtk2 gtk3 gtk4 mesa mesa-demos python-tkinter qt-creator sdl2 sdl2-image sdl2-mixer sdl2-net sdl2-ttf tk vim-gtk tigervnc xfce4 -y
  mkdir ~/.vnc 2>/dev/null
  touch ~/.vnc/xstartup 2>/dev/null
  echo "xfce4-session &" > ~/.vnc/xstartup
fi
consent=""
echo -e "$BGREEN"Package Installation Completed"$NONE"

mkdir ~/.lolicon 2>/dev/null
mkdir ~/.lolicon/scripts 2>/dev/null
echo -e "$BGREEN"Cloning AbdullahBinJahed/Termux-Faint-Hope..."$NONE"
git clone https://github.com/AbdullahBinJahed/Termux-Faint-Hope.git
cd Termux-Faint-Hope/myScripts/
echo -e "$BGREEN"Copying scripts..."$NONE"
cp -f welcome.sh ~/.lolicon/
cp -f create-cpp-project.sh ~/.lolicon/scripts/
cp -f remove-folder.sh ~/.lolicon/scripts/
cp -f ghpush.sh ~/.lolicon/scripts/
cd ../DOTFILES/
echo -e "$BGREEN"Copying DOTFILES..."$NONE"
cp -rf .config ~/
cp -rf .termux ~/
cp -rf .vim ~/
cp -rf .bashrc ~/
cp -rf .vimrc ~/
cp -rf .lolicon ~/
echo -e "$BGREEN"Installing vim plugin..."$NONE"
vim -c'PlugInstall --sync' +qa
echo "source ~/.lolicon/vim/general/colorscheme.vim" >> ~/.vimrc
echo -e "$BGREEN"Removed Message of the Day (motd)..."$NONE"
rm /data/data/com.termux/files/usr/etc/motd
cd ../../
echo -e "$BGREEN"Deleting AbdullahBinJahed/Termux-Faint-Hope..."$NONE"
rm -rf Termux-Faint-Hope
echo -e "$BGREEN"Changing default shell from bash to fish..."$NONE"
chsh -s fish
echo -e "$BGREEN"Setup Completed"$NONE"
termux-reload-settings
rm ./setup-lolicon.sh && exit
