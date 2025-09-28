autoload colors && colors
autoload -Uz vcs_info

function precmd() {
  vcs_info

  NEWLINE=$'\n'
  PROMPT_LOGIN="%n%{$fg_bold[yellow]%} @ %{$reset_color%}%m"
  PROMPT_DIR='%2~'
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

# {{{ zsh options

setopt auto_cd
setopt no_menu_complete
setopt auto_menu
setopt correct
setopt multios
setopt extended_glob
setopt no_hup
setopt no_check_jobs
setopt hist_ignore_dups
setopt no_nomatch
setopt completeinword
setopt listtypes
setopt long_list_jobs
setopt notify
setopt share_history
setopt prompt_subst

unsetopt HIST_VERIFY

HISTFILE=~/.zshhistory
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# }}}

# {{{ exports

export PATH="$PATH:$HOME/.local/bin:$HOME/flatpak/exports/bin:$HOME/.local/share/flatpak/exports/bin"
export PATH="$PATH:/usr/local/texlive/2025/bin/x86_64-linux"
export PATH="$PATH:/opt/cuda/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export LIBRARY_PATH="$LIBRARY_PATH:/opt/cuda/lib64"

export EDITOR="$(which nvim)"
export SUDO_EDITOR=$EDITOR
# export MANPAGER="nvim --appimage-extract-and-run +Man!"
export LLVM_BUILD_PATH="$HOME/tools/llvm-project/build"

export MANPATH="$MANPATH:/usr/local/texlive/2025/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:usr/local/texlive/2025/texmf-dist/doc/info"

# }}}

# {{{ aliases

alias s="kitten ssh"
alias rsrun="$HOME/dotfiles/scripts/rsrun.sh"
alias vi="$(which nvim)"
alias ls='ls --color'
alias l='ls -al'
alias dvis='rm *.sqlite *.pvtu *.vtu'
alias dcache="rm -rf $HOME/.cache/pytools/pdict* $HOME/.cache/pyopencl $HOME/.cache/pocl $HOME/.nv/ComputeCache"

# python related
alias pydev='conda activate dev'
alias pycl='PYOPENCL_CTX=0:0 python'
alias pyclt='PYOPENCL_TEST=0:0 python -m pytest'
alias pyclg='PYOPENCL_CTX=1 python'

# script aliases
alias jremote="$HOME/dotfiles/scripts/launch_jupyter.sh"

# }}}
#
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

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

# :shrug:
source "$HOME/.cargo/env"
source "/home/aj/.deno/env"

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
