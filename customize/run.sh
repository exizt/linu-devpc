#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# vi에디터로 수정이 잘 안 되니까, vim을 설치
sudo apt-get install vim

# git 설치
sudo apt-get install git

# git 설정
git config --global user.name exizt
git config --global user.email e2xist@gmail.com
git config --global color.ui auto