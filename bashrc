
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# export PS1="\u@\[\033[32m\]\w\[\033[\$(acolor)m\]\$(git_branch)\[\033[00m\]\$ "
export PS1="\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;31m\]\w\[\033[\$(acolor)m\]\$(git_branch)\[\e[0;39m\]$ "

if [ -f "/usr/local/bin/aws_completer" ]; then
	complete -C '/usr/local/bin/aws_completer' aws
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source /Users/alexeypervushin/.config/broot/launcher/bash/br
