export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/X11/bin

# If not running interactively, don't do anything
if [ -n "$PS1" ]; then

  # Load bash completion
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
  
  # Don't want mailcheck enabled
  unset   MAILCHECK
  
  # Load aliases
  source ~/.aliases

  # RVM or RBENV
  if [ "$RUBY_ENV" = "rvm" ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  
  else
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  fi

fi
