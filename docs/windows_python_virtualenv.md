# 윈도우 파이썬 가상 환경 

## 가상 환경 준비

```bat
C:\> pip install virtualenv
```

## 가상 환경 생성 

```bat
C:\> virtualenv C:\VirtualEnvs\example
Using base prefix 'c:\\python36'
New python executable in C:\VirtualEnvs\example\Scripts\python.exe
Installing setuptools, pip, wheel...done.
```

## 가상 환경 시작

```bat
C:\> C:\VirtualEnvs\example\Scripts\activate
(example) C:\>
```

## 가상 환경 종료

```bat
(example) C:\> deactivate
C:\>
```