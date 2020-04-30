# 윈도우 언리얼 엔진 셋업 (UnrealEngine Setup on Windows)

## 클론 (Clone)

```bat
C:\EpicGames> git clone https://github.com/EpicGames/UnrealEngine.git UE_4.git
```

## 디펜던시 업데이트(Update GitDependencies)

### 프락시 (Proxy)

```bat
C:\EpicGames\UE_4.git>Engine\Binaries\DotNET\GitDependencies.exe -proxy=xxx.xxx.xxx.xxx:port
```

### 제외 (Exclude)

```bat
C:\EpicGames\UE_4.git>Engine\Binaries\DotNET\GitDependencies.exe -exclude=HTML5
```

## 셋업 (Setup)

```bat
C:\EpicGames\UE_4.git>Setup.bat
```

## 프로젝트 파일 생성 (Generate Project Files)

```bat
C:\EpicGames\UE_4.git>GenerateProjectFiles.bat
```
