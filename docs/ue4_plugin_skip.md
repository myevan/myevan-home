# UE4 플러그인 빌드 건너 뛰기

## 환경

UE_4.24.3

## 컨셉

플러그인 디렉토리에 _Skip.txt 가 존재하면 빌드 및 로드 과정에서 제외합니다.

## 소스

### 빌드

<https://github.com/myevan/UnrealEngine/commit/1b63f2ac143bec96f3f2e410e2ca9577e3f96cf7?diff=unified>

```cs
		public static IReadOnlyList<PluginInfo> ReadPluginsFromDirectory(DirectoryReference RootDirectory, string Subdirectory, PluginType Type)
		{
            // ...
					Plugins = new List<PluginInfo>();
					foreach (FileReference PluginFileName in EnumeratePlugins(Dir))
					{
						// CUSTOM: skip to build plugins
						var ThisDir = PluginFileName.Directory;
						var ParentDir = ThisDir.ParentDirectory;
						var GrandParentDir = ParentDir.ParentDirectory;
						var ThisSkipFile = new FileReference(Path.Combine(ThisDir.FullName, "_Skip.txt"));
						var ParentSkipFile = new FileReference(Path.Combine(ParentDir.FullName, "_Skip.txt"));
						var GrandParentSkipFile = new FileReference(Path.Combine(GrandParentDir.FullName, "_Skip.txt"));
						if (FileReference.Exists(GrandParentSkipFile))
							continue;
						if (FileReference.Exists(ParentSkipFile))
							continue;
						if (FileReference.Exists(ThisSkipFile))
							continue;
						// CUSTOM_END
                    }
        }
```

### 로딩

<https://github.com/myevan/UnrealEngine/commit/6c55979697d656cbc87629a2a8d256b8b70d3d0a>

```cpp
void FPluginManager::ReadPluginsInDirectory(const FString& PluginsDirectory, const EPluginType Type, TMap<FString, TSharedRef<FPlugin>>& Plugins, TArray<TSharedRef<FPlugin>>& ChildPlugins)
{
	// Make sure the directory even exists
	if(FPlatformFileManager::Get().GetPlatformFile().DirectoryExists(*PluginsDirectory))
	{
		TArray<FString> FileNames;
		FindPluginsInDirectory(PluginsDirectory, FileNames);

		for(const FString& FileName: FileNames)
		{
			// CUSTOM: skip to load plugins
			FString ThisPluginDir = FPaths::GetPath(FileName);
			FString ThisPluginSkipFile = ThisPluginDir / "_Skip.txt";
			if (FPlatformFileManager::Get().GetPlatformFile().FileExists(*ThisPluginSkipFile))
			{
				continue;
			}

			FString ParentPluginDir = ThisPluginDir / "..";
			FString ParentPluginSkipFile = ParentPluginDir / "_Skip.txt";
			if (FPlatformFileManager::Get().GetPlatformFile().FileExists(*ParentPluginSkipFile))
			{
				continue;
			}

			FString GrandParentPluginDir = ParentPluginDir / "..";
			FString GrandParentPluginSkipFile = GrandParentPluginDir / "_Skip.txt";
			if (FPlatformFileManager::Get().GetPlatformFile().FileExists(*GrandParentPluginSkipFile))
			{
				continue;
			}
			// CUSTOM_END
```

### 설정

<https://github.com/myevan/UnrealEngine/commit/3536257557359041c1ab39a4041ecfecb2efe29b?diff=unified>

```
Engine/Plugins/Developer/CLionSourceCodeAccess/_Skip.txt
Engine/Plugins/Developer/GitSourceControl/_Skip.txt
Engine/Plugins/Developer/OneSkyLocalizationService/_Skip.txt
Engine/Plugins/Developer/PlasticSourceControl/_Skip.txt
Engine/Plugins/Enterprise/DatasmithC4DImporter/_Skip.txt
Engine/Plugins/Enterprise/DatasmithGLTFImporter/_Skip.txt
Engine/Plugins/Enterprise/DatasmithIFCImporter/_Skip.txt
Engine/Plugins/Experimental/AR/_Skip.txt b/Engine/Plugins/Experimental/AR/_Skip.txt
Engine/Plugins/Experimental/AlembicHairImporter/_Skip.txt
Engine/Plugins/Experimental/AlembicImporter/_Skip.txt
Engine/Plugins/Experimental/AppleVision/_Skip.txt
Engine/Plugins/Experimental/AutomationUtils/_Skip.txt
Engine/Plugins/Experimental/BackChannel/_Skip.txt
Engine/Plugins/Experimental/BlueprintStats/_Skip.txt
Engine/Plugins/Experimental/ChaosCloth/_Skip.txt
Engine/Plugins/Experimental/ChaosClothEditor/_Skip.txt
Engine/Plugins/Experimental/ChaosEditor/_Skip.txt
Engine/Plugins/Experimental/ChaosNiagara/_Skip.txt
Engine/Plugins/Experimental/ChaosSolverPlugin/_Skip.txt
Engine/Plugins/Experimental/CharacterAI/_Skip.txt
Engine/Plugins/Experimental/CodeEditor/_Skip.txt
Engine/Plugins/Experimental/CodeView/_Skip.txt
Engine/Plugins/Experimental/ControlRig/_Skip.txt
Engine/Plugins/Experimental/FieldSystemPlugin/_Skip.txt
Engine/Plugins/Experimental/Gauntlet/_Skip.txt
Engine/Plugins/Experimental/GeometryProcessing/_Skip.txt
Engine/Plugins/Experimental/HairStrands/_Skip.txt
Engine/Plugins/Experimental/ImagePlate/_Skip.txt
Engine/Plugins/Experimental/Landmass/_Skip.txt
Engine/Plugins/Experimental/MeshModelingToolset/_Skip.txt
Engine/Plugins/Experimental/ModelingToolsEditorMode/_Skip.txt
Engine/Plugins/Experimental/PanoramicCapture/_Skip.txt
Engine/Plugins/Experimental/Phya/_Skip.txt
Engine/Plugins/Experimental/PlanarCutPlugin/_Skip.txt
Engine/Plugins/Experimental/RawInput/_Skip.txt
Engine/Plugins/Experimental/RemoteSession/_Skip.txt
Engine/Plugins/Experimental/SampleToolsEditorMode/_Skip.txt
Engine/Plugins/Experimental/ShallowWater/_Skip.txt
Engine/Plugins/Experimental/Shotgun/_Skip.txt
Engine/Plugins/Experimental/SimpleHMD/_Skip.txt
Engine/Plugins/Experimental/SkeletalReduction/_Skip.txt
Engine/Plugins/Experimental/Text3D/_Skip.txt
Engine/Plugins/Experimental/VirtualCamera/_Skip.txt
Engine/Plugins/Experimental/VirtualProductionUtilities/_Skip.txt
Engine/Plugins/Experimental/WebSocketNetworking/_Skip.txt
Engine/Plugins/Lumin/_Skip.txt b/Engine/Plugins/Lumin/_Skip.txt
Engine/Plugins/Online/OnlineSubsystemAmazon/_Skip.txt
Engine/Plugins/Online/OnlineSubsystemOculus/_Skip.txt
Engine/Plugins/Online/OnlineSubsystemSteam/_Skip.txt
Engine/Plugins/Online/OnlineSubsystemTencent/_Skip.txt
Engine/Plugins/Online/OnlineSubsystemTwitch/_Skip.txt
Engine/Plugins/Runtime/AR/_Skip.txt b/Engine/Plugins/Runtime/AR/_Skip.txt
Engine/Plugins/Runtime/Analytics/_Skip.txt
Engine/Plugins/Runtime/GoogleVR/_Skip.txt
Engine/Plugins/Runtime/LeapMotion/_Skip.txt
Engine/Plugins/Runtime/MicrosoftSpatialAudio/_Skip.txt
Engine/Plugins/Runtime/MixedRealityCaptureFramework/_Skip.txt
Engine/Plugins/Runtime/Nvidia/Ansel/_Skip.txt
Engine/Plugins/Runtime/Oculus/_Skip.txt
Engine/Plugins/Runtime/OpenXR/_Skip.txt
Engine/Plugins/Runtime/Steam/_Skip.txt
Engine/Plugins/Runtime/WindowsMixedReality/_Skip.txt
Engine/Plugins/Runtime/nDisplay/_Skip.txt
```