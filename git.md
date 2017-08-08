* [message format](#message-format)
  * [Allowed `<type>`](#allowed-type)
  * [Allowed `<scope>`](#allowed-scope)
  * [Examples](#examples)
* [setting](#setting)
* [how to update nonmaster branch](#how-to-update-nonmaster-branch)
* [apply patch](#apply-patch)
* [ignore files](#ignore-files)
* [blame](#blame)
* [submodule](#submodule)
* [sync pull](#sync-pull)
* [fetch, merge](#fetch-merge)
* [know more about origin, pull, push](#know-more-about-origin-push-pull)
* [how to create and delete a remote branch](#how-to-create-a-remote-branch)


## message format
[Commit Message Conventions](https://gist.github.com/stephenparish/9941e89d80e2bc58a153)

content of .gitmessage.txt
------
> &lt;type>(&lt;scope>): &lt;subject> 
> 
> &lt;body>
> 
> &lt;footer>

#### Allowed `<type>`
* feat (feature)
* fix (bug fix)
* docs (documentation)
* style (formatting, missing semi colons, …)
* refactor
* test (when adding missing tests)
* chore (maintain)

#### Allowed `<scope>`
Scope could be anything specifying place of the commit change. For example $location, $browser, $compile, $rootScope, ngHref, ngClick, ngView, etc...
* Message footer
  * Referencing issues: Closes #123, #245, #992
  * Breaking changes: 

Examples
------
```
feat($browser): onUrlChange event (popstate/hashchange/polling)

Added new event to $browser:
- forward popstate event if available
- forward hashchange event if popstate not available
- do polling when neither popstate nor hashchange available

Breaks $browser.onHashChange, which was removed (use onUrlChange instead)
```

```
fix($compile): couple of unit tests for IE9

Older IEs serialize html uppercased, but IE9 does not...
Would be better to expect case insensitive, unfortunately jasmine does
not allow to user regexps for throw expectations.

Closes #392
Breaks foo.bar api, foo.baz should be used instead
```

```
feat(directive): ng:disabled, ng:checked, ng:multiple, ng:readonly, ng:selected

New directives for proper binding these attributes in older browsers (IE).
Added coresponding description, live examples and e2e tests.

Closes #351
```

```
style($location): add couple of missing semi colons
```

```
docs(guide): updated fixed docs from Google Docs

Couple of typos fixed:
- indentation
- batchLogbatchLog -> batchLog
- start periodic checking
- missing brace
```

## setting
```
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
$ git config --global core.editor vim
$ git config --global commit.template ~/.gitmessage.txt
$ git config --global http.proxy 'http://127.0.0.1:1087'  // set proxy as shadowsocks
$ git config --global https.proxy 'http://127.0.0.1:1087'
```

## how to update nonmaster branch
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

## apply patch
```
diff -u sa/query_server.ini ~/9-test/query_server.ini > ini.patch
vi ini.patch   # modify the query.ini path in init.patch
ll s? [tab tab]# get array: sa/ sb/ ...
./do_patch.sh ini.patch sa/ sb/ ...
```

## ignore files
.gitignore<br/>
.git/info/exclude<br>

## blame
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

## sync pull
```
git clone git@git.jd.com:ads-serving/adserver.git
git submodule update --init --recursive

git pull <远程主机名> <远程分支名>:<本地分支名>
git pull origin next:master
git pull origin next   ( == git fetch origin; git merge origin/next)
```

## fetch, merge
```
git fetch origin
git merge origin/an-other-branch
```

## know more about origin push pull
```
git clone https://github/b.git -- a
cd a
git remote -v
#we can see "origin" refers to a fetch repository and a push repository, both  https://github/b.git
 
git remote add hello https://github/d.git
git remote -v
#we can see "hello" refers to a fetch repository and a push repository, both https://github/d.git
 
git remote set-url --push hello https://github/c.git
git remote -v
#we can see "hello" refers to a push repository https://github/c.git and a fetch repository https://github/d.git
 
git remote add self .
git remote -v
#we can see "self" refers to a push repository, ".", and a fetch repository, "." too. It is the current repository itself.
 
#now we are going to create a new branch new_master in b.git by git-push
git push origin HEAD:refs/heads/new_master
#equivalent to "git push https://github/b.git HEAD:refs/heads/new_master"
 
#now we are goting to fetch from b.git
git fetch origin
#or "git fetch https://github/b.git"
 
#now we are going to push the local master to c.git
git push hello master:master
#equivalent to "git push https://github/c.git master:master"
 
git pull hello master
#it fetches from d.git instead of c.git
#if we want to pull from c.git
git pull https://github/c.git master
#"hello" is not used here since pull through "hello" is only from b.git
 
#now we are going to communicate with the current repository
git push self HEAD:self_master
#it creates a new local branch self_master. Equivalent to "git push . HEAD:self_master". The "." or "self" can be replace with the absolute path of the current repository.
```

## how to create a remote branch
```
git checkout -b <branch-name>
git push <remote-name> <branch-name>  # remote-name: origin
git push <remote-name> <local-branch-name>:<remote-branch-name>
# if to use :<remote-branch-name> (with the colon), the remote branch will be deleted!
git push -u <remote-name> <local-branch-name>
# delete a remote branch
git push origin :the_remote_branch  # or  git push origin --delete the_remote_branch
git fetch -p  # -p, --prune After fetching, remove any remote-tracking branches which no longer exist on the remote.
```
