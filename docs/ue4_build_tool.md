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

## 프로젝트 프로그램 (ProjectProgram)

### 디렉토리 구조 (DirectoryStructure)

```
X/
 Source/
  Programs/
   HelloWorld/
    Private/
     Main.cpp
     Main.h
    Resources/Windows/
     HelloWorld.ico
    HelloWorld.Build.cs
    HelloWorld.Target.cs
 X.uproject
```

### 모듈 규칙 (ModuleRules)

```csharp
using UnrealBuildTool;

public class HelloWorld : ModuleRules
{
	public HelloWorld(ReadOnlyTargetRules Target) : base(Target)
	{
		// OLD
		// PublicIncludePaths.Add("Runtime/Launch/Public");
		// PrivateIncludePaths.Add("Runtime/Launch/Private");
		// OLD_END

		// NEW
		PublicIncludePaths.Add(EngineDirectory + "/Source/" + "Runtime/Launch/Public");
		PrivateIncludePaths.Add(EngineDirectory + "/Source/" + "Runtime/Launch/Private");
		// NEW_END

		PrivateDependencyModuleNames.Add("Core");
		PrivateDependencyModuleNames.Add("Projects");
	}
}
``` 

### 비주얼 스튜디오 프로젝트 (VSProject)

엔진 프로그램은 $(ProjectName)이 적절하지만, 프로젝트 프로그램은 $(SolutionName)을 사용해야 언리얼 프로젝트 이름을 제대로 얻을 수 있음

VCProject.cs

```csharp
		// Anonymous function that writes project configuration data
		private void WriteConfiguration(string ProjectName, ProjectConfigAndTargetCombination Combination, StringBuilder VCProjectFileContent, PlatformProjectGeneratorCollection PlatformProjectGenerators, StringBuilder VCUserFileContent)
		{
			UnrealTargetConfiguration Configuration = Combination.Configuration;

			PlatformProjectGenerator ProjGenerator = Combination.Platform != null ? PlatformProjectGenerators.GetPlatformProjectGenerator(Combination.Platform.Value, true) : null;

			string UProjectPath = "";
			if (IsForeignProject)
			{
				UProjectPath = "\"$(SolutionDir)$(ProjectName).uproject\"";
			}
```
