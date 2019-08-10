# 맥 파이썬 환경 따라하기

## 준비

pyenv 를 사용하기 위해서는 [Homebrew](/mac_package_mgr_homebrew) 와 [Xcode 커맨드라인 도구](/mac_xcode_command_line)가 필요합니다

## 설치 

brew 를 통해 pyenv 와 pyenv-virtualenv 를 설치합니다.

```bash
$ brew install pyenv
$ brew install pyenv-virtualenv
```

## 설정

pyenv 설정을 ~/.bashrc 에 추가 합니다.

```bash
$ vim ~/.bashrc
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
