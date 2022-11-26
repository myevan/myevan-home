# 시놀로지 헬릭스 퍼포스 서버 인증 (Synology Helix Perforce Server Authentication) LDAP

<https://portal.perforce.com/s/article/2590>

## LDAP 서버 준비

* 패키지 센터 LDAP Server 설치
* LDAP Server 열기
* 설정 > LDAP 서버 활성화
* Provider 서버 정보 입력
    * FQDN: ldap.HOST.TLD
    * 패스워드 & 패스워드 확인 입력
* 인증 정보 확인
    * Base DN: dc=ldap,dc=HOST,dc=TLD
    * Bind DN: uid=root,dc=ldap,dc=HOST,dc=TLD

## LDAP 설정

```bat
> p4 ldap ldap.HOST.TLD
Name: ldap.HOST.TLD
Host: p4d.HOST.TLD
Port: 389
Encryption: tls
BindMethod: simple
SimplePattern: uid=%USER%,cn=users,dc=ldap,dc=HOST,dc=TLD
SearchScope: subtree
GroupSearchScope: subtree
```

## LDAP 테스트

```bat
> p4 ldap -t USER ldap.HOST.TLD
Enter password: 
Authentication successful.
```

## 인증 방식 변경

```bat
> p4 configure set auth.default.method=ldap
> p4 configure set auth.ldap.order.1=ldap.HOST.TLD
```

super user 는 perforce 인증 사용함

```bat
> p4 user -fo ADMIN
AuthMethod: perforce
```

## 관리 설정

### 퍼미션 설정

모든 유저는 디폴트 디포 리스트 확인만 가능

```bat
> p4 protect
list user * * //depot/...
```
### 유저 자동 생성 방지

<https://portal.perforce.com/s/article/2544>

관리자만 생성할 수 있도록 제한

```bat
> p4 configure set dm.user.noautocreate=2
```

### 유저 수동 생성

```bat
> p4 user -f NAME
User: NAME

Email: NAME@HOST

FullName: NAME

AuthMethod: ldap
```
