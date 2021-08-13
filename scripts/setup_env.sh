#!/bin/bash
DISTRO=`lsb_release -i | cut -f 2-`
DIR=`pwd`
PARENT_DIR=`dirname $DIR`
IAM=`whoami`

echo "WORKING IN: $DIR"
echo "PARENT DIR: $PARENT_DIR"
echo ""

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
test () {
    grep -qF "alias src='source ~/.zshrc'" $PARENT_DIR/zshrc_config || echo -e "alias src='source ~/.zshrc'" | tee -a $PARENT_DIR/zshrc_config
}

no_passwd_sudo () {
    sudo grep -qxF "${IAM}  ALL=(ALL) NOPASSWD: ALL" /etc/sudoers || echo -e "$IAM  ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers 
}
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh_basics () {
    sed -i 's/robbyrussell/gnzh/g' ~/.zshrc
    sed -i 's/(git)/(git history)/g' ~/.zshrc
}

python_virtual_env () {
echo "# VIRTUALENV" >> $PARENT_DIR/zshrc_config
echo "export WORKON_HOME=~/.virtualenvs" >> $PARENT_DIR/zshrc_config
echo "mkdir -p $WORKON_HOME" >> $PARENT_DIR/zshrc_config
echo "source /usr/bin/virtualenvwrapper.sh" >> $PARENT_DIR/zshrc_config
}
#echo "alias sai='sudo apt install' \nalias sau='sudo apt update && sudo apt upgrade'\n" >>  ~/.zshrc

echo ""
echo "add this user in /etc/sudoers?"
select yn in "Yes" "No"; do
    case $yn in
        #Yes ) add_aliases; zsh_basics; break;;
        Yes ) no_passwd_sudo; break;;
        No )  break;;
    esac
done

echo ""
echo "alias test?"
select yn in "Yes" "No"; do
    case $yn in
        #Yes ) add_aliases; zsh_basics; break;;
        Yes ) test; break;;
        No )  break;;
    esac
done