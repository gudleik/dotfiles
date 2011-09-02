export RUBY_ENV=${RUBY_ENV:-rbenv}

# Prompt
GIT_PROMPT="\[\033[01;33m\]\$(git branch 2>/dev/null|cut -f2 -d\* -s)\[\033[00m\]"
if [ $RUBY_ENV = 'rvm' ]; then
  RUBY_PROMPT="\[\033[00;30m\]rvm:\[\033[02;36m\]\$(~/.rvm/bin/rvm-prompt)"
else
  RUBY_PROMPT="\[\033[00;30m\]rbenv:\[\033[02;36m\]\$(/usr/local/bin/rbenv version-name)"
fi
PATH_PROMPT="\[\033[00;35m\]\w\[\033[00m\]\[\033[01;33m\]"
export PS1="${PATH_PROMPT}${GIT_PROMPT} ${RUBY_PROMPT}\[\033[00;39m\]\n$ "

source ~/.environment
source ~/.bashrc
