# 언리얼 윈도우 레지스트리 (UE4 Windows Registry)

## 경로 (Path)

### 확장자

```
HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.uproject\OpenWithList
```

### 인하우스 빌드

```
HKEY_CURRENT_USER\SOFTWARE\Epic Games\Unreal Engine\Builds
```

### 퍼블릭 빌드

```
HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames\Unreal Engine
```

## 소스 (Source)

### 언리얼 버전 셀렉터 (UnrealVersionSelector)

언리얼 버전 셀렉터 에디터 옵션 실행

<https://github.com/EpicGames/UnrealEngine/blob/4.26/Engine/Source/Programs/UnrealVersionSelector/Private/UnrealVersionSelector.cpp#L376-L380>

```cpp
int Main(const TArray<FString>& Arguments)
{
    /// ... 전략 ...	
	else if (Arguments.Num() == 2 && Arguments[0] == TEXT("-editor"))
	{
		// Open a project with the editor
		bRes = LaunchEditor(Arguments[1], TEXT(""));
	}
    /// ... 후략 ...    
```

유효한 엔진 루트 디렉토리 얻기

<https://github.com/EpicGames/UnrealEngine/blob/4.26/Engine/Source/Programs/UnrealVersionSelector/Private/UnrealVersionSelector.cpp#L285-L288>

```cpp
bool LaunchEditor(const FString& ProjectFileName, const FString& Arguments)
{
	// Get the engine root directory
	FString RootDir;
	if (!GetValidatedEngineRootDir(ProjectFileName, RootDir))
	{
		return false;
	}
}
```

프로젝트에서 엔진 루트 디렉토리 얻기

<https://github.com/EpicGames/UnrealEngine/blob/4.26/Engine/Source/Programs/UnrealVersionSelector/Private/UnrealVersionSelector.cpp#L155>

```cpp
bool GetValidatedEngineRootDir(const FString& ProjectFileName, FString& OutRootDir)
{
	if (!GetEngineRootDirForProject(ProjectFileName, OutRootDir))
	{
        /// ... 중략 ...        
    }
```

엔진 아이디로 엔진 루트 디렉토리 얻기

<https://github.com/EpicGames/UnrealEngine/blob/4.26/Engine/Source/Programs/UnrealVersionSelector/Private/UnrealVersionSelector.cpp#L149>

```cpp
bool GetEngineRootDirForProject(const FString& ProjectFileName, FString& OutRootDir)
{
	FString Identifier;
	return FDesktopPlatformModule::Get()->GetEngineIdentifierForProject(ProjectFileName, Identifier) && FDesktopPlatformModule::Get()->GetEngineRootDirFromIdentifier(Identifier, OutRootDir);
}
```

### 데스크탑 플랫폼 (DesktopPlatform)

엔진 설치 경로 모두 확보

<https://github.com/EpicGames/UnrealEngine/blob/4.26/Engine/Source/Developer/DesktopPlatform/Private/DesktopPlatformBase.cpp#L118>

```cpp
bool FDesktopPlatformBase::GetEngineRootDirFromIdentifier(const FString &Identifier, FString &OutRootDir)
{
	// Get all the installations
	TMap<FString, FString> Installations;
	EnumerateEngineInstallations(Installations);
}
```

언리얼 엔진 빌드 레지스트리에서 엔진 루트 디렉토리 검색

<https://github.com/EpicGames/UnrealEngine/blob/4.26/Engine/Source/Developer/DesktopPlatform/Private/Windows/DesktopPlatformWindows.cpp#L28>

```cpp
static const TCHAR *InstallationsSubKey = TEXT("SOFTWARE\\Epic Games\\Unreal Engine\\Builds");
```

<https://github.com/EpicGames/UnrealEngine/blob/4.26/Engine/Source/Developer/DesktopPlatform/Private/Windows/DesktopPlatformWindows.cpp#L342>

```cpp
void FDesktopPlatformWindows::EnumerateEngineInstallations(TMap<FString, FString> &OutInstallations)
{
    /// ... 전략 ...
	if (RegOpenKeyEx(HKEY_CURRENT_USER, InstallationsSubKey, 0, KEY_ALL_ACCESS, &hKey) == ERROR_SUCCESS)
    {
        /// ... 중략 ...
    }
    /// ... 후략 ...
}
```
