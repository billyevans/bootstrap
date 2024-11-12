# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

HISTSIZE=1000000
HISTFILESIZE=20000000

VISUAL=vim
EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 35 || echo 33
}

k1pod() {
  kubectl get pod | grep $1 | head -n 1 | awk '{print $1}'
}

kpods() {
  if [ $# -eq 0 ]; then
    kubectl get pods | fzf | awk '{print $1}'
  else
    kubectl get pods | grep $1 | fzf | awk '{print $1}'
  fi
}

kbash() {
  PODNAME=`kpods $1`
  [ ! -z "$PODNAME" ] && kubectl exec -it $PODNAME -- bash
}

krails() {
  PODNAME=`kpods $1`
  [ ! -z "$PODNAME" ] && kubectl exec -it $PODNAME -- rails c
}

ksh() {
  PODNAME=`kpods $1`
  [ ! -z "$PODNAME" ] && kubectl exec -it $PODNAME -- sh
}

# alias vi=nvim
# alias vim=nvim
alias k='kubectl'
alias tmux='TERM=xterm-256color tmux2'
alias now='date +%s'
alias fuzzy="fd . -t f | fzf"
alias ge="egrep -i 'warn|error|stop|$'"

export PATH="$HOME/.cargo/bin:/usr/local/sbin:/usr/local/bin:/opt/homebrew/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
export CLASSPATH=$CLASSPATH:~/algs4/stdlib.jar:~/algs4/algs4.jar
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

[[ -s "$HOME/.tsla_profile" ]] && source "$HOME/.tsla_profile"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

. "$HOME/.cargo/env"
