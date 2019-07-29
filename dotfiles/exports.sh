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
export PATH=$PATH:$HOME/bin

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

export PATH=$PATH:/opt/bin:$HOME/bin

# NPM

export NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# SNAP
export PATH=$PATH:/snap/bin

# RUST / CARGO
export PATH="$HOME/.cargo/bin:$PATH"

# Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GO111MODULE=on

# Basher
# git clone https://github.com/basherpm/basher.git ~/.basher
export PATH="$HOME/.basher/bin:$PATH"

export BASHER_SHELL=zsh
export BASHER_ROOT=/home/gustavo.marin/.basher
export BASHER_PREFIX=/home/gustavo.marin/.basher/cellar
export BASHER_PACKAGES_PATH=/home/gustavo.marin/.basher/cellar/packages
export PATH="$BASHER_ROOT/cellar/bin:$PATH"
source "$BASHER_ROOT/lib/include.zsh"
source "$BASHER_ROOT/completions/basher.zsh"
fpath=("$BASHER_ROOT/cellar/completions/zsh/compsys" $fpath)
for f in $(command ls "$BASHER_ROOT/cellar/completions/zsh/compctl"); do
  source "$BASHER_ROOT/cellar/completions/zsh/compctl/$f";
done

