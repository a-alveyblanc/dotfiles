autoload colors && colors

NEWLINE=$'\n'

PROMPT_LOGIN="%n%{$fg_bold[yellow]%} @ %{$reset_color%}%m%{$reset_color%}"
# PROMPT_LOGIN="%{$fg_bold[white]%}%n%{$fg_bold[yellow]%} @ %{$reset_color%}%{$fg_bold[white]%}%m%{$reset_color%}"
PROMPT_DIR='[%2~] '
PROMPT="$PROMPT_LOGIN $PROMPT_DIR$NEWLINE%{$fg[yellow]%}$%{$reset_color%} "

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

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="$HOME/.local/bin/nvim"
export SUDO_EDITOR=$EDITOR
export LLVM_BUILD_PATH="$HOME/tools/llvm-project/build"
# export PYTHONPATH=$PYTHONPATH:"$LLVM_BUILD_PATH/tools/mlir/python_packages/mlir_core"
# export PYTHONPATH=$PYTHONPATH:"$HOME/research/src"

# }}}

# {{{ aliases

alias rsrun="$HOME/dotfiles/scripts/rsrun.sh"
alias vi="$(which nvim)"
alias ls='ls --color'
alias l='ls -al'

# python related
alias pydev='conda activate dev'
alias pycl='PYOPENCL_CTX=0:0 python'
alias pyclt='PYOPENCL_TEST=0:0 python -m pytest'
alias pycludb='PYOPENCL_CTX=0:0 python -m pudb'
alias pyclgpu='PYOPENCL_CTX=0:1 python'

# script aliases
alias jremote="$HOME/dotfiles/scripts/launch_jupyter.sh"

# }}}

# {{{ zsh tools

# {{{ zshcompletion

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' condition 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '$HOME/.zshrc'

zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 \
  ln=target pi=40\;33 so=01\;35 do=01\;35 bd=40\;33\;01 cd=40\;33\;01 \
  or=40\;31\;01 ex=01\;32

autoload -Uz compinit
compinit

# }}}

source $HOME/zshtools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# {{{ fzf

fpath=($HOME/zshtools/zsh-completions $fpath)

[ -f ~/zshtools/.fzf.zsh ] && source ~/zshtools/.fzf.zsh

# }}}

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

if [ -f "/home/aj/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/aj/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# :shrug:
source "$HOME/.cargo/env"
source "/home/aj/.deno/env"
