# 헬릭스 윈도우 퍼포스 데몬 Helix Windows Perforce Daemon

## 실행하기 Run Daemon

### 스크립트

helix_p4d_run.bat

```bat
@echo off
IF NOT EXIST %~dp0bin  		    mkdir %~dp0bin
IF NOT EXIST %~dp0var  		    mkdir %~dp0var
IF NOT EXIST %~dp0data 		    mkdir %~dp0data

IF NOT EXIST %~dp0bin\p4d.exe 	powershell Invoke-WebRequest ftp://ftp.perforce.com/perforce/r16.2/bin.ntx64/p4d.exe -OutFile %~dp0bin\p4d.exe
IF NOT EXIST %~dp0data\db.*	    %~dp0bin\p4d.exe -r %~dp0data -L %~dp0var\log -J %~dp0var\journal -p 1666 -xi

%~dp0bin\p4d.exe -r %~dp0data -L %~dp0var\log -J %~dp0var\journal -p 1666 
```

### 사용 방법

```
C:\Repositories\helix> helix_p4d_run.bat
Perforce db files in 'C:\Repositories\helix\data' will be created if missing...
Server switched to Unicode mode.
Perforce db files in 'C:\Repositories\helix\data' will be created if missing...
Perforce Server starting...
```