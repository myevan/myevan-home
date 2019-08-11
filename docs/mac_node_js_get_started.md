# 맥 노드JS 시작하기 (node.js get started on macOS)

<https://nodejs.org/ko/>

## 설치 (Installation)

### 런타임 (Runtime)

```bash
$ brew install node
```

### 모듈 (NPM)

#### 전역 (Global Modules)

```bash
$ npm install -g $MODULE
```

#### 로컬 (Local Modules)

현재 폴더 내 `.node_moduels` 서브 폴더로 설치 됩니다.

```bash
$ npm install $MODULE
```

로컬 모듈 실행을 위해서는 환경 변수 PATH 설정이 필요합니다.

```bash
$ vim .bash_profile
alias npm-run="PATH=$(npm bin):$PATH"
```

`$(pwd)/.node_modues/.bin`에 있는 파일을 실행하게 됩니다.

```bash
$ npm-run $MODULE
```
