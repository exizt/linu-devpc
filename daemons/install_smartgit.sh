#!/bin/bash

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

wget -O /tmp/smartgit.deb https://www.syntevo.com/downloads/smartgit/smartgit-21_2_2.deb
sudo dpkg -i /tmp/smartgit.deb
sudo rm -f /tmp/smartgit.deb