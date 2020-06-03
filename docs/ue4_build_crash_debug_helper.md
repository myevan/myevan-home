# UE4 빌드 예외: 포함된 DbgHelp (UE4 Build Exception: BundledDbgHelp)

4.24.3 VS2017 UnrealBuildTool 프로젝트 생성 중 발생

Engine\Source\Developer\CrashDebugHelper\CrashDebugHelper.Build.cs

```cs
		if(Target.Platform == UnrealTargetPlatform.Win64 && Target.WindowsPlatform.bUseBundledDbgHelp)
		{
			throw new System.Exception("CrashDebugHelper uses DBGENG.DLL at runtime, which depends on a matching version of DBGHELP.DLL but cannot be redistributed. Please set WindowsPlatform.bUseBundledDbgHelp = false for this target.");
		}
```

Engine\Source\Programs\UnrealBuildTool\Platform\Windows\UEBuildWindows.cs

```cs
		/// <summary>
		/// Bundle a working version of dbghelp.dll with the application, and use this to generate minidumps. This works around a bug with the Windows 10 Fall Creators Update (1709)
		/// where rich PE headers larger than a certain size would result in corrupt minidumps.
		/// </summary>
		public bool bUseBundledDbgHelp = false; // CHECKME: CrashDebugHelper.Build.cs

```