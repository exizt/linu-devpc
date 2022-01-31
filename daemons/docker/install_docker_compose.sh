#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# [도커 컴포즈 설치 스크립트]
# 
# 아래 내용은, 공식 가이드를 따라가는 내용
# (https://docs.docker.com/compose/install/)
# 

echo "<< docker compose installation script >>"

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version