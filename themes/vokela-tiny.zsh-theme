function _virtualenv_prompt_info {
    [[ -n $(whence virtualenv_prompt_info) ]] && virtualenv_prompt_info
}

function _git_prompt_info {
    [[ -n $(whence git_prompt_info) ]] && git_prompt_info
}

function _get_pwd_prompt_info(){
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

PYENV_PROMPT_DEFAULT_VERSION=${PYENV_PROMPT_DEFAULT_VERSION:="system"}

function _pyenv_prompt_info {
    [[ -n $(whence pyenv_prompt_info) ]] && \
        [[ "$(pyenv_prompt_info)" != "${PYENV_PROMPT_DEFAULT_VERSION}" ]] && \
        echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}$(pyenv_prompt_info)${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
}

PROMPT=' %{$fg_bold[green]%}%n@%m:%{$fg[cyan]%}% $(_get_pwd_prompt_info) %{$fg_bold[blue]%}$(_virtualenv_prompt_info)$(_pyenv_prompt_info)$(_git_prompt_info)%{$fg_bold[blue]%}%
 %{$fg_bold[red]%}$ %{$reset_color%}'

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[blue]%}hg:<%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[blue]%}> %{$fg[yellow]%}x "
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[blue]%}>"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:<%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}> %{$fg[yellow]%}x "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}>"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg_bold[blue]%}venv:<%{$fg[red]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$fg[blue]%}> "

ZSH_THEME_PYENV_PROMPT_PREFIX="python:<%{$fg[red]%}"
ZSH_THEME_PYENV_PROMPT_SUFFIX="%{$fg[blue]%}> "
