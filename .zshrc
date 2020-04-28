# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_MODE="nerdfont-fontconfig"
#ZSH_THEME=powerlevel10k/powerlevel10k
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

bindkey "[D" backward-word
bindkey "[C" forward-word


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"
SAVEHIST=100000
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
export PATH="/opt/Postman:$PATH"
export PATH="$HOME/bin:$PATH"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#PROJECT_PATHS=(~/workspace/programming/code ~/workspace/compartido ~/workspace/programming/code/libs)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git zsh-completions node npm tmux tmuxinator gitfast git-extras pj debian autoenv)
plugins=(gitfast history git-extras helm kubectl minikube web-search golang hostctl)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

setopt inc_append_history
setopt share_history
setopt auto_cd
setopt appendhistory autocd extendedglob notify

autoload -Uz compinit
compinit
#zstyle ':completion:*' menu select
bindkey -e
zstyle :compinstall filename '/home/guu/.zshrc'

# Load Antigen
source ~/antigen.zsh

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

# antigen theme bhilburn/powerlevel9k powerlevel9k
# antigen bundle mafredri/zsh-async
# antigen bundle marszall87/lambda-pure
# antigen theme robbyrussell
#antigen theme jdavis/zsh-files themes/jdavis
#antigen theme refined
antigen theme romkatv/powerlevel10k

#
# Antigen Bundles
#
#antigen bundle autoenv
antigen bundle node
# antigen bundle npm
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle heroku
#antigen bundle kubectl
antigen bundle pip
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git
antigen bundle git-extras
antigen bundle gitfast
antigen bundle git-flow
antigen bundle pj
antigen bundle z
antigen bundle themes
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle npm
antigen bundle ng
antigen bundle tmux
antigen bundle rupa/z
antigen bundle tmuxinator
antigen bundle sudo
antigen bundle mafredri/zsh-async
antigen bundle zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle trapd00r/zsh-syntax-highlighting-filetypes
antigen bundle tarruda/zsh-autosuggestions
# Get Media
antigen bundle soimort/you-get

# Tell antigen that you're done.
antigen apply

# My stuff

unalias cp
unalias rm
source ~/dotfiles/exports.sh
source ~/dotfiles/functions.sh
source ~/dotfiles/aliases.sh
source ~/bin/k8s_env.sh


# Nice colors
eval $( dircolors -b $HOME/.dircolors )
eval "$(direnv hook zsh)"
function gignore() { curl -L -s https://www.gitignore.io/api/$@ ;}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f $HOME/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . $HOME/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f $HOME/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . $HOME/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f $HOME/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . $HOME/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

