# 1. Linu 프로젝트 개요

Project "Linu"
* 리눅스 기반에서 '개발 환경'을 구성하기 위한 스크립트와 설정 등을 관리하는 프로젝트.
* '내 메인 PC', '회사 PC', '노트북 PC' 등에서 동일한 '개발 환경'을 구현하거나 지원할 수 있도록, 스크립트화하는 프로젝트이다.

<br><br>


# 2. 저장소 내려받기
## 2.1. ssh keygen 생성 및 등록
```shell
# 키 생성하기
ssh-keygen
```
- 해당키는 `github`등에서 등록/설정해야 private git 이용 가능.
- `~/.ssh/id_rsa.pub`에서 값을 복사. 
- `github`에서 `settings` - `SSH and GPG keys` - `New SSH key` 클릭
- 명칭은 `username@MainPC-VM-Test-20220908`, `username@Laptop-xx-20220908` 같은 형태로.


## 2.2. 사전 작업
`/home/d1`을 이용시
```shell
# 디렉토리 생성 및 심볼릭 링크 생성
sudo mkdir /home/d1
sudo ln -s /home/d1 /d1

# 하위 디렉토리 생성
sudo mkdir /d1/data
sudo mkdir /d1/dev
sudo chown exizt:exizt /d1/dev
```

`/d2`을 이용시
```shell
# 하위 디렉토리 생성
sudo mkdir /d2/data
sudo mkdir /d2/dev
sudo chown exizt:exizt /d2/dev
```

## 2.3. git 설치 및 linu프로젝트 내려받기 (clone)
```shell
mkdir /d1/dev/pcs
# 또는
mkdir /d2/dev/pcs

# git 설치
sudo apt update -y
sudo apt install -y git

# 저장소 내려받기
git clone git@github.com:exizt/linu-devpc.git
```


```shell
# 시스템적으로만 사용되는 유저 shoon 생성
sudo adduer --system shoon


# shoon 유저 추가
adduser shoon

# shoon에 sudo 권한 부여하기
sudo usermod -aG sudo shoon

# www-data 그룹에 shoon 유저 추가하기
sudo usermod -a -G www-data shoon
```

# 3. 스크립트 실행

스크립트 목록
- `customize`
    - `1.base.sh` : 우분투 저장소 경로를 `kakao.com`으로 변경. `vim`, `git` 설치
    - `2.set_korean.sh` : 한글 설정 관련 (한국어 설정, 한국어 키보드 설정 등)
    - `customize.sh` : `git config`설정, 빈화면/자동 화면 잠금 시간 설정 (각 30분씩)
    - `mount_sdb1.sh` : `sdb1`을 마운트할 경우에 사용.


## 3.1. d2 마운트 (필요시)
```shell
./customize/mount_sdb1.sh /d2

sudo chown shoon:shoon d2
mkdir /d2/dev
```


## 3.2. 유틸, 데몬 설치
기본적인 유틸 설치
```shell
./daemons/install_utils.sh
```
`utils` 설명
* meld, rabbitvcs, filezilla, dbeaver 설치 

### 3.2.1 그 외의 유틸
smartgit
vscode
docker


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

# 메모
```shell
./customize/1.bash.sh
./customize/2.set_korean.sh
./customize/customize.sh

```