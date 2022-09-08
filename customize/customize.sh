#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# 스크립트의 경로
SCRIPT_PATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
cd $SCRIPT_PATH

# git 설정
git config core.filemode false # 깃이 퍼미션 변경을 추적하는 것을 끄기
git config --global user.name exizt
git config --global user.email e2xist@gmail.com
git config --global color.ui auto

## Customize
# '빈 화면'이 나타나는 시간. (단위: 초)(설정 - 전원 - 절전 - 빈 화면)
gsettings set org.gnome.desktop.session idle-delay 1800

# 빈 화면 활성화 후 화면을 잠그기 전의 시간. (단위: 초)(기본값: 0)
# (설정 - 개인정보 - 화면 잠금 - 자동 화면 잠금 지연 시간)
gsettings set org.gnome.desktop.screensaver lock-delay 1800


