#bin/bash

MAIN()
{
  CPP_PATH=/data/data/com.termux/files/home/C++*
  if [[ $(pwd) = $CPP_PATH ]]; then
    CPP_GIT
  else
    echo -e "\033[01;33mLast commit: $(git log --format=%B -n 1 $(git log -1 --pretty=format:"%h"))\033[00m"
    git add .
    echo -e "commit message: \c"
    read commit_message
    git commit -m "$commit_message"
    git push -u origin main
    echo -e "\033[01;36mSuki desu~ ABJ-sama ヽ(‘ ∇‘ )ノ ~nya\033[00m"
  fi
}

CPP_GIT()
{
  cd /data/data/com.termux/files/home/C++/
  read -r datelog < /data/data/com.termux/files/home/.lolicon/.datelog
  datenum=$(sed -n '2p' < /data/data/com.termux/files/home/.lolicon/.datelog)
  today=$(date -I)
  if [ $datelog = $today ]; then
    motd="\033[01;36mGanbare ABJ-sama UwU\033[00m"
  else
    ((datenum++))
    sed -i '1s/.*/'"$today"'/' /data/data/com.termux/files/home/.lolicon/.datelog
    sed -i '2s/.*/'"$datenum"'/' /data/data/com.termux/files/home/.lolicon/.datelog
    motd="\033[01;36mIt's another day of learning C++ ≖‿≖\033[00m"
  fi
  datenum=$(sed -n '2p' < /data/data/com.termux/files/home/.lolicon/.datelog)
  
  echo -e "\033[01;33mLast commit: $(git log --format=%B -n 1 $(git log -1 --pretty=format:"%h"))\033[00m"
  git add .
  git commit -m "day "$datenum""
  git push -u origin main
  echo -e "$motd"
}

CHECK_NETWORK()
{
  case "$(curl -s --max-time 2 -I http://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
    [23]) MAIN;;
    5) echo "The web proxy won't let us through";;
    *) echo -e "\033[01;31mNo Internet connection or it's very slow (〒﹏〒)\033[00m"
       echo
       echo -e "\033[01;32mTrying to connect to wifi...\033[00m"
       termux-wifi-enable true
       sleep 3
       if ping -q -c 1 -W 3 google.com > /dev/null 2>&1; then
         echo -e "\033[01;32mThe network is up. Retrying... ヽ(*⌒▽⌒*)ﾉ\033[00m"
         CHECK_NETWORK
       else
         echo -e "\033[01;31mThe network is down. Please connect to a network (×﹏×)\033[00m"
       fi;;
  esac
}

CHECK_NETWORK
