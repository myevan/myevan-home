# 맥 루트 유저 활성화 How to enable the root user on your mac

<https://support.apple.com/ko-kr/HT204012>

## 설정

* 시스템 환경 설정 > 사용자 및 그룹: 자물쇠 해제
* 로그인 옵션 > 네트워크 계정 서버 연결 > 디렉토리 유틸리티 열기: 자물쇠 해제
* 디렉토리 유틸리티 메인 메뉴 > 편집 > Root 사용자 활성화
* 루트 패스워드 입력

## 테스트

```bash
$ sudo whoami
Password: 루트 패스워드 입력
root
```
