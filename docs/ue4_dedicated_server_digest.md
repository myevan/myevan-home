# 언리얼 데디케이티드 서버 가이드 요약

<https://wiki.unrealengine.com/Dedicated_Server_Guide_(Windows_%26_Linux)>

## 준비 

언리얼 데디케이티드 서버를 만들기 위해서는 [GitHub 버전 빌드](ue4_windows_build_tutorial.md)가 필요합니다.

## 프로젝트 생성 CreateProject

언리얼 에디터를 실행해 **C++** & 삼인칭(Third Person) 템플릿 프로젝트를 생성합니다.

`C:\GitHub\UE4NetworkExample`

## 프로젝트 서버 타겟 생성 CreateProjectServerTarget 

프로젝트 서버 타겟을 생성 후 프로젝트 파일을 재생성합니다.

`C:\GitHub\UE4NetworkExample\Source\UE4NetworkExampleServer.Target.cs`

```cs
// Fill out your copyright notice in the Description page of Project Settings.

using UnrealBuildTool;
using System.Collections.Generic;

[SupportedPlatforms(UnrealPlatformClass.Server)]
public class UE4NetworkExampleServerTarget : TargetRules
{
	public UE4NetworkExampleServerTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Server;

		ExtraModuleNames.AddRange( new string[] { "UE4NetworkExample" } );
	}
}
```

## 프로젝트 구성 SetupProject

### 애셋 생성 CreateAssets

* Content\Example 폴더 생성
* Content\Example\Widgets 폴더 생성
* Content\Example\Widgets\Loading 위젯 블루프린트 생성
* Content\Example\Maps 폴더 생성
* Content\Example\Maps\ClientEntryMap 레벨 생성
* Content\ThirdPersonCPP\Maps\ThirdPersonExample 을 복제
    * 클라용: Content\Example\Maps\ClientTestMap 
    * 서버용: Content\Example\Maps\ServerTestMap

### 애셋 셋업 SetupAssets

### Loading 위젯

* Text 컨트롤 추가
    * Content\Text: `LOADING`
    * Appearance\Font\Size: `40`

### ClientEntryMap

* 툴바: Blueprints > Open Level Blueprint 메뉴 클릭
* 레벨 블루프린트 다이얼로그: 이벤트 그래프
    * Event BeginPlay 생성
    * Function Open Level 생성
        * LevelName: `127.0.0.1`

### ClientTestMap

* 툴바: Blueprints > Open Level Blueprint 메뉴 클릭
* 레벨 블루프린트 다이얼로그: 이벤트 그래프
    * Event BeginPlay 생성
    * Function Create Widget 생성
        * Class: `Loading` 위젯 블루프린트 선택
        * Owning Player: `Get Player Controller` 함수 연결
    * Function Add To Viewport 생성
* 월드 아웃라이너:
    * `ThirdPersonCharacter` 삭제

### 프로젝트 설정 SetupProjectSettings

* 카테고리: Maps & Modes 선택
* Default Maps
    * Game Default Map: `ClientEntryMap`
    * Transition Map: `ClientTestMap`
    * ServerDefaultMap: `ServerTestMap`


## 프로젝트 패키지 PackageProject 

* 언리얼 에디터 메인 메뉴 File > Package Project > Packaging Settings 메뉴 선택 
    * List of maps to include in a package build
        * `/Game/Example/Maps/ClientEntryMap`
        * `/Game/Example/Maps/ClientTestMap`
        * `/Game/Example/Maps/ServerTestMap`
* 언리얼 에디터 메인 메뉴 File > Package Project > Windows > Windows (64-bits) 메뉴 선택
    * **Packages** 폴더를 생성 후 패키징 시작
    * 결과 확인: `C:\GitHub\UE4NetworkExample\Packages\WindowsNoEditor`

## 서버 빌드 BuildServer

* 비주얼 스튜디오 **Development Server** 설정을 선택해 빌드합니다.
* 패키지 폴더에 링크를 생성합니다.

`C:\GitHub\UE4NetworkExample\_MakeServerLink.bat`

```bat
@echo off
for %%i in (%~dp0\*.uproject) do (
    echo %~dp0Packages\WindowsNoEditor\%%~ni\Binaries\Win64\%%~niServer-Win64-DebugGame.exe
    if not exist %~dp0Packages\WindowsNoEditor\%%~ni\Binaries\Win64\%%~niServer-Win64-DebugGame.exe mklink /H %~dp0Packages\WindowsNoEditor\%%~ni\Binaries\Win64\%%~niServer-Win64-DebugGame.exe %~dp0Binaries\Win64\%%~niServer-Win64-DebugGame.exe
)
pause
```

## 서버 디버깅 DebugServer

* 비주얼 스튜디오 UE4NetworkExample Properties 다이얼로그 오픈
* Configuration Properties > Debugging > Command 입력 

```bat
C:\GitHub\UE4NetworkExample\Packages\WindowsNoEditor\UE4NetworkExample\Binaries\Win64\UE4NetworkExampleServer-Win64-DebugGame.exe
```

## 클라 실행 RunClient

```bat
C:\GitHub\UE4NetworkExample\Packages\WindowsNoEditor\UE4NetworkExample\Binaries\Win64\UE4NetworkExample.exe
```
