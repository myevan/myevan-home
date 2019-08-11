# VSCode 확장 시작하기 (VSCode Extension GetStarted)

## 준비 (Requirements)

[node.js](/mac_node_js_get_started) 를 설치합니다.

## 설치 (Installation)

npm 모듈 Yeoman 와 VS Code Extension Generator 를 설치합니다.

```bash
$ npm install -g yo
$ npm install -g generator-code
```

## 생성 (Run Generator)

<https://code.visualstudio.com/api/get-started/your-first-extension>

```bash
$ yo code
```

* 확장 언어 선택 What type of extension do you want to create? `New Extension (TypeScript)`
* 확장 이름 입력 What's the name of your extension? `HelloWorld`
* 확장 ID 입력 What's the identifier of your extension? `helloworld`
* 확장 설명 입력 What's the description of your extension? (공백)
* git 리포 초기화 여부 Initialize a git repository? `Yes`
* 패키지 매니저 선택 Which package manager to use? `npm`

## 디버그 (Debug)

* VSCode 로 확장 프로젝트를 오픈합니다.
* 메인 메뉴 Debug > Start Debugging (F5)를 실행합니다.
* 새로운 VSCode 가 실행되면 커맨드 팔레트(win: ctrl+shift+p, mac:command+shift+p)를 오픈합니다.
* `Hello World` 를 찾아 실행합니다.
* 화면 우측 하단에 알림 상자를 확인할 수 있습니다.

## 리뷰 (Review)

* [HelloWorld](/vscode_ext_hello_world)
