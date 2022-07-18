#!/bin/bash

# bash handling (bash가 아니면 bash로 실행)
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# meld 설치 - [텍스트 비교 도구]
# 설명) 윈도우의 winMerge 같은 기능
# 라이선스) GPL 2.0+ 무료 소프트웨어
# 
# 설치 후 설정할 것
# Meld - 설정 - 편집기
# * Highlight current line : 체크
# * show line numbers : 체크
# * use syntax highlighting : 체크
sudo apt-get install -y meld

# rabbitVCS - [탐색기에 git 아이콘 표시]
# 설명) 윈도우의 tortoiseGit 같은 기능
# 라이선스) GPL 2 무료 소프트웨어
sudo apt update
sudo apt-get -y install rabbitvcs-nautilus

# filezilla 설치 [FTP 도구]
# 라이선스) 무료 소프트웨어
sudo apt-get install -y filezilla

# dbeaver 설치 [DB 클라이언트 도구]
# 라이선스) 자유 오픈 소스 소프트웨어
sudo apt update && sudo snap install dbeaver-ce