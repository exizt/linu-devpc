#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# 스크립트의 경로
SCRIPT_PATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

# 기본적인 설정 스크립트 실행
cd $SCRIPT_PATH
bash ./set_base.sh

# 한국어 설정 스크립트 실행
cd $SCRIPT_PATH
bash ./set_korean.sh

# 커스터마이징 설정
cd $SCRIPT_PATH
bash ./customize.sh

