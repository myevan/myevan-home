# 깃 스웜 우분투 관리 GitSwarm Ubuntu Adiministration

## 재시작 Restart

전체 서비스 재시작이 필요한 경우는 아래 명령어를 입력합니다.

```bash
$ sudo gitswarm-ctl restart
```

서비스 이름을 명시하면 해당 서비스만 재시작할 수 있습니다.

```bash
$ sudo gitswarm-ctl restart nginx
```

현재 서비스 상태 확인도 가능합니다.

```bash
$ sudo gitswarm-ctl status
```

일부 서비스가 재시작이 제대로 되지 않는다면 강제로 종료할 수 있습니다.

```bash
$ sudo gitswarm-ctl kill sidekiq
```

## 설정 변경 Reconfiguration

설정만 변경할 때는 재시작대신 재설정 명령을 사용합니다.

```
$ sudo gitswarm-ctl reconfigure
```

## 관리 경로 Admin Paths

* /var/opt/gitswarm/git-data/repositories/ 깃 저장소
* /var/opt/gitswarm/perforce/data/ 퍼포스 저장소
* /opt/gitswarm/embedded/service/gitlab-rails/app 깃 랩 앱 
* /opt/gitswarm/embedded/service/gitlab-rails/perforce_swarm 깃 랩 퍼포스 연동
* /home/git-fusion/ 깃 퓨전 관리 홈


## 퍼포스 미러 저장소 삭제 Delete Perforce Mirror Repositories

깃 스웜 저장소를 삭제해도 퍼포스 미러 저장소는 삭제되지 않습니다.

먼저 깃 스웜 저장소의 미러를 중지시킨 다음 깃 퓨전 계정에 접속합니다.

```bash
$ sudo su git-fusion
$ cd ~
```

깃 퓨전 저장소를 삭제합니다.

```bash
$ p4gf_delete_repo.py -y gitswarm-소유자-프로젝트
```

퍼포스 내부의 .git-fusion 저장소와 gitswarm 저장소의 흔적을 완전히 제거합니다.

```bash
$ p4 obliterate -y //.gitswarm/repos/gitswarm-소유자-프로젝트/...
$ p4 obliterate -y //gitswarm/projects/소유자/프로젝트/...
```