# 빗자루넷 따라하기

## 요구 사항 Requirements

### 운영체제 OS

* macOS Sierra 10.12.1 
* Windows 10 Professional + Windows Subsystem for Linux

## 개발환경 Development Environments

* python-2.7 + virtualenvwrapper

## 가상 환경 Virtual Environments

    :::bash
    $ mkvirtualenv myevan_site
    (myevan_site)$ pip install mkdocs
    (myevan_site)$ pip install pygments
    (myevan_site)$ pip install pymdown-extensions
    (myevan_site)$ pip install mkdocs-material

## 새로운 사이트 New Site

GitHub 원격 저장소를 로컬 저장소로 복제합니다.

    :::bash
    (myevan_site)$ git clone https://github.com/myevan/myevan myevan

로컬 저장소에 기본 구조를 생성합니다.

    :::bash
    (myevan_site)$ cd myevan
    (myevan_site)$ mkdocs new .

## 사이트 미리 보기 Preview Site

로컬 서버를 통해 실제 출력되는 모습을 확인할 수 있습니다.

    :::bash
    (myevan_site)$ mkdocs serve

<http://localhost:8000> 접속하면 미리 보기가 가능합니다. 변경 사항도 바로 적용됩니다. 

## 사이트 설정 Site Configuration

    :::bash
    (myevan_site)$ vim mkdocs.yml

### 예제 Example

    :::yaml
    site_name: "myevan.net"
    theme: material
    markdown_extensions:
        - codehilite
    pages:
        - "home": index.md
        - "tutorials": 
            - "myevan site": myevan_site_tutorial.md

### 속성 Properties

* site_name: 사이트 이름 
* theme: 테마
* markdown_extensions: 마크 다운 확장 
    * codehilite: 문법 강조 지원
* pages: 페이지 이름과 마크다운 파일 맵핑, 계층 구조 지원


## 배포 Deployment

페이지 저장소를 site 디렉토리에 클론 받습니다.

    :::bash
    (myevan_site)$ git clone https://github.com/myevan/myevan.github.io site

홈 저장소에서 site 디렉토리를 버전 관리하지 않도록 무시 설정해 줍니다.

    :::bash
    (myevan_site)$ vim .gitignore
    /site

빌드하면 site 디렉토리에 정적 사이트가 만들어집니다.

    :::bash
    (myevan_site)$ mkdocs build

git 을 사용해서 정적 사이트 배포가 가능합니다.

    :::bash
    (myevan_site)$ (cd site;git commit -a)
    (myevan_site)$ (cd site;git push)

배포된 사이트는 <https://myevan.github.io> 에서 확인 가능합니다. 

## 커스텀 도메인 Custom Domain

<https://help.github.com/articles/using-a-custom-domain-with-github-pages/>

* 도메인을 구입합니다. <https://www.cafe24.com/?controller=domain_search>
* GitHub 페이지 설정에서 커스텀 도메인을 입력합니다. <https://github.com/myevan/myevan.github.io/settings>
* 도메인 관리 페이지에서 A 레코드를 추가합니다
    * myevan.net: 192.30.252.153
    * myevan.net: 192.30.252.154
    * www.myevan.net: 192.30.252.153
    * www.myevan.net: 192.30.252.154