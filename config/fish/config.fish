

set -U VISUAL vim
set -U EDITOR vim

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

#PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;31m\]\w\[\e[0;39m\]$ '

set -x PATH $HOME/.cargo/bin /usr/local/sbin /usr/local/bin /usr/local/opt/python/libexec/bin $PATH

set -x CLASSPATH $CLASSPATH ~/algs4/stdlib.jar ~/algs4/algs4.jar
set -x GOPATH $HOME/src/goprojects

set -U OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
set -x FONTCONFIG_PATH /opt/X11/lib/X11/fontconfig

alias tmux='TERM=xterm-256color tmux'
alias weather='curl http://wttr.in/sf'

set -U fish_color_user 62A -o
set -U fish_color_host green -o
set -U fish_color_cwd red -o

#function fish_prompt
#	set_color 62A -o
#	echo -n (whoami)
#	set_color normal
#	echo -n "@"
#	set_color green -o
#	echo -n (hostname | cut -d . -f 1)
#	set_color normal
#	echo -n " "
#	set_color red -o
#	echo -n (prompt_pwd)
#	set_color normal
#	echo -n "> "
#end
