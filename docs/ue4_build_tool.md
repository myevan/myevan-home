# 언리얼 빌드 툴 (UnrealBuildTool)

## 빌드 (Build)

### 환경 변수 (EnvironmentVariables)

```bat
set UE4=C:\Work\UE_4.git
set Program=BlankProgram
set Platform=Win64
set Config=Debug 
```

### 배치 파일 (BatchFiles)

```bat
%UE4%\Engine\Build\BatchFiles\Build.bat %Program% %Platform% %Config%
```

### 직접 실행 (ManualCommandLine)

```bat
%UE4%\Engine\Binaries\DotNET\UnrealBuildTool.exe %Program% %Platform% %Config%
```

## 클린 (Clean)

### 배치 파일 (BatchFiles)

```bat
%UE4%\Engine\Build\BatchFiles\Clean.bat %Program% %Platform% %Config%
```

### 직접 실행 (ManualCommandLine)

```bat
%UE4%\Engine\Binaries\DotNET\UnrealBuildTool.exe -Clean %Program% %Platform% %Config%
```
