# 윈도우 Git 호스팅 요약

<http://aspiringcraftsman.com/2012/02/20/hosting-a-git-repository-in-windows/>

### 데몬 Daemon

C:\Repositories\git\gitd.bat

    :::bat
    @echo off
    "C:\Program Files\Git\bin\git.exe" daemon --reuseaddr --base-path=%~dp0 --export-all --enable=receive-pack

로컬 테스트

    git clone git://localhost/저장소
 

### 서비스 Service

[서비스 등록 앱](https://github.com/derekgreer/serviceRunner)을 빌드한 다음 서비스 관리 배치 파일을 작성합니다.

`C:\Repositories\git\gitd_service_create.bat`

    :::bat
    @echo off
    sc.exe create "GitDaemon" binpath="%~dp0\ServiceRunner.exe %~dp0\gitd.bat" start=auto
    pause

`C:\Repositories\git\gitd_service_start.bat`

    :::bat
    @echo off
    sc.exe start "GitDaemon"
    pause

`C:\Repositories\git\gitd_service_stop.bat`

    :::bat
    @echo off
    sc.exe stop "GitDaemon"
    pause

`C:\Repositories\git\gitd_service_delete.bat`

    :::bat
    @echo off
    sc.exe delete "GitDaemon"
    pause

관리자 권한으로 서비스 관리 배치 파일을 실행합니다.

