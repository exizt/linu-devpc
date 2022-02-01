#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# https://code.visualstudio.com/docs/setup/linux
# 패키지 저장소를 추가
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# 설치
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders


# 설치가 완료된 후에는, 설정 동기화를 할 것.