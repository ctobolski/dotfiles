local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
NEWLINE=$'\n'
local time="%{$fg_bold[yellow]%}[[ %T%  ]]%{$reset_color%}"
#PROMPT="%{$fg_bold[cyan]%}%~%{$reset_color%}$(git_prompt_info)${NEWLINE}${ret_status} %{$fg[cyan]%}%{$reset_color%}"
PROMPT='${time} %{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)${NEWLINE}${ret_status} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
