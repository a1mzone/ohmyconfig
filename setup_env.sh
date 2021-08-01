#!/bin/bash
DISTRO=`lsb_release -i | cut -f 2-`

if [ "$DISTRO" == "ManjaroLinux" ]; then
    echo "Manjaro"
    #sudo pacman -Syuu
    #sudo pacman -S git curl zsh

elif [ "$DISTRO" = "Ubuntu" ]; then
    echo "Ubuntu"
    #sudo apt install git zsh curl 

fi

# TODO - add yum / dnf support
#sudo yum install zsh git curl

add_aliases () {
    echo "alias src='source ~/.zshrc' \nalias esrc='vim ~/.zshrc'\n" >> ~/.zshrc \
    echo "alias ns='sudo netstat -tulpn | grep LISTEN'" >> ~/.zshrc \
    echo "alias pse='sudo ps -ef | grep'" >> ~/.zshrc \
    echo "alias ss='sudo systemctl'" >> ~/.zshrc \
    echo "alias v='sudo vim'" >> ~/.zshrc
}

#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sed -i 's/robbyrussell/gnzh/g' ~/.zshrc 
sed -i 's/(git)/(history)/g' ~/.zshrc

#echo "alias sai='sudo apt install' \nalias sau='sudo apt update && sudo apt upgrade'\n" >>  ~/.zshrc

echo "Do you want to add aliases?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) add_aliases; break;;
        No )  break;;
    esac
done