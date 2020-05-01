# 맥 파이썬 가상 환경 랩퍼 (Python Virtualenv Wrapper on Mac)

**DEPRECATED: [pyenv](/mac_python_pyenv)을 추천합니다.**

<http://blog.naver.com/ez_?Redirect=Log&logNo=140138625021&from=postView>

## 준비

[맥 루트 유저 활성화](/mac_root_enable)

## 설치

pip 로 virtualenvwrapper 를 설치합니다.

```bash
$ sudo easy_install pip
$ sudo pip install virtualenvwrapper
```

bash 프로파일을 설정합니다.

```bash
$ vim ~/.bash_profile
# python virtualenv
export WORKON_HOME=~/VirtualEnvs
source /usr/local/bin/virtualenvwrapper.sh
```

터미널을 재시작합니다.
