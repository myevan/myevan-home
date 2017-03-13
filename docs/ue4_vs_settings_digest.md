# 언리얼 엔진 비주얼 스튜디오 세팅 요약

<https://docs.unrealengine.com/latest/KOR/Programming/Development/VisualStudioSetup/index.html>

## 통합 환경 설정 IDE Settings

### 솔류션 구성 폭 넓히기 ExtendWidthOfSolutionConfigurations 

* Tools > Customize... 메뉴 클릭
* Customize 다이얼로그 Commands 탭 클릭
* Toolbar 라디오 버튼 선택 > 콤보 상자 Standard 선택
* Controls: Solution Configurations 선택
* Modify Selection 버튼 클릭
    * Width: 150 변경

### 오류 목록 감추기 Hide Error List

* Tools > Options... 메뉴 클릭
* Options 다이얼로그 Projects and Solutions 카테고리 선택
* Always show error list if build finishes with error: **체크 해제**

### 외부 의존성 폴더 감추기 Hide Extern Dependencies Folder

* Tools > Options... 메뉴 클릭
* Options 다이얼로그 Text Editor > C/C++ > Advanced 카테고리 선택 
* Browsing/Navigation 그룹
    * Disable Extenal Dependencies Folder: **False** 설정

### 인텔리센스 Intellisense

* Tools > Options... 메뉴 클릭
* Options 다이얼로그 Text Editor > C/C++ > Advanced 카테고리 선택 
* IntelliSense 그룹 
    * Auto Quick Info: **True** 설정
    * Disable InteliSense: **False** 설정
    * Disable Auto Updating: **False** 설정
    * Disable Error Reporting: **False** 설정
    * Disable Squiggles: **False** 설정

### 편집 후 디버깅 끄기 Disable Debugging Edit and Continue

* Tools > Options... 메뉴 클릭
* Options 다이얼로그 Debugging 카테고리 선택 
* Enable Edit and Continue: **체크 해제**

## 설정 익스포트 Export Settings

* Tools > Import and Export Settings... 메뉴 클릭
* Import and Export Setting Wizard 다이얼로그 Export selected environment settings 선택
* Choose Settings to Export
    * AllSettings 
        * General Settings
            * Menu and Command Bar Customizations
        * Options
            * Debugging
            * Environment
                * Projects and Solutions
            * Text Editor
                * C/C++ Editor

## 설정 파일 Settings File

`%USERPROFILE%\Documents\Visual Studio 2015\Settings\Exported-YYYY-mm-dd.vssettings`

```xml
<UserSettings>
    <ToolOptions>
        <ToolOptionsCategory name="Environment">
            <ToolsOptionsSubCategory name="ProjectsAndSolution">
                <PropertyValue name="ShowTaskListAfterBuild">false</PropertyValue>
            </ToolsOptionsSubCategory> 
        </ToolOptionsCategory>
        <ToolsOptionsCategory name="TextEditor" RegisteredName="TextEditor">
            <ToolsOptionsSubCategory name="C/C++ Specific">
                <PropertyValue name="DisableExternalDependenciesFolders">false</PropertyValue>
                <PropertyValue name="EnableQuickInfoToolTips">true</PropertyValue>
                <PropertyValue name="DisableSharedIntelliSense">false</PropertyValue>
                <PropertyValue name="DisableIntelliSenseUpdating">false</PropertyValue
                <PropertyValue name="DisableErrorReporting">false</PropertyValue>
                <PropertyValue name="DisableSquiggles">false</PropertyValue>
            </ToolsOptionsSubCategory> 
        </ToolOptionsCategory>
    </ToolOptions>
    <Category name="Environment Group"> 
        <Category name="Environment_CommandBars">
            <CommandBars>
                <UserCustomizations>
                    <modify Cmd="{5EFC7975-14BC-11CF-9B2B-00AA00573819}:000002ac" CmdPri="03000000" Group="{D309F791-903F-11D0-9EFC-00A0C911004F}:00000174" GroupPri="09000000" Menu="{D309F791-903F-11D0-9EFC-00A0C911004F}:00000001" Width="150"/>
                </UserCustomizations>
            </CommandBars>
        </Category>
    </Category>
    <Category name="Debugger"> 
        <PropertyValue name="ENCEnable">0</PropertyValue>
    </Category>
</UserSettings>
```
