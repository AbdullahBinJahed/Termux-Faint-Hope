#!/bin/bash

pkg install wget openssl-tool proot -y
hash -r
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Ubuntu/ubuntu.sh
bash ubuntu.sh
./start-ubuntu.sh
wget https://github.com/cdr/code-server/releases/download/v3.12.0/code-server-3.12.0-linux-armv7l.tar.gz
tar -xvf ./code-server-3.12.0-linux-armv7l.tar.gz
cd code-server-3.12.0-linux-armv7l
cd bin
export PASSWORD="password"
./code-server
