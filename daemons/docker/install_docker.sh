#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# [도커 설치 스크립트]
# 
# 아래 내용은, 공식 가이드를 따라가는 내용
# (https://docs.docker.com/engine/install/ubuntu/)
# 

echo "<< docker installation script >>"

# 이전의 설치된 것을 삭제함. (이따금 이 부분을 안 했을 때 복잡한 문제가 발생할 수 있어서 해야함)
sudo apt-get remove docker docker-engine docker.io containerd runc

# 라이브러리들 미리 업데이트 해놓고..
sudo apt-get update

echo "[apt update] have been finished."

# 본격적인 설치가 진행
# tzdata를 설치하다가 지역을 설정하라고 뜨므로 'DEBIAN_FRONTEND=noninteractive'을 추가함.
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "[ca-certificates curl gnupg lsb-release] have been installed."

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "[docker pgp] have been set."

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "docker installation have been successfully worked."

# 설치가 완료되었는지 확인할 때에는
# `service docker status`로 확인해볼 수 있다.
