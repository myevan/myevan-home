# 빗자루넷 따라하기

## 작업 환경

* OS
    * macOS Sierra 10.12.1 
    * Windows 10 Professional + Windows Subsystem for Linux
* python-2.7 + virtualenvwrapper

## 가상 환경

    :::bash
    $ mkvirtualenv myevan_home
    (myevan_home)$ pip install mkdocs
    (myevan_home)$ pip install pygments
    (myevan_home)$ pip install pymdown-extensions
    (myevan_home)$ pip install mkdocs-material

## 새로 만들기

GitHub 원격 저장소를 로컬 저장소로 복제합니다.

    :::bash
    (myevan_home)$ git clone https://github.com/myevan/home myevan_home

로컬 저장소에 기본 구조를 생성합니다.

    :::bash
    (myevan_home)$ cd myevan_home
    (myevan_home)$ mkdocs new .

## 미리 보기

로컬 서버를 통해 실제 출력되는 모습을 확인할 수 있습니다.

    :::bash
    (myevan_home)$ mkdocs serve

<http://localhost:8000> 접속하면 미리 보기가 가능합니다. 변경 사항도 바로 적용됩니다. 

## 설정

    :::bash
    (myevan_home)$ vim mkdocs.yml

### 예제

    :::yaml
    site_name: "myevan.net"
    theme: material
    markdown_extensions:
        - codehilite
    pages:
        - "home": index.md
        - "tutorials": 
            - "myevan site": myevan_site_tutorial.md

### 속성

* site_name: 사이트 이름 
* theme: 테마
* markdown_extensions: 마크 다운 확장 
    * codehilite: 문법 강조 지원
* pages: 페이지 이름과 마크다운 파일 맵핑, 계층 구조 지원


## 배포

페이지 저장소를 site 디렉토리에 클론 받습니다.

    :::bash
    (myevan_home)$ git clone https://github.com/myevan/myevan.github.io site

홈 저장소에서 site 디렉토리를 버전 관리하지 않도록 무시 설정해 줍니다.

    :::bash
    (myevan_home)$ vim .gitignore
    /site

빌드하면 site 디렉토리에 정적 사이트가 만들어집니다.

    :::bash
    (myevan_home)$ mkdocs build

git 을 사용해서 정적 사이트 배포가 가능합니다.
