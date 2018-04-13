# .bash_profile

# export
# setting go environment
PATH=$PATH:$(go env GOPATH)/bin
export PATH
export GOPATH=$(go env GOPATH)
# enable core dump
ulimit -c unlimited

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# \d – Current date
# \t – Current time
# \h – Host name
# \# – Command number
# \u – User name
# \W – Current working directory (ie: Desktop/)
# \w – Current working directory with full path (ie: /Users/Admin/Desktop/)
# export all these for subshells
# export -f get_branch get_git_status is_git_dir
# set terminal prefix color and format
PS1="$FGRN\t \u:$HC\W$RS$FCYN\$(get_branch)\$(get_git_status)$HC $ $RS"

source ~/.git-completion.bash

#alias
alias vi='/usr/local/bin/vim'

alias cdsapient='cd $HOME/go/src/sapient'
alias ll='ls -l'
alias asshjenkins='ssh -i ~/.ssh/id_rsa jenkins@127.0.0.1'

#enable_proxy

# terminal proxy
enable_proxy() {
    export http_proxy=http://127.0.0.1:1087
    export https_proxy=http://127.0.0.1:1087
}

disable_proxy() {
    unset http_proxy
    unset https_proxy
}

function scp2jump() {
# outside: rd@60.205.90.134:/storage  passwd: t2y6RIKy5aNjcTLi
# inside:  rd@10.172.155.182:/storage
  scp -P 10199 $@ rd@192.168.0.6:/storage
}

function scp4jump() {
  for arg in "$@"; do
    scp -P 10099 rd@192.168.0.10:/storage/$arg .
  done
}

# functions
function is_git_dir {
  git rev-parse --is-inside-work-tree &> /dev/null
}

function get_branch {
  if is_git_dir
  then
    local BR=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2> /dev/null)
    if [ "$BR" == HEAD ]
    then
      local NM=$(git name-rev --name-only HEAD 2> /dev/null)
      if [ "$NM" != undefined ]; then
        echo -n "&$NM"
      else
        git rev-parse --short HEAD 2> /dev/null
      fi
    else
      echo -n "&$BR"
    fi
  fi
}

function get_git_status {
  if is_git_dir
  then
    local ST=$(git status --short 2> /dev/null)
    if [ -n "$ST" ]; then
      echo -n "*"
    else
      echo -n ""
    fi
  fi
}
