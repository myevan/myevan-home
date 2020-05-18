# 맥 패키지 관리자: homebrew

<https://brew.sh/>

## 설치 Installation

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## 이슈 Issue

### Insecure completion-dependent directories detected

```
[oh-my-zsh] Insecure completion-dependent directories detected:
drwxrwxr-x  3 myevan  admin   96  5 19 07:11 /usr/local/share/zsh
drwxrwxr-x  4 myevan  admin  128  5 19 07:13 /usr/local/share/zsh/site-functions

[oh-my-zsh] For safety, we will not load completions from these directories until
[oh-my-zsh] you fix their permissions and ownership and restart zsh.
[oh-my-zsh] See the above list for directories with group or other writability.

[oh-my-zsh] To fix your permissions you can do so by disabling
[oh-my-zsh] the write permission of "group" and "others" and making sure that the
[oh-my-zsh] owner of these directories is either root or your current user.
[oh-my-zsh] The following command may help:
[oh-my-zsh]     compaudit | xargs chmod g-w,o-w

[oh-my-zsh] If the above didn't help or you want to skip the verification of
[oh-my-zsh] insecure directories you can set the variable ZSH_DISABLE_COMPFIX to
[oh-my-zsh] "true" before oh-my-zsh is sourced in your zshrc file.
```

<https://github.com/ohmyzsh/ohmyzsh/issues/6939>

#### 해법1 (Solution1)

~/.zshrc

```
ZSH_DISABLE_COMPFIX=true
```

#### 해법2 (Solution2)

```zsh
$ sudo chmod g-w /usr/local/share/zsh /usr/local/share/zsh/site-functions
$ sudo chmod o-w /usr/local/share/zsh /usr/local/share/zsh/site-functions
```