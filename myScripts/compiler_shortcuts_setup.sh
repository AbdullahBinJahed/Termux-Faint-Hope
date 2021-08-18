wget https://raw.githubusercontent.com/AbdullahBinJahed/Termux/main/myScripts/compiler_shortcuts.sh
if [ ! -e $HOME/.lolicon ]; then mkdir $HOME/.lolicon; fi
rm $HOME/.lolicon/compiler_shortcuts.sh
mv compiler_shortcuts.sh $HOME/.lolicon/
als="alias c='source /data/data/com.termux/files/home/.lolicon/compiler_shortcuts.sh'"
echo "$als" >> $HOME.bashrc
rm compiler_shortcuts_setup.sh
