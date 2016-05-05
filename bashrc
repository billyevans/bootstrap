
HISTSIZE=1000000
HISTFILESIZE=20000000

VISUAL=vim
EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;31m\]\w\[\e[0;39m\]$ '


if [ -f "$HOME/git-magic.sh" ]; then
	. ~/git-magic.sh
	PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;31m\]\w\[\e[0;39m\]$(__git_ps1_yelp " \[\e[1;36m\](%s)\[\e[0;39m\] ")\$ '
fi

export PATH="$HOME/.cargo/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export CLASSPATH=$CLASSPATH:~/algs4/stdlib.jar:~/algs4/algs4.jar
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include

alias tmux='TERM=xterm-256color tmux'

if [ -f "/usr/local/bin/aws_completer" ]; then
	complete -C '/usr/local/bin/aws_completer' aws
fi

if [ -f "/usr/local/etc/bash_completion" ]; then
	. /usr/local/etc/bash_completion
fi
