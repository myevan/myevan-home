# github.io 커스텀 도메인

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