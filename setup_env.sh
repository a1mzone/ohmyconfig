#! /bin/bash

#sudo apt install git zsh curl 

#sudo yum install zsh git curl
#sudo pacman -S git curl zsh

#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


sed -i 's/robbyrussell/gnzh/g' ~/.zshrc \
sed -i 's/(git)/(history)/g' ~/.zshrc

echo "alias sai='sudo apt install' \nalias sau='sudo apt update && sudo apt upgrade'\n" >>  ~/.zshrc
 
echo "alias src='source ~/.zshrc' \nalias esrc='vim ~/.zshrc'\n" >> ~/.zshrc \
echo "alias ns='sudo netstat -tulpn | grep LISTEN'" >> ~/.zshrc \
echo "alias pse='sudo ps -ef | grep'" >> ~/.zshrc \
echo "alias ss='sudo systemctl'" >> ~/.zshrc \
echo "alias v='sudo vim'" >> ~/.zshrc