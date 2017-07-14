## setting
```
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
$ git config --global core.editor vim
$ git config --global commit.template ~/.gitmessage.txt
```
content of .gitmessage.txt
> subject line
> 
> what happened
> 
> [ticket: X]

## use git to update nonmaster branch  2017.1.11
```
; sync latest code and create local branch to remote rb branch
git fetch
git branch -a
git checkout -b lc.rb143.0117 remotes/origin/an-other-branch
; sync submodule dependence
git submodule init
git submodule sync
git submodule update --init --recursive
; sync latest code of remote rb branch
git fetch origin
; cherry pick from master branch
git cherry-pick md5_commit_id
git diff remotes/origin/rb-xxx
; if submodule changed, commit it
cd submodule_dir
git branch
git checkout master  # if not on master
git pull
cd ..
git diff
git add submodule_dir
git status -s
git commit -m"......"
git log  # check all main module and sub module have been commit
; push to remote
git push origin lc.rb143.0117:rb-xxx
```

## apply patch  2017.1.5
```
diff -u sa/query_server.ini ~/9-test/query_server.ini > ini.patch
vi ini.patch   # modify the query.ini path in init.patch
ll s? [tab tab]# get array: sa/ sb/ ...
./do_patch.sh ini.patch sa/ sb/ ...
```

## ignore files
.gitignore<br/>
.git/info/exclude<br>

## blame  2017.1.3
```
git blame, Show what revision and author last modified each line of a file
git blame filename
git blame <commit>^ -- filename | head -3 | tail -2
```

## submodule
```
git submodule init	# sync submodule
git submodule sync
git submodule update --init --recursive
git fetch origin  	#远程分支更新拉回本地
git cherry-pick md5_commit_id
git diff remotes/origin/rb-xxx
git push origin local-rb-143:rb-xxx
```
submoduleA
```
git add submoduleA
git diff submoduleA
git add submoduleA
git commit -m"submodule cherry-pick md5_commit_id"
git push origin local-rb-143:rb-143
```

## sync code, pull 2016.12.12
```
git clone git@git.jd.com:ads-serving/adserver.git
git submodule update --init --recursive

git pull <远程主机名> <远程分支名>:<本地分支名>
git pull origin next:master
git pull origin next   ( == git fetch origin; git merge origin/next)
```

## fetch, merge 2016.3.8
```
git fetch origin
git merge origin/an-other-branch
```

