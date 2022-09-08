#!/bin/bash
# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# 스크립트의 경로
SCRIPT_PATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

# 현재 경로로 이동
cd $SCRIPT_PATH

# 깃에서 퍼미션은 추적하지 않도록 설정
git config core.filemode false

# git 갱신
git pull

# 스크립트 실행 권한 부여
chmod 744 ./*.sh