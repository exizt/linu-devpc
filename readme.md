# 개요

Castor Project
* 우분투 환경의 개발용 PC 셋업을 위한 스크립트와 설정등을 관리하기 위함.


프로젝트 코드명 Castor
* 의미 : 쌍둥이자리의 '카스토르 Castor', '폴룩스 (폴리데우케스) Pollux' 중 형.
* 윈도우 환경과 리눅스 환경을 분리하는 중이기 때문에, 하나는 '폴리데우케스'로 가정하고, 하나는 '카스토르'로 가정.



# 구성
customize : 내 환경에 맞추는 부분


# 우분투 설치 직후 할 일 
1. 업데이트 경로
소프트웨어 & 업데이트로 진입해서, '다운로드 위치 (사용하는 원격 코드 저장소를 의미)'를 확인한다. 좀 더 빠를 곳으로 변경해준다. 기본값인 ('kr.archive.ubuntu.com'의 속도가 매우 느리다) 카카오서버로 변경해준다.

2. ssh keygen 생성
```
ssh-keygen
```
해당키는 github등에서 등록/설정해야 private git 이용 가능.

# 사용
```
sudo apt update && sudo apt upgrade -y
sudo apt install git
git clone git@github.com:exizt/castor-my-dev-pc.git
```

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
