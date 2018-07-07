setopt PROMPT_SUBST

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"

function vcs_prompt_info {
      git_prompt_info
}

function vcs_status {
      git_prompt_status
}

PROMPT='C:%{${${${(%):-%~}//\//\\}/\~/\\\$DADDY}%${#${${(%):-%~}//\//\\}/\~/\\\$HOME}G%}>::($(vcs_prompt_info)) '
setopt PROMPT_SUBST

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}dirty ;)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}good%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+%{$reset_color%}"

function vcs_prompt_info {
      git_prompt_info
}

function vcs_status {
      git_prompt_status
}

PROMPT='C:%{${${${(%):-%~}//\//\\}/\~/\\\$DADDY}%${#${${(%):-%~}//\//\\}/\~/\\\$HOME}G%}>::($(vcs_prompt_info)) '
