# 언리얼 엔진 빌드 따라하기

## 비주얼 스튜디오 설치 InstallVisualStudio

[Visual Studio 2015 를 다운로드](vs2015_download_digest.md)받은 후 사용자 정의 설치를 진행합니다.

* Visual C++
* Visual C#
* Android SDK
* Git for Windows

## 깃허브 연동 ConnectGitHub

* [GitHub 계정 생성](https://github.com/)
* [에픽 게임즈 계정 생성](https://docs.unrealengine.com/latest/KOR/GettingStarted/Installation/index.html#bookmark1>)
* 에픽 게임즈 개인 > [개인 정보](https://www.unrealengine.com/dashboard/settings) > GITHUB 계정 이름 (이메일 말고)에 GitHub 계정 입력 
* GitHub 로그인 후 [에픽 게임즈 언리얼 저장소](https://github.com/epicgames/unrealengine/) 이동

## 깃허브 클론 CloneGitHub

```bat
md C:\EpicGames
cd C:\EpicGames
git clone https://github.com/EpicGames/UnrealEngine C:\EpicGames\UE_4.git
```

## 프로젝트 준비 PrepareProject

* [언리얼 비주얼 스튜디오 셋업](ue4_windows_vs_setup_digest.md) 
* [언리얼 엔진 셋업 스크립트](ue4_setup_script_analysis.md) 실행

```bat
cd C:\EpicGames\UE_4.git
Setup.bat
```

## 프로젝트 빌드 BuildProject

<https://docs.unrealengine.com/latest/KOR/Programming/Development/BuildingUnrealEngine/index.html>

비주얼 스튜디오 프로젝트를 생성합니다.

    :::bat
    cd C:\UnrealEngine
    GenerateProjectFiles.bat

 UE4.sln 을 오픈합니다.
