# 맥 OS 13 벤츄라 SSH 작동 권한 (macOS 13 Ventura ssh operation not permitted)

## 상황

```bash
ssh myevan@mac-mini
myevan@mac-mini % cd /Volumes/Ext
myevan@mac-mini Ext % ls
ls: .: Operation not permitted
```

## 분석

<https://superuser.com/questions/1615072/getting-an-operation-not-permitted-error-when-running-commands-after-to-sshing>

sshd 개인 정보 보호 - 전체 디스크 접근 권한 필요

## 대응

설정 > 개인정보 보호 및 보안(Security & Privacy) > 개인정보 보호(Privacy) > 전체 디스크 접근 권한(Full Disk Access)

sshd-keygen-wrapper 활성화