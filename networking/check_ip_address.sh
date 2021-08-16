# Private IP adress

ifconfig wlan0 | grep -i mask | awk '{print $2}'| cut -f2 -d:

ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -f1 -d'/'

# Public IP adress

curl ifconfig.me
echo ""
wget -qO- ifconfig.me
echo ""
dig +short myip.opendns.com @resolver1.opendns.com
