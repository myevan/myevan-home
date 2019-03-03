# 맥 파이썬 환경 따라하기

## 설치 

[Homebrew](/mac_package_mgr_homebrew.md) 와 [Xcode 커맨드라인 도구](/mac_xcode_command_line.md)가 필요합니다

```bash
$ brew install pyenv
$ brew install pyenv-virtualenv
```

bash profile 에 pyenv 설정을 추가합니다.

```bash
$ vim ~/.bash_profile
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

터미널에 재접속한 다음 원하는 파이썬 버전을 설치합니다.

## 특정 버전 설치

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
$ pyenv activate test
(test) $
```
