# VSCode 확장 (VSCode Extension): Hello World

## 패키지 (package.js)

contributes 에 커맨드(extension.helloworld)를 "Hello World"란 이름으로 등록합니다. 

```json
{
	"contributes": {
		"commands": [
			{
				"command": "extension.helloWorld",
				"title": "Hello World"
			}
		]
	},
}
```

## 소스 (src/extension.ts)

확장이 작동되면 activate 함수가 호출됩니다.

```ts
export function activate(context: vscode.ExtensionContext) {
}
```

진행 상황 확인을 위해 콘솔에 로그를 출력합니다.

```ts
console.log('Congratulations, your extension "helloworld" is now active!');
```

패키지 설정에 등록한 커맨드를 등록합니다.

```ts
let disposable = vscode.commands.registerCommand('extension.helloWorld', () => {});
context.subscriptions.push(disposable);
```

커맨드 실행시 정보 메시지를 보여줍니다.

```ts
let disposable = vscode.commands.registerCommand('extension.helloWorld', () => {
    vscode.window.showInformationMessage('Hello World!');
});
context.subscriptions.push(disposable);
```
