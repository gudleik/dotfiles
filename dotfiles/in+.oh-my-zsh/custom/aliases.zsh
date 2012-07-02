# ALIASES                                                                                                                                                                                                                                                                                  
alias -g psg='ps aux | grep'
alias la='ls -la'
alias l='less'
alias grep='grep --color=auto'
alias n='nc -vz'

alias deploy='cd ~/code/skalar/DevOps/Deploy'

function install-default-gems() {
  gem install bundler dotty git-smart pry pry-doc pry-editline awesome_print hirb
}
