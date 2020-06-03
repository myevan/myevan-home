# UE4 플러그인 찾을 수 없음 (UE4: PluginModuleNotFound)

Engine\Source\Runtime\Projects\Private\PluginManager.cpp

```cpp
static bool TryLoadModulesForPlugin( const FPlugin& Plugin, const ELoadingPhase::Type LoadingPhase )
{
			if ( FailureReason == EModuleLoadResult::FileNotFound )
			{
				FailureMessage = FText::Format( LOCTEXT("PluginModuleNotFound", "Plugin '{0}' failed to load because module '{1}' could not be found.  Please ensure the plugin is properly installed, otherwise consider disabling the plugin for this project."), PluginNameText, TextModuleName );
			}
}
```

참조에 의한 활성화

```cpp
bool FPluginManager::ConfigureEnabledPluginForTarget(const FPluginReferenceDescriptor& FirstReference, const FProjectDescriptor* ProjectDescriptor, const FString& TargetName, const FString& Platform, EBuildConfiguration Configuration, EBuildTargetType TargetType, bool bLoadPluginsForTargetPlatforms, const TMap<FString, TSharedRef<FPlugin>>& AllPlugins, TMap<FString, FPlugin*>& EnabledPlugins, const FPluginReferenceDescriptor*& OutMissingPlugin)
{
			// Add the plugin
			EnabledPlugins.Add(Plugin.GetName(), &Plugin);
}
```

Engine\Source\Runtime\Projects\Public\PluginDescriptor.h

```cpp
enum class EPluginEnabledByDefault : uint8
{
	Unspecified,
	Enabled,
	Disabled,
};
```

조건 브레이크

```cpp
(int)(Plugin.Descriptor.EnabledByDefault) != 1
```

