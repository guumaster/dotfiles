# cd to dirname(file)
 ffcd()
 {
     if [ $1 ]; then
         cd $(dirname $1)
     fi
 }

# reload source
reload() {
    source ~/.bashrc;
}

setnet() {
    export NETWORK_INTERFACE="$1"
}


# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
phpserver() {
    local port="${1:-4000}"
    local ip=`iplocal ${2}`
    echo "Starting server at ${ip}:${port}"
    #sleep 1 && open "http://${ip}:${port}/" &
    php -q -S "${ip}:${port}"
}

iplocal() {
    local ip=$(ip addr show ${1:-$NETWORK_INTERFACE} | grep -o 'inet [0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' | grep -o [0-9].*)
    echo $ip
}

ippublic() {
    curl http://ifconfig.me
}


# Create a data URL from a file
dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Determine size of a file or total size of a directory
fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}


# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
    function diff() {
        git diff --no-index --color-words "$@"
    }
fi

date() {
  case $1 in
    -R|--rfc-822)
      # Output RFC-822 compliant date string.
      # e.g. Wed, 16 Dec 2009 15:18:11 +0100
      command date '+"%Y-%m-%d %H:%M:%S"' ;;
    -g)
      command date '+%Y%m%d' ;;
    *)
      command date "$@" ;;
  esac
}

# go back x directories
b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

# USEFUL ALIAS FOR EXTRACT KNOW ARCHIVES
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


# Simple calculator
function calc() {
    local result="";
    result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')";
    # └─ default (when `--mathlib` is used) is 20
    #
    if [[ "$result" == *.* ]]; then
        # improve the output for decimal numbers
        printf "$result" |
        sed -e 's/^\./0./' `# add "0" for cases like ".5"` \
            -e 's/^-\./-0./' `# add "0" for cases like "-.5"`\
            -e 's/0*$//;s/\.$//'; # remove trailing zeros
    else
        printf "$result";
    fi;
    printf "\n";
}
## Load all directory files as source
source_dir() {
    for f in $1/*
    do
        source $f
    done

}
