# Taken mostly from the robbyrussell theme
# Adapted slightly for personal taste and solarized dark terminal theme
local return_status="%(?:%F{green}➜ %f:%F{red}➜ %f)"
PROMPT='${return_status}[%F{cyan}%c%f$(git_prompt_info)]$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{blue}(%f%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue})%f %F{yellow}✗%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue})%f"
