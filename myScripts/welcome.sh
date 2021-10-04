#!/bin/bash
clear

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'

if [ "$(stty size)" = "62 70" ] || [ "$(stty size)" = "37 70" ]; then
  neofetch
else
  echo
  echo -e ""$RED"--------------------------------\U0001F469------------------------------\U0001F467------------------------------------"$NONE""
  echo -e "🌸  🎑                          \U0001F458 "$PURPLE"Okaerinasai"$NONE"  "$CYAN"goshujin"$NONE" "$YELLOW"-"$NONE" "$GREEN"sama "$NONE"\U0001F458                              🎋  🌸"
  echo -e ""$RED"------------------------------------------------------------------------------------------------------"$NONE""
fi
echo
tput sgr0
play ~/.lolicon/okaeri.flac > /dev/null 2>&1 &

