#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# meld 설치 - [텍스트 비교 도구]
# 설명) 윈도우의 winMerge 같은 기능
# 
# 설치 후 설정할 것
# Meld - 설정 - 편집기
# * Highlight current line : 체크
# * show line numbers : 체크
# * use syntax highlighting : 체크
sudo apt-get install -y meld

# rabbitVCS - [탐색기에 git 아이콘 표시]
# 설명) 윈도우의 tortoiseGit 같은 기능
sudo apt update
sudo apt-get -y install rabbitvcs-nautilus

