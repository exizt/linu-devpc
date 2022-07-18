#!/bin/bash
# 
# run.sh
#
# ----------------------------------------------------------------------
# 가장 먼저 실행할 스크립트.
#
# Copyright 2022 shoon
# 
# 기능
#   - 우분투 저장소 경로 변경.
#   - vim, git 설치
# 
# Author: shoon
# Usage: laravel-permission.sh
# ----------------------------------------------------------------------


# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# 우분투 저장소 경로를 변경하기
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -E -i 's#deb http://[a-z.]*archive\.ubuntu\.com/ubuntu#deb https://mirror.kakao.com/ubuntu/#g' /etc/apt/sources.list

# vi에디터로 수정이 잘 안 되니까, vim을 설치
sudo apt-get install vim

# git 설치
sudo apt-get install git

# git 설정
git config --global user.name exizt
git config --global user.email e2xist@gmail.com
git config --global color.ui auto

# www-data 그룹에 shoon 유저 추가하기 (기본적으로 shoon 유저가 먼저 있어야 함)
sudo usermod -a -G www-data shoon