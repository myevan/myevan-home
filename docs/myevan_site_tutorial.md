# 빗자루넷 따라하기

## 셋업 Setup

### Windows

#### 가상 환경 Virtual Environment

python-2.7 + virtualenv

    :::bat
    C:\> virtualenv \Python27\venvs\mkdocs
    C:\> \Python27\venvs\mkdocs\Scripts\active
    (mkdocs) C:\> pip install mkdocs
    (mkdocs) C:\> pip install pygments
    (mkdocs) C:\> pip install pymdown-extensions
    (mkdocs) C:\> pip install mkdocs-material

#### 새로운 사이트 New Site

    :::bat
    (mkdocs) C:\> md \GitHub
    (mkdocs) C:\> cd \GitHub
    (mkdocs) C:\GitHub> md \myevan
    (mkdocs) C:\GitHub> cd \myevan
    (mkdocs) C:\GitHub\myevan> mkdocs new .

#### 사이트 미리 보기 Preview Site

로컬 서버를 통해 실제 출력되는 모습을 확인할 수 있습니다.

    :::bat
    (mkdocs) C:\GitHub\myevan> mkdocs serve

<http://localhost:8000> 접속하면 미리 보기가 가능합니다. 변경 사항도 바로 적용됩니다. 

### POSIX

* macOS Sierra 10.12.1 
* Windows 10 Professional + Windows Subsystem for Linux

#### 가상 환경 Virtual Environment

python-2.7 + virtualenvwrapper

    :::bash
    $ mkvirtualenv mkdocs
    (mkdocs)$ pip install mkdocs
    (mkdocs)$ pip install pygments
    (mkdocs)$ pip install pymdown-extensions
    (mkdocs)$ pip install mkdocs-material

#### 새로운 사이트 New Site

    :::bash
    (mkdocs)$ mkdir GitHub
    (mkdocs)$ cd GitHub
    (mkdocs)$ mkdir myevan
    (mkdocs)$ cd myevan
    (mkdocs)$ mkdocs new .

#### 사이트 미리 보기 Preview Site

로컬 서버를 통해 실제 출력되는 모습을 확인할 수 있습니다.

    :::bash
    (mkdocs)$ mkdocs serve

<http://localhost:8000> 접속하면 미리 보기가 가능합니다. 변경 사항도 바로 적용됩니다. 

## 설정 Configuration

### 예제 Example

    mkdocs.yml

    :::yaml
    site_name: "myevan.net"
    theme: material
    markdown_extensions:
        - codehilite
    pages:
        - "home": index.md
        - "tutorials": 
            - "myevan site": mkdocs_tutorial.md

### 속성 Properties

* `site_name`: 사이트 이름 
* `theme`: 테마
* `markdown_extensions`: 마크 다운 확장 
    * `codehilite`: 문법 강조 지원
* `pages`: 페이지 이름과 마크다운 파일 맵핑, 계층 구조 지원


## 배포 Deployment

### Windows

페이지 저장소를 site 디렉토리에 클론 받습니다.

    :::bat
    (mkdocs) C:\GitHub\myevan> git clone https://github.com/myevan/myevan.github.io site

홈 저장소에서 site 디렉토리를 버전 관리하지 않도록 무시 설정해 줍니다.

    :::bat
    (mkdocs) C:\GitHub\myevan> vim .gitignore
    /site

빌드하면 site 디렉토리에 정적 사이트가 만들어집니다.

    :::bat
    (mkdocs) C:\GitHub\myevan> mkdocs build

git 을 사용해서 정적 사이트 배포가 가능합니다.

    :::bat
    (mkdocs)$ C:\GitHub\myevan> (cd site;git commit -a)
    (mkdocs)$ C:\GitHub\myevan> (cd site;git push)

배포된 사이트는 <https://myevan.github.io> 에서 확인 가능합니다. 

### POSIX

페이지 저장소를 site 디렉토리에 클론 받습니다.

    :::bash
    (mkdocs)$ git clone https://github.com/myevan/myevan.github.io site

홈 저장소에서 site 디렉토리를 버전 관리하지 않도록 무시 설정해 줍니다.

    :::bash
    (mkdocs)$ vim .gitignore
    /site

빌드하면 site 디렉토리에 정적 사이트가 만들어집니다.

    :::bash
    (mkdocs)$ mkdocs build

git 을 사용해서 정적 사이트 배포가 가능합니다.

    :::bash
    (mkdocs)$ (cd site;git commit -a)
    (mkdocs)$ (cd site;git push)

배포된 사이트는 <https://myevan.github.io> 에서 확인 가능합니다. 

## 커스텀 도메인 Custom Domain

<https://help.github.com/articles/about-supported-custom-domains/#apex-domains>

* [도메인을 구입](https://www.cafe24.com/?controller=domain_search)합니다. 
* [GitHub 페이지 설정](https://github.com/myevan/myevan.github.io/settings) 에서 *Custom domain*을 입력하고 *Save* 버튼을 누릅니다.
* [도메인을 등록](https://kr.dnsever.com/)합니다. 
    * [CNAME 레코드](https://help.github.com/articles/setting-up-a-www-subdomain/) 설정
        * www.myevan.net: myevan.github.io
        * www.myevan.net: myevan.github.io
    * [ANAME 레코드](https://help.github.com/articles/setting-up-an-apex-domain/#configuring-an-alias-or-aname-record-with-your-dns-provider) [설정](http://blog.kr.dnsever.com/?p=332)
        * myevan.net: myevan.github.io
        * myevan.net: myevan.github.io
* site 저장소에 [CNAME 파일](https://github.com/myevan/myevan.github.io/blob/master/CNAME)이 생성됩니다.
* mkdocs build 시마다 site 디렉토리가 리셋되어 CNAME 파일이 삭제되는 것을 막기 위해 CNAME 파일을 [docs 디렉토리](https://github.com/myevan/myevan/tree/master/docs)로 복사합니다
