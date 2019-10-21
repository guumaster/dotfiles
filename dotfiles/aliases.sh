#vi:ft=sh
# Easier navigation: .., ..., ~ and -
alias ..='cd ..'         # Go up one directory
alias cd..="cd .."
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up two directories
alias -- -='cd -'        # Go back

# ls
alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

# show hidden files only
alias l.='ls -d .* --color=auto -alFh'

# mv, rm, cp
# alias mv='mv -v'
# alias rm='rm -i -v'
# alias cp='cp -v'

alias ag='ag -f --hidden'

# commands
alias myip='curl ifconfig.me'

alias clipboard='xclip -sel clip' ## Needs xclip installed

alias ws='cd $WORKSPACE'


# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

fi

# Sys info
alias cpu='cat /proc/cpuinfo'
alias mem='cat /proc/meminfo'
alias topmem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

alias psgrep="ps aux | egrep -v egrep | egrep"


# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

#general
alias hg='history | ag'
alias -g gp='| ag -i '
alias sudo='sudo '

# Manage your config with git
alias config='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# TODO-txt-CLI
alias t="todo"

alias lt="$HOME/.npm-packages/bin/lt"

# Python3
alias python="/usr/bin/python2"
alias pip="/usr/bin/pip2"

# docker
alias dco="docker-compose"

# kubectl
alias kctl="kubectl"
alias kgt="k8s_get_token"
alias kdp="k8s_delete_pod"
alias kgpa="kubectl get pod --all-namespaces"
alias kiff="sudo iptables -P FORWARD ACCEPT && echo \"All your issues are solved.\""

