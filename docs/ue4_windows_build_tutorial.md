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

UE4.sln 을 열어 **Development Editor** 를 빌드합니다.

## 에디터 실행 RunEditor

에디터 실행 파일이 잘 안 보이는 곳에 위치하고 있기 때문에 배치 파일을 만들어 주면 편리합니다.

`C:\EpicGames\UE_4.git\_RunEditor.bat`

```bat
@echo off
start %~dp0Engine\Binaries\Win64\UE4Editor.exe
```


## 엔진 재등록 Re-RegisterEngine

엔진 소스 경로를 변경하게 되면 .uproject 와의 연결이 끊어집니다. 재연결을 하기 위해서는 Setup.bat 를 실행해도 되지만 여러가지 절차를 수행하기 때문에 재등록 과정만 배치 파일로 만들어 주면 빠르게 엔진을 재등록 할 수 있습니다.

`C:\EpicGames\UE_4.git\Build\BatchFiles\_RegisterEngine.bat`

```bat
@echo off
echo Register Engine Path
%~dp0..\..\..\Engine\Binaries\Win64\UnrealVersionSelector-Win64-Shipping.exe /register
pause
```


## 배포 버전 설정 SetupDistribution

직접 빌드한 에디터로 프로젝트를 만들 경우 프로젝트 설정에 최적화시키기 위해 엔진을 다시 빌드하게 됩니다. 굳이 프로젝트별 엔진 빌드를 할 필요가 없다면 엔진을 **바이너리 배포 버전**으로 설정하는 것이 좋습니다.

* GeneratedProjectFiles.bat 삭제
* Build\SourceDistribution.txt 삭제
* Build\InstalledBuild.txt 빈 파일 생성

GeneratedProjectFiles.bat 와 SourceDistribution.txt 를 삭제할 경우 다시 소스 배포 버전으로 돌리기 어려우므로 삭제보다는 이름을 변경하는 방법이 좋습니다.

### 바이너리 배포 버전 설정 MakeDistributionBinary

`C:\EpicGames\UE_4.git\Build\BatchFiles\_MakeDistributionBinary.bat`

```bat
@echo off
if exist %~dp0..\InstalledBuild.txt (
	echo Already made Distribution: Binary
	goto finish
)
echo Make Distribution: Binary
ren %~dp0..\..\..\GenerateProjectFiles.bat _GenerateProjectFiles.bat       
ren %~dp0..\SourceDistribution.txt _SourceDistribution.txt
copy NUL %~dp0..\InstalledBuild.bat

:finish
pause
```

### 소스 배포 버전 설정 MakeDistributionSource

`C:\EpicGames\UE_4.git\Build\BatchFiles\_MakeDistributionSource.bat`

```bat
@echo off
if not exist %~dp0..\InstalledBuild.txt (
	echo Already made Distribution: Source
	goto finish
)

echo Make Distribution: Source
if exist %~dp0..\..\..\_GenerateProjectFiles.bat ren %~dp0..\..\..\_GenerateProjectFiles.bat GenerateProjectFiles.bat       
if exist %~dp0..\_SourceDistribution.txt ren %~dp0..\_SourceDistribution.txt SourceDistribution.txt
if exist %~dp0..\InstalledBuild.txt del %~dp0..\InstalledBuild.txt

:finish
pause
```