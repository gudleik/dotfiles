local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_and_host="%{$fg[green]%}%n@%M%{$reset_color%}"
local current_directory="%{$fg[yellow]%}%~%{$reset_color%}"
PROMPT='${user_and_host}%{$fg[grey]%}($(rvm-prompt i v g))%{$reset_color%} ${current_directory}$(git_prompt_info) %B$%b '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
export LSCOLORS="ExFxCxDxBxegedabagacad"
