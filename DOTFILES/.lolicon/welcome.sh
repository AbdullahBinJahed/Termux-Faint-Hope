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
echo -e ""$GREEN"------------------------------------------------------------------------------------------------------"$NONE""
echo -e "🌸👯                         👘 "$PURPLE"Terumakkusu, "$CYAN"A "$YELLOW"B "$GREEN"J "$WHITE"- "$WHITE"sama "$RED"e "$YELLOW"yōkoso 👘                             🎎🌸"
echo -e ""$GREEN"------------------------------------------------------------------------------------------------------"$NONE""
fi

gitlast=$(sed -n '3p' < /data/data/com.termux/files/home/.lolicon/.datelog)
today=$(date -I)

if [ $today != $gitlast ];then
  echo -e "\033[01;31m                           There has been no GitHub contribution today !!!\033[00m"
fi

echo
tput sgr0
play-audio ~/.lolicon/greetings.mp3 &

