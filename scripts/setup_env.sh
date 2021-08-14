#!/bin/bash
#GETINFO
DISTRO=`lsb_release -i | cut -f 2-`
DIR=`pwd`
PARENT_DIR=`dirname $DIR`
IAM=`whoami`

echo "WORKING IN: $DIR"
echo "PARENT DIR: $PARENT_DIR"

# set theme & enable history & git plugin
zsh_basics () {
    sed -i 's/robbyrussell/gnzh/g' ~/.zshrc
    sed -i 's/(git)/(git history)/g' ~/.zshrc
}

# install ohmyzsh on Manjaro or Ubuntu
install_ohmyzsh () {
    if [ "$DISTRO" == "ManjaroLinux" ]; then
        echo "Updating Manjaro ->"
        sudo pacman -Syuu
        sudo pacman -S git curl zsh

    elif [ "$DISTRO" = "Ubuntu" ]; then
        echo "Updating Ubuntu ->"
        sudo apt update && sudo apt upgrade
        sudo apt -y install git zsh curl
    fi
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && zsh_basics
}

install_snaps () {
    if [ "$DISTRO" == "ManjaroLinux" ]; then
        sudo pacman -S snapd

    elif [ "$DISTRO" = "Ubuntu" ]; then
        echo "Updating Ubuntu ->"
        sudo apt update && sudo apt upgrade
        sudo apt -y install snapd
    fi 

    sudo snap install teams-for-linux 
    sudo snap install node-red
    sudo snap install insomnia
    sudo snap install simplenote
    sudo snap install bitwarden
    #sudo snap install slack --classic
}

# test function
check_test () {
    grep -qF "alias src='source ~/.zshrc'" $PARENT_DIR/zshrc_config || echo -e "alias src='source ~/.zshrc'" | tee -a $PARENT_DIR/zshrc_config
}

# add the current user to /etc/sudoers
no_passwd_sudo () {
    sudo grep -qxF "${IAM}  ALL=(ALL) NOPASSWD: ALL" /etc/sudoers || echo -e "$IAM  ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers 
}

# setup python venvs
python_virtual_env () {
    grep -qF "# VIRTUALENV" $PARENT_DIR/zshrc_config || echo -e "\n# VIRTUALENV" | tee -a $PARENT_DIR/zshrc_config
    grep -qF "#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" $PARENT_DIR/zshrc_config || echo -e "#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" | tee -a $PARENT_DIR/zshrc_config 
    grep -qF "export WORKON_HOME=~/.virtualenvs" $PARENT_DIR/zshrc_config || echo -e "export WORKON_HOME=~/.virtualenvs" | tee -a $PARENT_DIR/zshrc_config
    grep -qF "mkdir -p $WORKON_HOME" $PARENT_DIR/zshrc_config || echo -e "mkdir -p $WORKON_HOME" | tee -a $PARENT_DIR/zshrc_config
    grep -qF "source /usr/bin/virtualenvwrapper.sh" $PARENT_DIR/zshrc_config || echo -e "source /usr/bin/virtualenvwrapper.sh" | tee -a $PARENT_DIR/zshrc_config
}



#echo ""
#echo "install ohmyzsh [update required]?"
#select yn in "Yes" "No"; do
#    case $yn in
#        #Yes ) add_aliases; zsh_basics; break;;
#        Yes ) install_ohmyzsh; break;;
#        No )  break;;
#    esac
#done

#echo ""
#echo "add this user to /etc/sudoers?"
#select yn in "Yes" "No"; do
#    case $yn in
#        #Yes ) add_aliases; zsh_basics; break;;
#        Yes ) no_passwd_sudo; break;;
#        No )  break;;
#    esac
#done

#echo ""
#echo "python virualnenvwrapper?"
#select yn in "Yes" "No"; do
#    case $yn in
#        #Yes ) add_aliases; zsh_basics; break;;
#        Yes ) python_virtual_env; break;;
#        No )  break;;
#    esac
#done
