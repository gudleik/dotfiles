# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Disable annoying correction
# unsetopt correct_all
# setopt correct

source ~/.environment
source ~/.aliases

fpath=(~/.zsh.custom $fpath)
autoload update-rbenv system-update kssh ec2
