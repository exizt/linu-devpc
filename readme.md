# Linu 프로젝트 개요

Project "Linu"
* 리눅스 기반에서 '개발 환경'을 구성하기 위한 스크립트와 설정 등을 관리하는 프로젝트.
* '내 메인 PC', '회사 PC', '노트북 PC' 등에서 동일한 '개발 환경'을 구현하거나 지원할 수 있도록, 스크립트화하는 프로젝트이다.

<br><br>


# 우분투 설치 직후
1. ssh keygen 생성
```shell
ssh-keygen
```
해당키는 github등에서 등록/설정해야 private git 이용 가능.


2. shoon 유저가 필요하다. 다음의 스크립트로 유저를 추가해주거나, 우분투의 설정을 통해서 사용자를 추가한다.
```shell
# shoon 유저 추가
adduser shoon
```

3. git 설치 및 linu프로젝트 내려받기(clone)

git 설치
```shell
su - root
sudo apt update && sudo apt upgrade -y
sudo apt install git
```


프로젝트 내려받기
```shell
su - shoon

cd /d2/dev/pcs


# 저장소 내려받기
git clone git@github.com:exizt/castor-my-dev-pc.git

# 깃이 퍼미션 변경을 추적하는 것을 끄기
git config core.filemode false
```


# 스크립트 실행
## 스크립트 실행 권한 부여
```shell
su - shoon
cd /d2/dev/pcs/cator

chmod 744 ./customize/*
```


## 스크립트 실행 순서
(1) `run.sh` 실행 (가장 먼저 실행되야 함)
```
./customize/run.sh
```
`run.sh` 설명
* 우분투 저장소 경로를 kakao.com으로 변경
* vim, git 설치
* git config 설정
* 유저 shoon에 대한 설정


(2) `korean.sh` 실행 (한국어 설정)
```
./customize/korean.sh
```
`korean.sh`에 대한 설명
* 한국어 설정 및 한국어 키보드 설정 등


(3) `utils.sh` 실행 (기본 무료 유틸들 설치)
```
./customize/utils.sh
```
`utils` 설명
* meld, rabbitvcs, filezilla, dbeaver 설치 



# 구성
* customize : 내 환경에 맞추는 부분
* daemons : 유틸리티 등 


# 문제 해결
## Waiting for cache lock
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend.
```
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*

sudo dpkg --configure -a
sudo apt update
```
