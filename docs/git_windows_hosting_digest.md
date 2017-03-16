# 윈도우 Git 호스팅 요약

<http://aspiringcraftsman.com/2012/02/20/hosting-a-git-repository-in-windows/>

GitHub 에서 매번 클론하는 것은 시간이 오래걸립니다. 미러 저장소를 한번 만들어두면 빠르게 클론할 수 있습니다.

## 미러 Mirror

GitHub 에서 저장소를 미러로 클론합니다.
    :::bat
    md C:\Repositories\git
    cd C:\Repositories\git
    git clone --mirror https://github.com/소유자/프로젝트

기존에 이미 받아놓은 로컬 저장소가 있다면 미러 클론 후 설정을 변경합니다

    :::bat
    git clone --mirror C:\기존_프로젝트 C:\Repositories\git

C:\Repositories\git\프로젝트\config 
    
    :::diff     
    [remote "origin"]
    -    url = C:/기존_프로젝트
    +    url = https://github.com/소유자/프로젝트
    fetch = +refs/*:refs/*
    mirror = true

미러는 주기적으로 최신으로 업데이트해줍니다

    :::bat
    cd C:\Repositories\git\프로젝트
    git remote update

미러 저장소를 사용해 [Git 호스팅](git_windows_hosting_digest.md)을 구축하면 git 프로토콜을 사용해 네트워크 접근이 가능합니다.

    :::bat
    git clone git://localhost/프로젝트 C:\프로젝트

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

