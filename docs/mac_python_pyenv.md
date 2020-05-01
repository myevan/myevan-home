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
$ pyenv install 3.6.8
$ pyenv versions
$ pyenv shell 3.6.8
```

## 로컬 버전 선택

```bash
$ pyenv local 3.6.8
```

## 가상 환경 생성 

```bash
$ python -m venv venv
```

## 가상 환경 실행

```bash
$ venv/bin/python
```

## 가상 환경 패키지 

```bash
$ venv/bin/pip
```

## 가상 환경 입장

```bash
$ pyenv activate venv
(venv) $
```

## 가상 환경 종료

```bash
(venv) $ source deactivate
$
```

## 가상 환경 제거

```bash
$ pyenv uninstall venv
```
