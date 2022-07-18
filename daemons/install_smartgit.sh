#!/bin/bash

# ##########################################
# Smartgit 설치 스크립트
# 
# - 무료 git 클라이언트 도구이다. 상업 목적은 유료라는 듯...


# bash handling (bash가 아니면 bash로 실행)
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

wget -O /tmp/smartgit.deb https://www.syntevo.com/downloads/smartgit/smartgit-21_2_2.deb
sudo dpkg -i /tmp/smartgit.deb
sudo rm -f /tmp/smartgit.deb