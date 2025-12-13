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
       prompt_subst

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
  local _var="$1" _dir="$2" cur
  [[ -d "$_dir" ]] || return 0

  cur="${(P)_var}"
  if [[ -z "$cur" ]]; then
    typeset -g "$_var=$_dir"
  elif [[ ":$cur:" != *":$_dir:"* ]]; then
    typeset -g "$_var=$_dir:$cur"
  fi
}

_prepend PATH "$HOME/.local/bin"
_prepend PATH "$HOME/flatpak/exports/bin"
_prepend PATH "$HOME/.local/share/flatpak/exports/bin"
_prepend PATH "$HOME/.pixi/bin"

if [[ "$OSTYPE" == linux* && -z ${CUDA_HOME:-} ]]; then
    for _cuda_root in /opt/cuda /usr/local/cuda "$HOME/cuda" /usr/local/cuda-[0-9]*; do
        [[ -d "$_cuda_root" ]] || continue
        export CUDA_HOME="$_cuda_root"
        break
    done
    unset _cuda_root
fi

if [[ -n ${CUDA_HOME:-} ]]; then
  _prepend PATH "$CUDA_HOME/bin"
  if [[ -d "$CUDA_HOME/lib64" ]]; then
      _prepend LD_LIBRARY_PATH "$CUDA_HOME/lib64"
  fi
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

# {{{ plugins/utilities/etc.

if [[ "$HOST" == ("benign"|"farewell") ]]; then
    _plugins_dir="$HOME/.zshplugins"
    [[ ! -d $_plugins_dir ]] && mkdir $_plugins_dir

    local _plugins=(
        zsh-autosuggestions
        zsh-syntax-highlighting
    )

    export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

    for _plugin in ${_plugins[@]}; do
        if [[ ! -d "$_plugins_dir/$_plugin" ]]; then
            git clone -q --depth 1 https://github.com/zsh-users/"$_plugin" \
                "$_plugins_dir/$_plugin"
        fi
        # guard against clone failures
        if [[ -d "$_plugins_dir/$_plugin" ]]; then
            git -C "$_plugins_dir/$_plugin" fetch -q --depth 1 origin && \
            git -C "$_plugins_dir/$_plugin" reset -q --hard origin/HEAD
            source "$_plugins_dir/$_plugin/$_plugin.zsh"
        fi
    done
fi

if command -v fzf >/dev/null; then
    if fzf --zsh >/dev/null; then
        source <(fzf --zsh)
    elif [[ -r ~/.fzf.zsh ]]; then
        source ~/.fzf.zsh
    fi
fi

# }}}

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/aj/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
