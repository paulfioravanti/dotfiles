# Taken mostly from the robbyrussell theme
# Adapted slightly for personal taste and solarized dark terminal theme
local return_status="%(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ )"
PROMPT='${return_status}${reset_color}[%{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info)${reset_color}]$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
