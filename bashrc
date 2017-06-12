
HISTSIZE=1000000
HISTFILESIZE=20000000

VISUAL=vim
EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;31m\]\w\[\e[0;39m\]$ '


if [ -e "/etc/bash.bashrc.d/yelpdev.sh" ]; then
	. /etc/bash.bashrc.d/yelpdev.sh
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

ssh_to_aws() {
    instance_id=$1
    accounts="dev prod"
    regions="us-west-1 us-west-2 us-east-1"
    ip_address=''
    for account in $accounts; do
        for region in $regions; do
            json=$(aws --profile $account --region $region ec2 describe-instances --instance-id $instance_id 2>/dev/null)
            if [ $? -eq 0 ]; then
                ip_address=$( echo $json | jq -r .Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddress )
                echo "Found $ip_address in $region $account"
                break
            fi
        done
        if [ -n "$ip_address" ]; then
            break
        fi
    done
    if [ -n $ip_address ]; then
        echo "SSHing to $ip_address"
        ssh -A $ip_address
    fi
}
