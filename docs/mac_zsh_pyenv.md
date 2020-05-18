# 맥 zsh 파이썬 환경 (mac zsh pyenv)

## 준비

pyenv 를 사용하기 위해서는 [Homebrew](/mac_package_mgr_homebrew) 와 [Xcode 커맨드라인 도구](/mac_xcode_command_line)가 필요합니다

## 설치 

brew 를 통해 pyenv 를 설치합니다.

```bash
$ brew install pyenv
```

## 설정

pyenv 설정을 ~/.zshrc 에 추가 합니다.

```zsh
$ vim ~/.bashrc
eval "$(pyenv init -)"
```

터미널에 재접속하면 pyenv 를 사용할 수 있습니다.

## 파이썬 설치

```zsh
$ pyenv install 3.6.9
```

## 파이썬 버전 확인

```zsh
$ pyenv versions
```

## 로컬 버전 선택

```zsh
$ pyenv local 3.6.9
```

## 가상 환경 생성 

```zsh
$ python -m venv venv
```

## 가상 환경 실행

```zsh
$ venv/bin/python
```

## 가상 환경 패키지 

```zsh
$ venv/bin/pip
```

## 가상 환경 입장

```zsh
$ pyenv activate venv
(venv) $
```

## 가상 환경 종료

```zsh
(venv) $ source deactivate
$
```

## 가상 환경 제거

```zsh
$ pyenv uninstall venv
```
