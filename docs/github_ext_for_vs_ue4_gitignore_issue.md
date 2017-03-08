# GitHub Extension for VisualStudio: UnrealEngine .gitignore 버그

## 환경

* VisualStudio Community 2015 14.0.25431.01 Update 3
* Windows 10 Pro 64bit
* UnrealEngine-4.15.0

## 재현

언리얼 엔진 Git 로컬 저장소를 오픈한 다음 팀 탐색기를 통해 커밋을 시도합니다.

## 상황

팀 탐색기 > 변경 내용 (15781개)

    :::Bat
    .suo [추가]
    AgentInterface.dll [추가]
    AllDesktop.Automation.dll [추가]
    AllDesktop.Automation.pdb [추가]
    ...

## 원인

언리얼에서는 버전 관리 대상 파일을 블랙 리스트 대신 화이트 리스트 관리합니다.

## 분석

팀 탐색기 > 프로젝트 > 설정 > Git > 리포지토리 설정 > 무시 및 특성 파일 > 무시 파일 편집

    :::bash
    # Ignore all files by default, but scan all directories
    *
    !*/

[`!*/`](http://stackoverflow.com/questions/25554504/what-does-mean-in-gitignore) 문구를 제대로 처리하지 못함


## 해결

* Git 콘솔 사용
* Git GUI 클라이언트 사용(SmartGit, SourceTree)
* 다른 Git 플러그인으로 교체(확인중)

