if status is-interactive
# Commands to run in interactive sessions can go here
end

echo -e '\e[6 q\c'

# set -g theme_display_user yes
# set -g theme_hide_hostname yes
# set -g theme_hide_hostname no
# set -g default_user your_normal_user
set -g theme_svn_prompt_enabled yes
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

alias c='bash ~/.lolicon/cmp-shct.sh'
alias ghp='bash ~/.lolicon/scripts/ghpush.sh'
alias 1='bash ~/.lolicon/welcome.sh'
alias ccp='source ~/.lolicon/scripts/create-cpp-project.sh'
alias rf='bash ~/.lolicon/scripts/remove-folder.sh'
alias xx='chmod +x *.sh'
alias vs='vncserver -localhost && export DISPLAY=":1"'
alias vk='vncserver -kill :1'
alias p=python
alias 0=clear
alias 99=exit
alias v=vim
alias la='ls -a'
alias fd=mkdir
alias nano='nano -m'
alias mv='mv -i'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias `='bash -c "play ~/.lolicon/okaeri.flac > /dev/null 2>&1 &"'
alias ww='bash -c "ping -i 0.2 -q -w1 -c1 google.com &>/dev/null && termux-wifi-enable false || termux-wifi-enable true"'

# function ww --description 'alias ww=wifi toggle'
    # if ping -q -c 1 -W 0.1 google.com > /dev/null 2>&1
      # termux-wifi-enable false
    # else
      # termux-wifi-enable true
    # end
# end 

export HISTCONTROL=ignoreboth

# Terminal cursor styling #
#echo -e '\e[6 q\c'
#echo -e '\e[2 q' # Change to block
#echo -e '\e[4 q' # Change to underline
#echo -e '\e[6 q' # Change to bar
#echo -ne "\033]12;#00ffff\007\c"

function adachi --on-event fish_postexec
   echo -e '\e[6 q\c'
end

