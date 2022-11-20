# 윈도우 WSL2 우분투 22 (Windows WSL2 ubuntu 22)

## 설치 에러: 0x800701bc

### 상황

```
Installing, this may take a few minutes...
WslRegisterDistribution failed with error: 0x800701bc
``` 

## 분석

<https://github.com/microsoft/WSL/issues/5393>

리눅스 커널 업데이트 패키지 설치 필요

## 대응

<https://learn.microsoft.com/ko-kr/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package>