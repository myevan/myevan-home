# 깃 배쉬 프롬프트 요약 Git Bash Prompt

## 프롬프트 A

### 모양

#### git 저장소 외부

```bash
아이디@호스트:~/경로$
```

#### git 저장소 내부

```bash
아이디@호스트:~/경로(브랜치명)$
```

### 설정

`~/.bash_profile` 편집

```bash
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
local GREEN="\[\033[1;32m\]"
local WGRAY="\[\033[00m\]"

PS1="\u@\h:\w$GREEN\$(parse_git_branch)$WGRAY\$ "
PS2='> '
PS4='+ '
}
proml
```
