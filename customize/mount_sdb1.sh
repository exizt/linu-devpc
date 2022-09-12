#!/bin/bash
# ===========================================
# 우분투 추가 디스크(드라이브) 마운트 스크립트.
# 
#        File : mount_sdb1.sh
#       Usage : mount_sdb1.sh [destination path]
# Description : 마운트를 조금 편리하게 하려고 스크립트화한 것임.
#   Arguments :
#       - destination path : sdb1이 마운트될 경로
# ===========================================

# bash handling
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# 파라미터가 없는 경우는 실행하지 않도록 함. (파라미터는 목적 경로)
if [ "$#" -lt 1 ]; then
    SCRIPT_NAME=$(basename "$0")
    echo "[$SCRIPT_NAME] Parameters are required."
    exit 1
fi

DEST_PATH=$1


# 1. sdb의 파티션 생성하기
# 'sdb1'이 생성된다.
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk /dev/sdb
  o # clear the in memory partition table
  n # new partition
  p # primary partition
  1 # partition number 1
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
  p # print the in-memory partition table
  w # write the partition table
  q # and we're done
EOF


# 2. sdb1 파티션 포멧
mkfs.ext4 /dev/sdb1



# 3. 경로 생성 및 마운트하기
sudo mkdir $DEST_PATH
sudo mount /dev/sdb1 $DEST_PATH


# 4. 부팅시 자동 마운트 설정하기
# fstab 에서 다음을 추가
# vi /etc/fstab
# /dev/sdb1 /test ext4 defaults 0 0
echo "/dev/sdb1 $DEST_PATH ext4 defaults 0 0" | sudo tee -a /etc/fstab
