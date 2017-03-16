# 우분투 깃 스웜 설치 따라하기 GitSwarm Installation Ubuntu

<https://www.perforce.com/perforce/doc.current/manuals/gitswarm/install/installation.html>

[요구 사항](gitswarm_requirements_digest.md)을 확인합니다.

* 가상머신: OS X + VMWare Fusion 8
* 코어: 4개
* 메모리: 5120MB
* 스토리지: 8GB+
* 운영체제: Ubuntu-x64-14.04

호스트 머신 IP 를 고정 IP로 설정하고 도메인 관리 서버에 등록합니다.

* [VM 웨어 퓨전 8 정적 IP 요약](vmware_fusion_8_static_ip_digest.md)

운영체제 패키지들을 최신으로 업데이트합니다.

```bash
$ sudo apt-get update
$ sudo apt-get upgrade
```

메일 패키지를 설치합니다.

```bash
$ sudo apt-get install postfix curl
```

Postfix Configruation 에서 mail configuration 은 Internet Site 을 선택하고 system mail name 은 메일 도메인 이름을 적당히 입력합니다.

빠른 설치를 시작합니다.

```bash
$ curl -s https://package.perforce.com/bootstrap/gitswarm.sh | sudo sh -
```

설정 파일을 편집합니다

```
$ sudo vim /etc/gitswarm/gitswarm.rb
```

깃 스웜 사이트 주소를 설정합니다. 도메인 주소가 없으면 IP 로 설정해도 무방합니다.

```ruby
external_url "http://gitswarm.example.com"
```

HTTP 80 포트를 사용할 수 없다면 다른 포트를 지정할 수 있습니다.

```ruby
external_url "http://gitswarm.example.com:8888"
```

[타임 존](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)을 설정합니다. 

```ruby
gitlab_rails['time_zone'] = 'Asia/Seoul'
```

SSH 22 포트를 사용할 수 없다면 다른 포트를 지정할 수 있습니다.

```ruby
gitlab_rails['gitlab_shell_ssh_port'] = 2222
```

유니콘 워커 숫자를 설정합니다.

```ruby
unicorn['worker_timeout'] = 600
unicorn['worker_processes'] = 5
```

설정 파일을 저장한 다음 재설정을 실행합니다.

```bash
$ sudo gitswarm-ctl reconfigure
```

외부에서 가상 머신에 접속하기 위해서는 [포트 포워딩]이 필요합니다.

* [VM 웨어 퓨전 8 포트 포워딩 요약](vmware_fusion_8_port_forwarding_digest.md)

깃 스웜 사이트에 접속하면 root 계정 패스워드를 설정할 수 있습니다.

<http://gitswarm.example.com>