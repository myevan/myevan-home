# 윈도우 파이썬 가상 환경 

## 준비

* [윈도우 패키지 관리자 설치](windows_package_management.md)
* 파이썬 설치

```bat
C:\> choco install python
```

* 가상 환경 설치

```bat
C:\> pip install virtualenv
```

## 생성 

```bat
C:\> virtualenv C:\VirtualEnvs\example
Using base prefix 'c:\\python36'
New python executable in C:\VirtualEnvs\example\Scripts\python.exe
Installing setuptools, pip, wheel...done.
```

## 시작

```bat
C:\> C:\VirtualEnvs\example\Scripts\activate
(example) C:\>
```

## 종료

```bat
(example) C:\> deactivate
C:\>
```