export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="bira-rbenv"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github git-flow thor history-substring-search knife ruby osx brew gem pip rails3 bundler cap pow)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH="$PATH:/Users/trym/.ec2/bin:/Users/trym/.aws_rds/bin"

unsetopt auto_name_dirs

# Disable annoying correction
unsetopt correct_all
setopt correct

source ~/.environment

# history search up/down
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# ALIASES
alias -g psg='ps aux | grep'
alias la='ls -la'
alias l='less'
alias grep='grep --color=auto'
alias n='nc -vz'

# Bundler aliases
alias b='bundle'
alias bi="b install --path vendor"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
