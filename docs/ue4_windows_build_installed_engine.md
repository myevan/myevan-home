# 언리얼 윈도우 빌드: 인스톨드 엔진 (UE4 Build InstalledEngine on Windows)

## 가짜 인스톨드 빌드 (FakeInstalledBuild)

인스톨드 빌드 테스트용입니다. 
바이너리 빌드 상태일 때는 엔진 수정이 되지 않습니다.

<https://github.com/myevan/UnrealEngine/blob/4.24.3-custom/_MakeEngine_BinaryBuild.bat>

* GeneratedProjectFiles.bat 삭제
* Build\SourceDistribution.txt 삭제
* Build\InstalledBuild.txt 빈 파일 생성


엔진 수정이 필요하면 소스 빌드로 변경해주어야 합니다.

<https://github.com/myevan/UnrealEngine/blob/4.24.3-custom/_MakeEngine_SourceBuild.bat>

## 진짜 인스톨드 빌드 (RealInstalledBuild)

### 빌드 스크립트 커스텀 (Customize BuildScript)

#### 에디터 설정 (Editor Configurations)

에디터 디버깅을 위해 Debug 빌드도 포함합니다.

<https://github.com/myevan/UnrealEngine/commit/f1153c2cc521517a500b0f0d50ffa437ec4133d2>

```xml
<Option Name="EditorConfigurations" DefaultValue="Debug;DebugGame;Development" Description="Which editor configurations to include for working"/>

<Node Name="Compile UE4Editor Win64" Requires="Compile UnrealHeaderTool Win64" Produces="#UE4Editor Win64;#UE4Editor Win64 Unstripped;#UE4Editor Win64 Stripped;#UE4Editor Win64 Unsigned;#UE4Editor Win64 Signed">
    <ForEach Name="Configuration" Values="$(EditorConfigurations)">
        <Compile Target="UE4Editor" Platform="Win64" Configuration="$(Configuration)" Tag="#UE4Editor Win64" Arguments="-precompile -allmodules"/>
    </ForEach>
</Node>
```

#### 모바일 설정 (Mobile COnfigurations)

모바일 디버깅과 최적화 테스트를 위해 Debug 와 Test 빌드를 추가합니다.

```xml
<Option Name="MobileConfigurations" DefaultValue="Debug;DebugGame;Development;Test;Shipping" Description="Which editor configurations to include for working"/>
```

### 오토메이션 툴 실행 (Run AutomationTool)

```bat
Engine\Build\BatchFiles\RunUAT.bat BuildGraph -Script=Engine\Build\InstalledEngineBuild.xml -Target="Make Installed Build Win64" -set:WithWin32=false -set:WithLumin=false -set:WithHoloLens=false -set:WithDDC=false -set:HostPlatformDDCOnly=false -set:WithFullDebugInfo=true -set:GameConfigurations="Debug;DebugGame;Development" -Clean 
```

* WithWin32: 윈도우 (32 bit)
* WithLumin: 루민 
* WithHoloLens: 홀로 렌즈
* WithDDC: 파생 데이터 캐쉬 (공유 폴더 추천)
* WithFullDebugInfo: 디버그 정보 (작업용 추천)
* Clean: 기존 빌드 정리 후 시작
* Script: 빌드 스크립트 경로
* Target: 빌드 스크립트 설정
* GameConfigurations: 호스트 게임 설정 (Shipping 대신 Debug 를 추가합니다.) 


