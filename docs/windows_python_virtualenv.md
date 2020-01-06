# 윈도우 파이썬 가상 환경 

<https://github.com/pyenv-win/pyenv-win>

## 준비

### 다운로드

<https://github.com/pyenv-win/pyenv-win/archive/master.zip>

### 압축풀기

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

### 파이썬 설치

```bat
C:\> pyenv install 2.7.15
```

## 로컬 버전 선택

```bat
C:\Work> pyenv local 2.7.15
```

### 가상 환경 생성

```bat
C:\Work> pyenv exec Scripts\virtualenv .venv
New python executable in C:\Work\.venv\Scripts\python.exe
Installing setuptools, pip, wheel...
done.
```

## 가상 환경 시작

```bat
C:\Work> .venv\Scripts\activate

(.venv) C:\Work>
```

## 가상 환경 종료

```bat
(.venv) C:\Work> deactivate
C:\Work>
```
