#!/bin/bash

DISTRO=`lsb_release -i | cut -f 2-`
DIR=`pwd`
PARENT_DIR=`dirname $DIR`
IAM=`whoami`

echo "WORKING IN: $DIR"
echo "PARENT DIR: $PARENT_DIR"

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
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# get ohmyconfig
get_ohmyconfig () {
    mkdir -pv ~/source && cd ~/source 
    git clone https://github.com/a1mzone/ohmyconfig
}

# set .zshrc to ohmyconfig
set_ohmyconfig () {
    rm ~/.zshrc
    ln -s ~/source/ohmyconfig/zshrc_config ~/.zshrc
    source ~/.zshrc
}

# install basic packages
install_basic_packages () {
    if [ "$DISTRO" == "ManjaroLinux" ]; then
        echo "DO NOTHING... FIX IF YOU WANNA USE"

    elif [ "$DISTRO" = "Ubuntu" ]; then
        echo "Installing Basic Packages ->"
        sudo apt -y install python3-pip virtualenv virtualenvwrapper iotop fonts-font-awesome ranger lm-sensors unzip nmap openjdk-8-jdk net-tools acl bmon network-manager
    fi
}

# create virtualenvwrapper home location
fix_virtualenvwrapper () {
    mkdir -pv ~/.local/bin && sudo find / -type f -name 'virtualenvwrapper.sh' -exec cp {} ~/.local/bin/ \;
}

install_ohmyzsh
get_ohmyconfig
set_ohmyconfig
install_basic_packages
fix_virtualenvwrapper


# # test function
# check_test () {
#     grep -qF "alias src='source ~/.zshrc'" $PARENT_DIR/zshrc_config || echo -e "alias src='source ~/.zshrc'" | tee -a $PARENT_DIR/zshrc_config
# }

# # add the current user to /etc/sudoers
# no_passwd_sudo () {
#     sudo grep -qxF "${IAM}  ALL=(ALL) NOPASSWD: ALL" /etc/sudoers || echo -e "$IAM  ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers 
# }

# # setup python venvs
# python_virtual_env () {
#     grep -qF "# VIRTUALENV" $PARENT_DIR/zshrc_config || echo -e "\n# VIRTUALENV" | tee -a $PARENT_DIR/zshrc_config
#     grep -qF "#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" $PARENT_DIR/zshrc_config || echo -e "#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" | tee -a $PARENT_DIR/zshrc_config 
#     grep -qF "export WORKON_HOME=~/.virtualenvs" $PARENT_DIR/zshrc_config || echo -e "export WORKON_HOME=~/.virtualenvs" | tee -a $PARENT_DIR/zshrc_config
#     grep -qF "mkdir -p $WORKON_HOME" $PARENT_DIR/zshrc_config || echo -e "mkdir -p $WORKON_HOME" | tee -a $PARENT_DIR/zshrc_config
#     grep -qF "source /usr/bin/virtualenvwrapper.sh" $PARENT_DIR/zshrc_config || echo -e "source /usr/bin/virtualenvwrapper.sh" | tee -a $PARENT_DIR/zshrc_config
# }


# echo ""
# echo "install ohmyzsh [update required]?"
# select yn in "Yes" "No"; do
#    case $yn in
#        #Yes ) add_aliases; zsh_basics; break;;
#        Yes ) install_ohmyzsh; break;;
#        No )  break;;
#    esac
# done

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
