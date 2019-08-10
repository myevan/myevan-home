# 우분투 git 설정 (ubuntu git config)

## 유저 (user)

```bash
$ git config --global user.name "이름"
$ git config --global user.email "아이디@도메인"
```

## 에디터 (editor)

```bash
$ git config --global core.editor vim
```

## 크레덴셜 (credential)

```bash
$ git config --global credential.helper store
```

## 풀 리베이스 (pull rebase)

```bash
$ git config --global pull.rebase true
```
