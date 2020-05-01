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
C:\> pyenv install 3.6.8
```

## 로컬 버전 선택

```bat
C:\Work> pyenv local 3.6.8
```

### 가상 환경 생성

```bat
C:\Work> python -m venv venv
```

## 가상 환경 시작

```bat
C:\Work> venv\Scripts\activate

(venv) C:\Work>
```

## 가상 환경 종료

```bat
(venv) C:\Work> deactivate
C:\Work>
```
