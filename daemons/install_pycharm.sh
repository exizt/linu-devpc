#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# https://www.jetbrains.com/ko-kr/pycharm/download/#section=linux

sudo snap install pycharm-community --classic