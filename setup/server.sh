#!/bin/bash

. base.sh

mkdir $HOME_DIR/.ssh
touch $HOME_DIR/.ssh/authorized_keys
chmod 700 $HOME_DIR/.ssh
chmod 600 $HOME_DIR/.ssh/authorized_keys
