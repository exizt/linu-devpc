#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

### 한국어 설정
# 한국어 언어셋 설치
sudo apt-get install language-pack-ko language-pack-gnome-ko language-pack-ko-base language-pack-gnome-ko-base

# 기본 언어 설정 변경
sudo update-locale LANG=ko_KR.UTF8

### 한글 키보드 설정
# ibus 설치, 폰트 설치
sudo apt-get install -y ibus-hangul fonts-noto-cjk-extra

# 키 입력 순서 지정
gsettings set org.gnome.desktop.input-sources sources "[('ibus', 'hangul'), ('xkb', 'us')]"

## 참고) 여기까지 하고, 이상이 있을 수 있으니, 
## '설정 - 지역 및 언어 - 설치된 언어 관리'를 눌러서 남은 업데이트를 해주도록 한다.
## 로그아웃 후 로그인을 하면 한글로 변경되어 있음.
