#if [ $(stty size) = "37 70" ] || [ $(stty size) = "62 70" ]; then
#  neofetch
#else
#  bash /data/data/com.termux/files/home/.lolicon/welcome.sh
#fi

bash /data/data/com.termux/files/home/.lolicon/welcome.sh
echo -e '\e[6 q\c'

alias c='bash /data/data/com.termux/files/home/.lolicon/cmp-shct.sh'
alias ghp='bash /data/data/com.termux/files/home/.lolicon/scripts/ghpush.sh'
alias 1='bash /data/data/com.termux/files/home/.lolicon/welcome.sh'
alias sg='/data/data/com.termux/files/home/.lolicon/scripts/spck-get.sh'
alias ccp='/data/data/com.termux/files/home/.lolicon/scripts/create-cpp-project.sh'
alias rf='bash /data/data/com.termux/files/home/.lolicon/scripts/remove-folder.sh'
alias xx='chmod +x *.sh'
alias vs='vncserver -localhost && export DISPLAY=":1"'
alias vk='vncserver -kill :1'
alias 0='clear'
alias 99='exit'
alias v='vim'
alias la='ls -a'
alias nano='nano -m'
alias mv='mv -i'
alias rm='rm -i'
alias ..='cd ..'
alias ...='../../'
alias ....='../../../'

# Terminal cursor styling #
#echo -e '\e[6 q\c'
#echo -e '\e[2 q' # Change to block
#echo -e '\e[4 q' # Change to underline
#echo -e '\e[6 q' # Change to bar
#echo -ne "\033]12;#00ffff\007\c"

PROMPT_COMMAND='echo -e "\e[6 q\c"'

