#!/bin/bash

USERNAME="egill"
HOME_DIR="/home/$USERNAME"
DOTFILES_DIR="$HOME_DIR/dotfiles"
OH_MY_ZSH_DIR="$HOME_DIR/.oh-my-zsh"
FASD_DIR="$HOME_DIR/fasd"
PACKAGE_MANAGER="/usr/bin/apt"

sudo $PACKAGE_MANAGER install zsh vim tree curl wget make
sudo chsh -s `which zsh` $USERNAME

mkdir $HOME_DIR/.ssh
touch $HOME_DIR/.ssh/authorized_keys
chmod 700 $HOME_DIR/.ssh
chmod 600 $HOME_DIR/.ssh/authorized_keys

# Install oh-my-zsh (source: github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh)
if [ -d "$OH_MY_ZSH_DIR" ]; then
    printf "Oh My Zsh already installed.\n"
else
    # Prevent the cloned repository from having insecure permissions. Failing to do
    # so causes compinit() calls to fail with "command not found: compdef" errors
    # for users with insecure umasks (e.g., "002", allowing group writability).
    umask g-w,o-w
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH_DIR || {
        printf "Error: git clone of oh-my-zsh repo failed\n"
    }
fi

# Replace dotfiles
# Vim automatically installs vim-plug and plugins when opened
if [ -f $HOME_DIR/.vimrc ]; then
    rm -v $HOME_DIR/.vimrc
fi
ln -vs $DOTFILES_DIR/vimrc $HOME_DIR/.vimrc

if [ -f $HOME_DIR/.zshrc ]; then
    rm -v $HOME_DIR/.zshrc
fi
ln -vs $DOTFILES_DIR/zshrc $HOME_DIR/.zshrc

# Install fasd with apt on ubuntu
if [ `lsb_release -i | awk '{print $3}'` == "Ubuntu" ];
then
    echo "Installing fasd via apt";
    if ! dpkg -s fasd > /dev/null 2>&1;
    then
        sudo add-apt-repository ppa:aacebedo/fasd
        sudo apt update
        sudo apt install fasd
    else
        echo "fasd already installed"
    fi;
else
    echo "Installing fasd from source";
    git clone --depth=1 https://github.com/clvv/fasd.git $FASD_DIR || {
        echo "Error: git clone of fasd repo failed"
    }
    cd $FASD_DIR
    sudo make install
fi;
