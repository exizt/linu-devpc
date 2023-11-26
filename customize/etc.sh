#!/bin/bash
# ===========================================
# 우분투 추가 디스크(드라이브) 마운트 스크립트.
# 
#        File : mount_sdb1.sh
#       Usage : mount_sdb1.sh [destination path]
# Description : 마운트를 조금 편리하게 하려고 스크립트화한 것임.
#   Arguments :
#       - destination path : sdb1이 마운트될 경로
# ===========================================

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# 파라미터가 없는 경우는 실행하지 않도록 함. (파라미터는 목적 경로)
if [ "$#" -lt 1 ]; then
    SCRIPT_NAME=$(basename "$0")
    echo "[$SCRIPT_NAME] Parameters are required."
    exit 1
fi


# ubuntu 22.04 에서 python -> python3
# 참고: python3는 이미 설치되어져 있음.
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

# pip는 설치되어있지 않은 듯하니 설치
sudo apt install python3-pip

