function fish_greeting
  if test (stty size) = "37 70"
    neofetch
  else
    bash /data/data/com.termux/files/home/.lolicon/welcome.sh
  end
end
