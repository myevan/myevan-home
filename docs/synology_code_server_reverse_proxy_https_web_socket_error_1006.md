# 시놀로지 도커: 코드 서버 HTTPS 웹 소켓 에러 1006 (Synology Docker: CodeServer WebSocket Error 1006)

## 상황

* OS: Synology
* Docker: code-server 설치
* ReverseProxy: nginx https -> http 연동

```
An unexpected error occurred that requires a reload of this page.

The workbench failed to connect to the server (Error: WebSocket close with status code 1006)
```

## 분석

ReverseProxy 에서 WebSocket Support 활성화 필요

<https://github.com/coder/code-server/issues/4443>

## 대응

<https://mlohr.com/websockets-for-synology-dsm/>

* 제어판(ControlPanel) > 로그인 포털(LoginPortal) > 고급(Advanced) 탭 > 역방향 프록시 (ReverseProxy)
* 항목 선택 > 편집 버튼 > 사용자 지정 머리글(CustomHeaders Tab) > 생성: WebSocket
    * Name: `Upgrade` Value: `$http_upgrade`
    * Name: `Connection` Value: `$connection_upgrade`