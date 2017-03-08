# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi
#PS1='\[\033[1;32;1m\]\u:\W \t$\[\033[1;37;00m\] '
# User specific aliases and functions
test -s ~/bin/bladefunctions && . ~/bin/bladefunctions || true
export VIMRUNTIME="/export/pingzhiguo/shared/vim/runtime"
# not show content on screen of terminal after exit vim
export TERM=xterm
# load my own library
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/export/pingzhiguo/usr/local/lib
export LD_LIBRARY_PATH

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

# export all these for subshells
# export -f get_branch get_git_status is_git_dir
# set terminal prefix color and format
PS1="$FGRN${debian_chroot:+($debian_chroot)}\t \u:$HC\W$RS$FCYN\$(get_branch)\$(get_git_status)$HC $ $RS"

source ~/.git-completion.bash

#alias

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

