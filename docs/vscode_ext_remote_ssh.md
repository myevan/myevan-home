# 비주얼 스튜디오 코드 확장: 리모트 SSH (VisualStudioCode Extension: RemoteSSH)

## 준비

### 윈도우

RemoteSSH 에서는 OpenSSH 를 사용합니다.

```bat
C:\> ssh
usage: ssh [-46AaCfGgKkMNnqsTtVvXxYy] [-B bind_interface]
           [-b bind_address] [-c cipher_spec] [-D [bind_address:]port]
           [-E log_file] [-e escape_char] [-F configfile] [-I pkcs11]
           [-i identity_file] [-J [user@]host[:port]] [-L address]
           [-l login_name] [-m mac_spec] [-O ctl_cmd] [-o option] [-p port]
           [-Q query_option] [-R address] [-S ctl_path] [-W host:port]
           [-w local_tun[:remote_tun]] destination [command]
```

만약 ssh 가 없을 경우 아래와 같은 에러가 표시됩니다.

```
C:\Users\myevan>ssh
'ssh'은(는) 내부 또는 외부 명령, 실행할 수 있는 프로그램, 또는
배치 파일이 아닙니다.
```

OpenSSH 는 윈도우 버전 1809 이상부터 지원하므로 버전 확인이 필요합니다.
<https://docs.microsoft.com/ko-kr/windows-server/administration/openssh/openssh_install_firstuse>

```bat
C:\> winver
```

2020.05.16 기준 RemoteSSH 버그인해 SSH 설정 파일에 접근을 못 하는 이슈가 있습니다.
<https://github.com/microsoft/vscode-docs/issues/3210>

```
Bad Owner or Permissions on .ssh\config 
```

Settings > Extensions > Remote - SSH > Remote.SSH: Config File 에서 직접 경로 설정해주어야 합니다.
경로 구분자를 `\` 대신 `\\` 를 사용합니다.

```
C:\\Users\\USER_NAME\\.ssh\\config
```


