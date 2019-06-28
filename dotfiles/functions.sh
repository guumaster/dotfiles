# vi: ft=sh
# cd to dirname(file)
 ffcd()
 {
     if [ $1 ]; then
         cd $(dirname $1)
     fi
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

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
	if [ -f "$1" ] ; then
		local filename=$(basename "$1")
		local foldername="${filename%%.*}"
		local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
		local didfolderexist=false
		if [ -d "$foldername" ]; then
			didfolderexist=true
			read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
			echo
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				return
			fi
		fi
		mkdir -p "$foldername" && cd "$foldername"
		case $1 in
			*.tar.bz2) tar xjf "$fullpath" ;;
			*.tar.gz) tar xzf "$fullpath" ;;
			*.tar.xz) tar Jxvf "$fullpath" ;;
			*.tar.Z) tar xzf "$fullpath" ;;
			*.tar) tar xf "$fullpath" ;;
			*.taz) tar xzf "$fullpath" ;;
			*.tb2) tar xjf "$fullpath" ;;
			*.tbz) tar xjf "$fullpath" ;;
			*.tbz2) tar xjf "$fullpath" ;;
			*.tgz) tar xzf "$fullpath" ;;
			*.txz) tar Jxvf "$fullpath" ;;
			*.zip) unzip "$fullpath" ;;
			*) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
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

cpdate() {
 DATE=`date +%Y%m%d`
 echo "backup..."
 for f in $*; do
     echo "    $f to $f.$DATE"
     cp $f $f.$DATE -r;
 done
 echo "done."
}

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
