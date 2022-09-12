#!/bin/bash
# ===========================================
# 도커 저장 경로를 변경하는 스크립트.
# 
#        File : docker_save_path.sh
#       Usage : docker_save_path.sh [d1|d2]
# Description : 도커 저장 경로를 `/d1/data/docker`로 변경
#   Arguments :
#       - path : d1|d2
# ===========================================
# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# 파라미터가 없는 경우는 실행하지 않도록 함. (파라미터는 목적 경로)
if [ "$#" -lt 1 ]; then
    SCRIPT_NAME=$(basename "$0")
    echo "[$SCRIPT_NAME] Parameters are required."
    exit 1
fi

if [ "$1" != "d1" ] && [ "$1" != "d2" ]; then
    SCRIPT_NAME=$(basename "$0")
    echo "[$SCRIPT_NAME] invalid."
    exit 1
fi

DATA_ROOT="/${1}/data/docker"

sudo service docker stop

# sudo mkdir /d1/data/docker
# sudo chmod 710 /d1/data/docker
sudo mkdir $DATA_ROOT
sudo chmod 710 $DATA_ROOT

# `/etc/docker/daemon.json`에 `{ "data-root": "/d1/data/docker" }`을 추가함.
# sudo echo -e "{\n    \"data-root\": \"$DATA_ROOT\" \n}" > /etc/docker/daemon.json
echo -e "{\n    \"data-root\": \"$DATA_ROOT\" \n}" | sudo tee /etc/docker/daemon.json

sudo service docker start
