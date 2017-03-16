# 퍼포스 윈도우 서브버전 마이그레이션 요약 

## 준비 작업

### 다운로드

* 매뉴얼 <ftp://ftp.perforce.com/perforce/tools/p4convert/p4convert.pdf>
* 패키지 <ftp://ftp.perforce.com/perforce/tools/p4convert/p4convert.tgz>

### 모드 결정

* 임포트 모드: 리비전 단위로 이전합니다.
* 컨버트 모드: 저장소 전체를 이전합니다.
* 점진적 갱신 모드: 임포트 모드로만 가능하며 서브버전의 새로운 리비전들을 퍼포스로 임포트합니다.

### 요구 사항

* SVN 덤프 파일 (--delta 플래그 없이 생성해야 합니다.)
* Java SE Runtime 1.7 
* p4d 2010.2 이상 
* 임포트 모드는 작동중인 퍼포스 서버가 필요합니다. 가능하면 비어있는 저장소로 작업 중인 내용이 없어야 합니다.


## 이전 작업

### 요구 사항

* TortoiseSVN
* 관리자 권한 커맨드 라인 콘솔 

### 로컬 백업 

SVN 관리자 권한이 없는 경우에는 로컬에 저장소를 동기화합니다.

로컬에 비어있는 저장소를 생성합니다.

    :::bat
	mkdir SVNBackups
	cd SVNBackups
	svnadmin create LOCAL_REPO_NAME

서브버전 후킹 배치 파일을 작성합니다.

    :::bat
	notepad.exe LOCAL_REPO_NAME\hooks\pre-revprop-change.bat
	@ECHO OFF
	exit 0

동기화를 시작합니다.

    :::bat
	svnsync init file:///d:/SVNBackups/LOCAL_REPO_NAME svn://REMOTE_REPO_HOST/PATH	
	svnsync sync file:///d:/SVNBackups/LOCAL_REPO_NAME


### 덤프 생성 

    :::bat
	svnsync sync file:///d:/SVNBackups/LOCAL_REPO_NAME
	svnadmin dump LOCAL_REPO_NAME > LOCAL_REPO_NAME.dmp


### 변환 설정

디폴트 설정 파일을 생성합니다.

    :::bat
	java -jar p4convert.jar --type=SVN --default
	ren default.cfg LOCAL_REPO_NAME.cfg

현재 상황에 맞도록 설정 파일을 변경합니다.

    :::bat
	notepad.exe LOCAL_REPO_NAME.cfg
	com.p4convert.svn.dumpFile=D:\\SVNBackups\\LOCAL_REPO_NAME.dmp	

	com.p4convert.p4.caseMode=First
	com.p4convert.p4.charset=utf8
	com.p4convert.p4.client=USER_HOST
	com.p4convert.p4.clientRoot=D:\\PerforceWorkspaces\\USER_HOST
	com.p4convert.p4.depotPath=depot

	com.p4convert.p4.port=PERFORCE_HOST:PORT
	com.p4convert.p4.root=

	com.p4convert.p4.subPath=REMOTE_REPO_PATH
	com.p4convert.p4.unicode=true
	com.p4convert.p4.user=USER


### 변환 시작

    :::bat
	java -jar p4convert.jar --config=LOCAL_REPO_NAME.cfg
