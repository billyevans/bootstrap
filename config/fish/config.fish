

set -U VISUAL vim
set -U EDITOR vim

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;31m\]\w\[\e[0;39m\]$ '


export PATH="$HOME/.cargo/bin:/usr/local/sbin:/usr/local/bin:$PATH"

set -x CLASSPATH $CLASSPATH ~/algs4/stdlib.jar ~/algs4/algs4.jar
set -U OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include

alias tmux='TERM=xterm-256color tmux'


function fish_prompt
	set_color 62A -o
	echo -n (whoami)
	set_color normal
	echo -n "@"
	set_color green -o
	echo -n (hostname | cut -d . -f 1)
	set_color normal
	echo -n " "
	set_color red -o
	echo -n (prompt_pwd)
	set_color normal
	echo -n "> "
end
