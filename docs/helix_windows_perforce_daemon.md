# 헬릭스 윈도우 퍼포스 데몬 (Helix Windows Perforce Daemon)

## 데몬 시작하기 (Start Daemon)

<https://github.com/myevan/cli-helix/blob/master/cli_p4d_run.bat>

```bat
@echo off
IF NOT EXIST %~dp0bin  		    mkdir %~dp0bin
IF NOT EXIST %~dp0var  		    mkdir %~dp0var
IF NOT EXIST %~dp0data 		    mkdir %~dp0data

IF NOT EXIST %~dp0bin\p4d.exe 	powershell Invoke-WebRequest ftp://ftp.perforce.com/perforce/r16.2/bin.ntx64/p4d.exe -OutFile %~dp0bin\p4d.exe
IF NOT EXIST %~dp0data\db.*	    %~dp0bin\p4d.exe -r %~dp0data -L %~dp0var\log -J %~dp0var\journal -p 1666 -xi

%~dp0bin\p4d.exe -r %~dp0data -L %~dp0var\log -J %~dp0var\journal -p 1666 
```

사용 방법

```bat
C:\Helix> cli_p4d_run.bat
C:\Helix> helix_p4d_run.bat
Server switched to Unicode mode.
Perforce Server starting...
```

## 데몬 정지하기 (Stop Daemon)

cli_p4.bat

```bat
@echo off
IF NOT EXIST %~dp0bin\p4.exe 	powershell Invoke-WebRequest ftp://ftp.perforce.com/perforce/r16.2/bin.ntx6/p4d.exe -OutFile %~dp0bin\p4.exe

%~dp0bin\p4.exe %* 
```

사용 방법

```bat
C:\Helix> cli_p4.bat -p localhost:1666 stop
```