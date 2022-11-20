# 우분투 pyenv 에러: SSH 인라인 .bashrc 작동 안 함 (ubuntu ssh inline .bashrc not working)

## 상황

환경 변수 PATH 경로 추가

```bash
$ vim ~/.bashrc
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

SSH 인라인 실행시 .bashrc 적용 안 됨

```bash
$ ssh user@host "env"
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

## 분석

<https://stackoverflow.com/questions/62931832/how-to-source-bashrc-when-ssh-send-command-to-remote>

인터랙티브 모드가 아니면 실행 안 하는 로직이 있음

```bash
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
```

## 대응

인터랙티브 모드 판단 이전에 pyenv 환경 변수 등록하도록 변경