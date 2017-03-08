# 언리얼 엔진 따라하기

## GitHub 연동 Connecting

* [GitHub 계정 생성](https://github.com/)
* [에픽 게임즈 계정 생성](https://docs.unrealengine.com/latest/KOR/GettingStarted/Installation/index.html#bookmark1>)
* 에픽 게임즈 개인 > [개인 정보](https://www.unrealengine.com/dashboard/settings) > GITHUB 계정 이름 (이메일 말고)에 GitHub 계정 입력 
* GitHub 로그인 후 [에픽 게임즈 언리얼 저장소](https://github.com/epicgames/unrealengine/) 이동

## Git 윈도우 미러 WindowsMirror

GitHub 에서 저장소 클론하는 것은 시간이 오래걸리므로 미러 저장소를 만들어 둡니다

    :::bat
    md C:\Repositories\git
    cd C:\Repositories\git
    git clone --mirror https://github.com/EpicGames/UnrealEngine

기존에 이미 받아놓은 로컬 저장소가 있다면 미러 클론 후 설정을 변경합니다

    :::bat
    git clone --mirror C:\UnrealEngine C:\Repositories\git

C:\Repositories\git\UnrealEngine\config 
    
    :::diff     
    [remote "origin"]
    -    url = C:/UnrealEngine
    +    url = https://github.com/EpicGames/UnrealEngine
    fetch = +refs/*:refs/*
    mirror = true

미러는 주기적으로 최신으로 업데이트해줍니다

    :::bat
    cd C:\Repositories\git\UnrealEngine
    git remote update

[미러 호스팅](windows_git_hosting.md)하면 외부에서도 접근 가능합니다

    
