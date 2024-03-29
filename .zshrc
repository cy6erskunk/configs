# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="spaceship"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"


# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
#########
# autojump has to be installed first (`brew install autojump`)
#########
plugins=(git autojump frontend-search npm kubectl asdf)

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local
[[ -f ~/.zshrc_aliases ]] && source ~/.zshrc_aliases

#########
# nmv (do not use together with nodenv)
#########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#########
# nodenv (do not use together with nvm)
#########
#[ $(command -v nodenv) ] && eval "$(nodenv init -)"

#########
# go
#########
[[ -e /usr/local/go/bin ]] && export PATH=$PATH:/usr/local/go/bin
[[ -e $HOME/go ]] && export GOPATH=$HOME/go

#########
# perforce p4
#########
export P4CONFIG=.p4config

#########
# rbenv (do not use together with rvm)
#########
[ $(command -v rbenv) ] && eval "$(rbenv init -)"
#########
# rvm (do not use together with rbenv)
#########
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
#########
# Function to find parent Docker images to get rif of the following error:
# conflict: unable to delete xxx (cannot be forced) - image has dependent child images
#########
docker_parents(){
    [ $# -eq 0 ] && { echo "Usage: $0 image_hash"; return 1; }
    for i in $(docker images -q); do docker history $i|grep -q $1 && echo $i; done | sort -u
}
#########
# openjdk
#########
[ -e /opt/homebrew/opt/openjdk@11/bin ] && export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

##########
# starship - make sure there's no ZSH_THEME enabled
##########
eval "$(starship init zsh)"
