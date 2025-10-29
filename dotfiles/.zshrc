autoload colors && colors
autoload -Uz vcs_info

setopt auto_cd \
       no_menu_complete \
       auto_menu \
       correct \
       multios \
       extended_glob \
       no_hup \
       no_check_jobs \
       hist_ignore_dups \
       no_nomatch \
       completeinword \
       listtypes \
       long_list_jobs \
       notify \
       prompt_subst \

unsetopt HIST_VERIFY
[[ $- == *i* ]] && setopt share_history

: ${ZDOTDIR:=$HOME}
HISTFILE="$ZDOTDIR/.zshhistory"
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# {{{ prompt + vcs config

function precmd() {
  vcs_info

  local NEWLINE=$'\n'
  local PROMPT_LOGIN="%n%{$fg_bold[yellow]%} @ %{$reset_color%}%m"
  local PROMPT_DIR='%2~'

  PROMPT="$PROMPT_LOGIN [$PROMPT_DIR]"
  PROMPT+=" %{$fg[green]%}$CONDA_PROMPT_MODIFIER%{$reset_color%}"
  PROMPT+="$NEWLINE%{$fg[yellow]%}$%{$reset_color%} "

  if [[ ! ${vcs_info_msg_0_} = "" ]] ; then
      RPROMPT="[%{$fg[blue]%}${vcs_info_msg_0_}%{$reset_color%}]"
  else
      RPROMPT=""
  fi
}

function +vi-git-remotebranch() {
    local remote

    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2> /dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        hook_com[branch]="${hook_com[branch]} (${remote})"
    else
        hook_com[branch]="${hook_com[branch]}"
    fi
}

zstyle ":vcs_info:git*+set-message:*" hooks git-remotebranch
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b"

# }}}

# {{{ exports

_prepend() {
    local _varname="$1"
    local _dirname="$2"

    if [[ -d "$_newdir" ]]; then
        return 0
    fi

    typeset -g _ref="$_varname"

    if [[ -z "$_ref" ]]; then
        _ref="$_newdir"
        return 0
    fi

    if [[ ":$_ref:" != *":$_newdir:"* ]]; then
        _ref="$_newdir:$_ref"
    fi
}

_prepend PATH "$HOME/.local/bin"
_prepend PATH "$HOME/flatpak/exports/bin"
_prepend PATH "$HOME/.local/share/flatpak/exports/bin"

if [[ -z "$CUDA_HOME" ]]; then
    for _cuda_root in /opt/cuda /usr/local/cuda "$HOME/cuda"; do
        if [[ -d "$_cuda_root" ]]; then
            export CUDA_HOME="$_cuda_root"
            break
        fi
    done

    if [[ -d "$CUDA_HOME/lib64" ]]; then
        _prepend LD_LIBRARY_PATH "$CUDA_HOME/lib64"
        _prepend LIBRARY_PATH    "$CUDA_HOME/lib"
    fi

    unset _cuda_root
fi

# editor selection
if (( $+commands[nvim] )); then
    export EDITOR="$(command -v nvim)"
elif (( $+commands[vim] )); then
    export EDITOR="$(command -v vim)"
elif (( $+commands[vi] )); then
    export EDITOR="$(command -v vi)"
else
    [[ $- == *i* ]] && echo "Nvim/vim/vi not found, defaulting to nano :("
    export EDITOR="$(command -v nano)"
fi

export SUDO_EDITOR=$EDITOR

# tex
if [[ -d "/usr/local/texlive/2025" ]]; then
    _prepend PATH     "/usr/local/texlive/2025/bin/x86_64-linux"
    _prepend MANPATH  "/usr/local/texlive/2025/texmf-dist/doc/man"
    _prepend INFOPATH "/usr/local/texlive/2025/texmf-dist/doc/info"
fi

# }}}

# {{{ aliases

if ls --color=auto > /dev/null 2>&1; then
    alias ls="ls --color=auto"
else
    alias ls="ls -G"
fi
alias l="ls -al"

command -v kitten >/dev/null && alias s="kitten ssh"

alias vi="$EDITOR"
alias pydev='conda activate dev'
alias pycl='PYOPENCL_CTX=0:0 python'
alias pyclt='PYOPENCL_TEST=0:0 python -m pytest'

# }}}

# {{{ plugins/utilities/etc.

if [[ -d "/usr/share/zsh/plugins" ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if command -v fzf >/dev/null; then
    if fzf --zsh >/dev/null; then
        source <(fzf --zsh)
    elif [[ -r ~/.fzf.zsh ]]; then
        source ~/.fzf.zsh
    fi
fi

# }}}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aj/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aj/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/aj/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aj/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/aj/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/aj/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# insert after mamba / conda to capture full base env with these in place
# WARNING: will override any LLVM tools that exist in conda/mamba packages

if [[ -r "$HOME/dotfiles/scripts/env/llvm-env.sh" ]]; then
    source "$HOME/dotfiles/scripts/env/llvm-env.sh"
    command -v llvm-use >/dev/null && llvm-use
fi
