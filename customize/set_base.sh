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

# 스크립트의 경로
SCRIPT_PATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

# 우분투 저장소 경로를 변경하기
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -E -i 's#deb http://[a-z.]*archive\.ubuntu\.com/ubuntu#deb https://mirror.kakao.com/ubuntu/#g' /etc/apt/sources.list

# vi에디터로 수정이 잘 안 되니까, vim을 설치
sudo apt-get install -y vim

# git 설치 (설치되어 있지 않았을 경우에 설치하기 위함)
sudo apt-get install -y git

# git 설정
git config core.filemode false # 깃이 퍼미션 변경을 추적하는 것을 끄기
git config --global user.name exizt
git config --global user.email e2xist@gmail.com
git config --global color.ui auto

# www-data 그룹에 shoon 유저 추가하기 (기본적으로 shoon 유저가 먼저 있어야 함)
sudo usermod -a -G www-data shoon
