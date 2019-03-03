# 깃랩 우분투 설치 따라하기 GitLab Ubuntu Installation

<https://about.gitlab.com/downloads/#ubuntu1404>

가상 머신에 우분투를 설치합니다.

* 코어: 1
* 메모리: 4096MB
* 스토리지: 512GB
* 게스트 OS: `Ubuntu-x64-14.04`
* 호스트 OS:
    * [Hyper-V 우분투 설치 따라하기](hyper_v_ubuntu_installation_tutorial)


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

깃랩 패키지를 추가합니다.

```bash
$ curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
```

깃랩 패키지를 설치합니다.
```bash
$ sudo apt-get install gitlab-ce
```


설정 파일을 편집합니다

```
$ sudo vim /etc/gitlab/gitlab.rb
```

깃 스웜 사이트 주소를 설정합니다. 도메인 주소가 없으면 IP 로 설정해도 무방합니다.

```ruby
external_url "http://gitlab.example.com"
```

HTTP 80 포트를 사용할 수 없다면 다른 포트를 지정할 수 있습니다.

```ruby
external_url "http://gitlab.example.com:8888"
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

HTTP 를 통한 대용량 푸쉬를 지원하기 위해서는 nginx 설정 수정이 필요합니다.

```ruby
nginx['client_max_body_size']  = '0m'
nginx['proxy_read_timeout']    = 1000
nginx['proxy_connect_timeout'] = 1000
```

LDAP 을 통한 로그인 설정도 가능합니다.

```ruby
## For setting up LDAP
## see https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/README.md#setting-up-ldap-sign-in
## Be careful not to break the identation in the ldap_servers block. It is in
## yaml format and the spaces must be retained. Using tabs will not work.

gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = YAML.load <<-'EOS' # remember to close this block with 'EOS' below
   main: # 'main' is the GitLab 'provider ID' of this LDAP server
     label: 'LDAP'
     host: 'LDAP 서버 주소'
     port: LDAP 서버 포트
     uid: 'LDAP 유저 아이디 속성'
     method: 'plain' # "tls" or "ssl" or "plain"
     bind_dn: 'LDAP 바인드 DN'
     password: 'LDAP 패스워드'
     active_directory: false
     allow_username_or_email_login: true
     block_auto_created_users: false
     base: 'LDAP 베이스 DN'
     user_filter: ''
     attributes:
       username: ['uid', 'userid', 'sAMAccountName']
       email:    ['mail', 'email', 'userPrincipalName']
       name:       'cn'
       first_name: 'givenName'
       last_name:  'sn'
     ## EE only
     group_base: ''
     admin_group: ''
     sync_ssh_keys: false
EOS
```

설정 파일을 저장한 다음 재설정을 실행합니다.

```bash
$ sudo gitlab-ctl reconfigure
```

깃 랩 사이트에 접속하면 root 계정 패스워드를 설정할 수 있습니다.

<http://gitlab.example.com>
