#bin/bash

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

