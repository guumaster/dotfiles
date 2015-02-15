alias _='sudo'
alias h='history'
alias myip='curl ifconfig.me'

alias ws='cd $WORKSPACE'

alias clipboard='xclip -sel clip' ## Needs xclip installed

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


# Show local functions
alias localfn="declare -F |  grep -v  \"declare -f _\" | awk '{print \$3}'"

