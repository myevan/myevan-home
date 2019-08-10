# 우분투 파이썬 환경 따라하기 (ubuntu pyenv tutorial)

## 준비

pyenv 에 필요한 패키지들을 미리 설치합니다.

<https://github.com/pyenv/pyenv/wiki/Common-build-problems>

```bash
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
```

## 설치

pyenv 간편 설치 스크립트를 실행합니다.

<https://github.com/pyenv/pyenv-installer>

```bash
curl https://pyenv.run | bash
```

## 설정

pyenv 설정을 추가 합니다.

```bash
$ vim ~/.bashrc
export PATH="/home/myevan/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

터미널에 재접속하면 pyenv 를 사용할 수 있습니다.

## 파이썬 설치

```bash
$ pyenv install 3.6.2 
$ pyenv versions
$ pyenv shell 3.6.2
$ python
Python 3.6.2 (default, Aug 26 2017, 22:26:02) 
[GCC 4.2.1 Compatible Apple LLVM 8.1.0 (clang-802.0.42)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## 가상 환경 생성

```bash
$ pyenv virtualenv 3.6.2 test
```

## 가상 환경 시작

```bash
$ pyenv activate test
(test) $
```

## 가상 환경 종료

```bash
(test) $ source deactivate
$
```

## 가상 환경 제거

```bash
$ pyenv uninstall test
```
