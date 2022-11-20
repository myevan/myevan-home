# 윈도우 파이썬 가상 환경 (Windows python virtual environment)

<https://github.com/pyenv-win/pyenv-win>

## 설치

### git

```bat
git clone https://github.com/pyenv-win/pyenv-win.git %USERPROFILE%\.pyenv
```

### zip

다운로드

<https://github.com/pyenv-win/pyenv-win/archive/master.zip>

압축풀기

```bat
%USERPROFILE%\.pyenv\pyenv-win
```

## 설정

### 환경 변수 변경

PATH

```bat
%USERPROFILE%\.pyenv\pyenv-win\bin
%USERPROFILE%\.pyenv\pyenv-win\shims
%USERPROFILE%\AppData\Local\Microsoft\WindowsApps
```

### 앱 설치 관리자 비활성화

Windows 11 | Windows 10 (1905 이상)

시작(Start) > 앱 실행 별칭(Manage App Execution Aliases)

* 앱 설치 관리자(App Installer): python 비활성화
* 앱 설치 관리자(App Installer): python3 비활성화

### 파이썬 설치

```bat
C:\> pyenv install 3.11.0
```

## 로컬 버전 선택

```bat
C:\Work> pyenv local 3.11.0
```

### 가상 환경 생성

```bat
if not exist %~dp0.venv (
    python -m venv %~dp0.venv
)
```

### 가상 환경 파이썬

```bat
%~dp0venv.bat python %*
```

### 가상 환경 패키지 매니저

```bat
%~dp0venv.bat python -m pip %*
```