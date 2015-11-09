
HISTSIZE=1000000
HISTFILESIZE=20000000

VISUAL=vim
EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]$(__git_ps1_yelp " \[\e[1;36m\](%s)\[\e[0;39m\] ")\$ '


if [ -f "$HOME/git-magic.sh" ]; then
	. ~/git-magic.sh
fi

export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export CLASSPATH=$CLASSPATH:~/algs4/stdlib.jar:~/algs4/algs4.jar

alias tmux='TERM=xterm-256color tmux'
