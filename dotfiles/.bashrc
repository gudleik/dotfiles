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

  # RVM
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
  #complete -C $rvm_scripts_path/rvm-completion.rb -o default rvm
fi
  
