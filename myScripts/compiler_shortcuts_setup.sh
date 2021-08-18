wget https://raw.githubusercontent.com/AbdullahBinJahed/Termux/main/myScripts/compiler_shortcuts.sh
mkdir $HOME/.lolicon
mv compiler_shortcuts.sh $HOME/.lolicon/
als="alias c='source /data/data/com.termux/files/home/.lolicon/compiler_shortcuts.sh'"
echo "$als" >> $PREFIX/etc/bash.bashrc
rm compiler_shortcuts_setup.sh
