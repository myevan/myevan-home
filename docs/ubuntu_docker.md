# 우분투 도커 (ubuntu docker)

<https://docs.docker.com/install/linux/docker-ce/ubuntu/>

## 준비 (Requirements)

apt 패키지 인덱스를 업데이트 합니다.

```bash
$ sudo apt-get update
```

apt HTTPS 저장소 사용을 위한 패키지들을 설치합니다.

```bash
$ sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

도커 공식 GPG 키를 추가합니다.

```bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

핑거프린트를 확인합니다.

```bash
$ sudo apt-key fingerprint 0EBFCD88
```

플랫폼에 맞는 저장소를 추가합니다.

```bash
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

## 설치 (Installation)

apt 패키지 인덱스를 업데이트 합니다.

```bash
$ sudo apt-get update
```

최신 도커 엔진을 설치합니다.

```bash
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

도커 버전을 확인합니다.

```bash
$ sudo docker version
```

권한 에러가 발생한다면 [sudo 권한](/ubuntu_sudo)을 추가한 다음 재시도 합니다.
