# github.io mkdocs

## 윈도우

[윈도우 파이썬 마크다운 HTML 생성](/windows_python_mkdocs.md) 환경을 준비합니다.

```bat
(mkdocs) C:\> md \GitHub
(mkdocs) C:\> cd \GitHub
(mkdocs) C:\GitHub> md myevan
(mkdocs) C:\GitHub> cd myevan
(mkdocs) C:\GitHub\myevan> mkdocs new .
```

페이지 저장소를 site 디렉토리에 클론 받습니다.

```bat
(mkdocs) C:\GitHub\myevan> git clone https://github.com/myevan/myevan.github.io site
```

홈 저장소에서 site 디렉토리를 버전 관리하지 않도록 무시 설정해 줍니다.

```bat
(mkdocs) C:\GitHub\myevan> vim .gitignore
/site
```

빌드하면 site 디렉토리에 정적 사이트가 만들어집니다.

```
(mkdocs) C:\GitHub\myevan> mkdocs build
```

git 을 사용해서 정적 사이트 배포가 가능합니다.

```bat
(mkdocs)$ C:\GitHub\myevan> cd site
(mkdocs)$ C:\GitHub\myevan\site> git commit -a
(mkdocs)$ C:\GitHub\myevan\site> git push
```

배포된 사이트는 <https://myevan.github.io> 에서 확인 가능합니다. 

## 맥

[맥 파이썬 마크다운 HTML 생성](/mac_python_mkdocs.md) 환경을 준비합니다.

```bash
(mkdocs)$ mkdir GitHub
(mkdocs)$ cd GitHub
(mkdocs)$ mkdir myevan
(mkdocs)$ cd myevan
(mkdocs)$ mkdocs new .
```

페이지 저장소를 site 디렉토리에 클론 받습니다.

```bash
(mkdocs)$ git clone https://github.com/myevan/myevan.github.io site
```

홈 저장소에서 site 디렉토리를 버전 관리하지 않도록 무시 설정해 줍니다.

``bash
(mkdocs)$ vim .gitignore
/site
```

빌드하면 site 디렉토리에 정적 사이트가 만들어집니다.

```bash
(mkdocs)$ mkdocs build
```

git 을 사용해서 정적 사이트 배포가 가능합니다.

```bash
(mkdocs)$ cd site
(mkdocs)$ git commit -a
(mkdocs)$ git push
```

배포된 사이트는 <https://myevan.github.io> 에서 확인 가능합니다. 