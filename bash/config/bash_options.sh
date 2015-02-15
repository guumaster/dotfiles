shopt -s cdspell
shopt -s nocaseglob
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob
shopt -s progcomp
# append to the history file, don't overwrite it
shopt -s histappend
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
#shopt -s autocd
#shopt -s dirspell
shopt -s direxpand

set -o ignoreeof
set bell-style none

unset MAILCHECK                           # disable "you have mail" warning
ulimit -S -c 0                            # disable core dump
#bind "set completion-ignore-case on"      # ignore case on bash completion
#bind "set mark-symlinked-directories on"  # add trailing slash to symlinked directories
