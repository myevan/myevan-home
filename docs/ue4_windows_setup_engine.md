# 언리얼 엔진 윈도우 환경 셋업 (UnrealEngine Setup on Windows)

## 준비 (Prepare)

### 클론 (Clone)

```bat
C:\EpicGames>git clone https://github.com/EpicGames/UnrealEngine.git UE_4_Dev
```

### 브랜치 (Branch)

```bat
C:\EpicGames>git checkout -b x.y.z-custom
```

### 리모트 (Remote)

<https://github.com/myevan/UnrealEngine>

```bat
C:\EpicGames>git remote add custom https://github.com/GROUP/UnrealEngine.git
```

### 디펜던시 업데이트(Update GitDependencies)

<https://github.com/myevan/UnrealEngine/blob/4.24.3-custom/_GitDependencies.bat>

#### HTML5 제외

```bat
C:\EpicGames\UE_4_Dev> Engine\Binaries\DotNET\GitDependencies.exe -exclude=HTML5
```

#### 프락시 설정

```bat
C:\EpicGames\UE_4_Dev> Engine\Binaries\DotNET\GitDependencies.exe -proxy=xxx.xxx.xxx.xxx:0000
```

## 빌드 (Build)

### 엔진 셋업 (SetupEngine)

```bat
C:\EpicGames\UE_4_Dev> Setup.bat
```

### 엔진 프로젝트 생성 (MakeEngineProject)

```bat
C:\EpicGames\UE_4_Dev> GenerateProjectFiles.bat
```

### 에디터 빌드 (BuildEditor)

```bat
C:\EpicGames\UE_4_Dev> Engine\Build\BatchFiles\MSBuild.bat UE4.sln /m /p:Platform=Win64 /t:Build /p:Configuration="Development Editor"
```

## 실행 (Run)

### 파생 데이터 캐시 (DDC: DerivedDataCache)

협업시 중복된 셰이더 컴파일을 줄이기 위해 필요합니다.

* 환경 변수: `UE-SharedDataCachePath`
* 공유 폴더: `\\SHARE\UE4\DDC`

```bat
C:\EpicGames\UE_4_Dev> setx UE-SharedDataCachePath "\\SHARE\UE4\DDC"
```

### 에디터 실행 (RunEditor)

<https://github.com/myevan/UnrealEngine/blob/4.24.3-custom/_BuidEditor_Development.bat>

```bat
C:\EpicGames\UE_4_Dev> Engine\Binaries\Win64\UE4Editor.exe
```

## 인스톨드 빌드 (InstalledBuild)

### 가짜 인스톨드 빌드 (FakeInstalledBuild)

인스톨드 빌드 테스트용입니다. 
바이너리 빌드 상태일 때는 엔진 수정이 되지 않습니다.

<https://github.com/myevan/UnrealEngine/blob/4.24.3-custom/_MakeEngine_BinaryBuild.bat>

* GeneratedProjectFiles.bat 삭제
* Build\SourceDistribution.txt 삭제
* Build\InstalledBuild.txt 빈 파일 생성


엔진 수정이 필요하면 소스 빌드로 변경해주어야 합니다.

<https://github.com/myevan/UnrealEngine/blob/4.24.3-custom/_MakeEngine_SourceBuild.bat>