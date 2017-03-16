# 깃 스웜 헬릭스 미러 리포지터리 삭제 이슈

## 환경

* Ubuntu-x64-14.04
* GitSwarm-2016.3

## 재현

깃 스웜 프로젝트 저장소를 삭제해도 헬릭스 미러 저장소가 삭제되지 않습니다. 

직접 깃 퓨전 저장소와 퍼포스 저장소를 삭제하더라도 같은 이름을 가진 깃 스웜 프로젝트의 헬릭스 미러를 만들 수 없습니다.

## 상황

깃 퓨전 저장소가 삭제된 것을 확인할 수 있습니다.

```bash
$ p4gf_delete_repo.py -y gitswarm-소유자-프로젝트
$ p4 changes //.git-fusion/repos/gitswarm-소유자-프로젝트/...
Change 42 on 2017/03/15 by git-fusion-user@git-fusion--gitswarm-b717ccbe-097c-11e7-a001-000c292319b4 Delete repo config for 'gitswarm-소유자-프로젝트'
Change 41 on 2017/03/15 by git-fusion-user@git-fusion--gitswarm-b717ccbe-097c-11e7-a001-000c292319b4 Deleting 27 commit objects for repo 'gitswarm-소유자-프로젝트'
Change 40 on 2017/03/15 by git-fusion-user@git-fusion--gitswarm-b717ccbe-097c-11e7-a001-000c292319b4 Update 'p4gf_config'
```

퍼포스 디포상으로는 삭제된 것으로 보입니다.

* .git-fusion
    * objects
    * users
* depot
* gitswarm


재생성한 프로젝트에 헬릭스 미러를 활성화하면 설정 에러가 표시됩니다.

    Helix Mirroring

    Select a Helix server to mirror the project to

    Helix Git Fusion Server: local(git-fusion@localhost)

    Configuration Error:
    A Git Fusion repository already exists with the name(gitswarm-소유자-프로젝트). You can import the existing Git Fusion Repository into a new project. Please this document for help.


## 원인

깃 스웜에서 헬릭스 미러 존재 여부 확인시 삭제한 저장소도 존재한다고 판단합니다.


## 분석

깃 랩 레일즈 퍼포스 스웜 깃 퓨전 모듈 저장소 생성자에서 처리됩니다.

```bash
$ vim /opt/gitswarm/embedded/service/gitlab-rails/perforce_swarm/lib/perforce_swarm/git_fusion/repo_creator.rb
```

미러 저장시 이미 퍼포스 경로가 존재한다면 예외를 발생시킵니다.

```ruby
module PerforceSwarm
  module GitFusion
    class RepoCreator
      # run pre-flight checks for:
      #  * both //.git-fusion and any referenced depots exist
      #  * Git Fusion repo ID is not already in use (no p4gf_config for the specified repo ID)
      # if any of the above conditions are not met, an exception is thrown
      def save_preflight(connection)
        # ensure we have a repo_name
        raise 'Repo name was not specified.' unless repo_name

        # ensure both //.git-fusion and target depots exist
        validate_depots(connection)

        # ensure there isn't already a Git Fusion repo with our ID
        if perforce_path_exists?(perforce_p4gf_config_path, connection)
          raise "A Git Fusion repository already exists with the name (#{repo_name}). " \
               'You can import the existing Git Fusion repository into a new project!'
        end
      end
    end
  end
end
```
      
미러 저장소 경로에 파일 리스트를 1줄 얻는 시도를 하고 예외 발생시 저장소가 존재하지 않는다고 판단합니다.

```ruby
module PerforceSwarm
  module GitFusion
    class RepoCreator
      # returns true if there are any files (even deleted) at the specified depot path, otherwise false
      def perforce_path_exists?(path, connection)
        # normalize path to not have a trailing slash or Perforce wildcard
        path.gsub!(%r{[/]+(\.\.\.)?$}, '')
        # check both the path as a file and path/... (as a directory)
        [path + '/...', path].each do |depot_path|
          begin
            result = connection.run('files', '-m1', depot_path)

            # if we found something, the path exists for our purposes
            return true
          rescue P4Exception => e
            # ignore messages due to non-existent files or depots
            raise e unless e.message.include?('- no such file') || e.message.include?('- must refer to client')
          end
        end
        false
      end    
    end
  end
end
```

퍼포스 명령을 직접 실행해보면 no such file 대신 삭제된 목록이 표시되는 것을 확인할 수 있습니다.

```bash
$ p4 files -m1 /.git-fusion/repos/gitswarm-root-myevan/...
```

## 해결

퍼포스 관리자 권한을 사용해 저장소 흔적을 완전히 제거합니다.

```bash
$ p4 obliterate -y //.gitswarm/repos/gitswarm-소유자-프로젝트/...
$ p4 obliterate -y //gitswarm/projects/소유자/프로젝트/...
```