# 우분투 노드JS (ubuntu node.js)

## 준비 (Requirements)

[도커](/ubuntu_docker)가 필요합니다.

## 설치 (Installation)

<https://hub.docker.com/_/node/>

```bash
$ sudo docker pull node
```

## 사용 (HowToUse)

<https://github.com/nodejs/docker-node/blob/master/README.md#how-to-use-this-image>

## REPL 터미널 (Terminal)

```bash
$ sudo docker run -it --rm -v "$PWD":/usr/src/app -w /usr/src/app node node
Welcome to Node.js v12.8.0.
Type ".help" for more information.
> 
```

## 스크립트 실행 (Run a single script)

```bash
$ sudo docker run -it --rm --name MY-RUNNING-SCRIPT -v "$PWD":/usr/src/app -w /usr/src/app node node YOUR-DAEMON-OR-SCRIPT.js
```
