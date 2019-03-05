export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}

function rbenv_ruby_prompt {
  if [ -f ~/.rbenv/version ]; then
    local ruby_version=$(cat ~/.rbenv/version)
  else
    local ruby_version="system"
  fi

  if [ -n "$ruby_version" ]; then
    echo "$ZSH_THEME_RBENV_PROMPT_PREFIX$ruby_version$ZSH_THEME_RBENV_PROMPT_SUFFIX"
  fi
}

function pwd_prompt_info(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='╭ %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%n@%m:%{$fg[cyan]%} $(pwd_prompt_info) %{$fg_bold[blue]%}$(virtualenv_prompt_info)$(rbenv_ruby_prompt)$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
╰ ➤ '

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

ZSH_THEME_GIT_PROMPT_PREFIX="\ue725 ‹%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}› %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}›"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="\ue73c ‹%{$fg[red]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$fg[blue]%}› "

ZSH_THEME_RBENV_PROMPT_PREFIX="\ue21e ‹%{$fg[red]%}"
ZSH_THEME_RBENV_PROMPT_SUFFIX="%{$fg[blue]%}› "

ZSH_THEME_PYENV_PROMPT_PREFIX="\ue73c:‹%{$fg[red]%}"
ZSH_THEME_PYENV_PROMPT_SUFFIX="%{$fg[blue]%}› "
