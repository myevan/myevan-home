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
