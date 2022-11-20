# 윈도우 11 탐색기 컨텍스트 메뉴 클래식 (Windows 11 Explorer Context Menu Classica

## 레지스트리 (Registry)

현재 유저 설정 추tco77


```bat
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```

## 탐색기 재시작 (Explorer Restart)

```bat
taskkill /f /im explorer.exe
explorer.exe
```