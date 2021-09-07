if status is-interactive
# Commands to run in interactive sessions can go here
end

# set -g theme_display_user yes
# set -g theme_hide_hostname yes
# set -g theme_hide_hostname no
# set -g default_user your_normal_user
set -g theme_svn_prompt_enabled yes
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

alias c='bash /data/data/com.termux/files/home/.lolicon/cmp-shct.sh'
alias ghp='bash /data/data/com.termux/files/home/.lolicon/scripts/ghpush.sh'
alias 1='bash /data/data/com.termux/files/home/.lolicon/welcome.sh'
alias sg='source /data/data/com.termux/files/home/.lolicon/scripts/spck-get.sh'
alias ccp='source /data/data/com.termux/files/home/.lolicon/scripts/create-cpp-project.sh'
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

export HISTCONTROL=ignoreboth

# Terminal cursor styling #
echo -e '\e[6 q'
#echo -e '\e[2 q' # Change to block
#echo -e '\e[4 q' # Change to underline
#echo -e '\e[6 q' # Change to bar
#echo -ne "\033]12;#ff0000\007"
