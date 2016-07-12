#!/bin/bash

ROOT_UID=0      # Only users with $UID 0 have root privileges.
E_NOTROOT=87    # Non-root exit error.
OH_MY_ZSH_URL="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
USERNAME='egill'
PACKAGE_MANAGER='/usr/bin/apt'

if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "Must be root to run this script"
    exit $E_NOTROOT
fi

$PACKAGE_MANAGER install zsh vim tree curl git wget ipython
chsh -s `which zsh` $USERNAME

su - $USERNAME
wget -qO install_ohmyzsh.sh $OH_MY_ZSH_URL
. install_ohmyzsh.sh
rm install_ohmyzsh.sh

# retrieve dotfiles

# Vim automatically installs vim-plug and plugins when opened
ln -s ~/.vim/vimrc ~/.vimrc
# vim +PluginInstall +qall

# Install fasd
add-apt-repository ppa:aacebedo/fasd
apt update
apt install fasd
