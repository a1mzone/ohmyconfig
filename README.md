# ohmyconfig
Configuration management 

### Includes
    i3-WM - .i3/config
    ranger - rc.conf
    vim - vim.rc
    ohmyzsh - .zshrc
    setup_env.sh 


### ohmyzsh

    mkdir -p ~/source && \
    cd ~/source && \
    git clone https://github.com/a1mzone/ohmyconfig.git
    
    rm ~/.zshrc && \
    ln -s ~/source/ohmyconfig/zshrc_config ~/.zshrc && \ 
    source ~/.zshrc
