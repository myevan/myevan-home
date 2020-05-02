# 헬릭스 윈도우 퍼포스 서비스 요약 Perforce Service

<https://www.perforce.com/perforce/r10.2/manuals/p4sag/08_nt.html>

helix_p4d_service.bat

```bat
@echo off
IF NOT EXIST %~dp0bin  		    mkdir %~dp0bin
IF NOT EXIST %~dp0bin\p4d.exe 	powershell Invoke-WebRequest ftp://ftp.perforce.com/perforce/r16.2/bin.ntx64/p4d.exe -OutFile %~dp0bin\p4d.exe
IF NOT EXIST %~dp0bin\p4s.exe   copy %~dp0bin\p4d.exe %~dp0bin\p4s.exe 
  	
```