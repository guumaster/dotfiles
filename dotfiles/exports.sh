# vi: ft=sh
export EDITOR=vim
export GREP_COLOR="4;33"

export LESS_TERMCAP_mb=$'\E[04;33m'
export LESS_TERMCAP_md=$'\E[04;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'

export WORKSPACE=/home/workspace
export PATH=$PATH:$HOME/bin/

# Configure less.

# Default options/flags for less.
#
# Use a verbose prompt, Vim like 'smartcase' search, and interpret color codes
# and escape sequences.
export LESS='-i -R -X -F'

# Display multi-byte characters.
export LESSCHARSET=utf-8

# Remember upto 1000 history items.
export LESSHISTSIZE=10000

# Use less as the standard pager.
export PAGER=less

# Use less for viewing man pages.
export MANPAGER=$PAGER

