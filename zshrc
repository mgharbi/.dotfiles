platform=$(uname)

fpath+=$HOME/.zsh/pure
fpath+=$HOME/.zfunc

autoload -U +X compinit && compinit
zstyle ':completion:*' menu select
autoload -U promptinit && promptinit
prompt pure

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

if [[ $platform == Darwin ]]; then
    [[ -n '^[[A' ]] && bindkey '^[[A' up-line-or-beginning-search
    [[ -n '^[[B' ]] && bindkey '^[[B' down-line-or-beginning-search
else
    [[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
    [[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search
fi

setopt autocd
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# History config
HISTSIZE=5000           #How many lines of history to keep in memory
HISTFILE=~/.zsh_history #Where to save history to disk
SAVEHIST=5000           #Number of history entries to save to disk

# PATH extension
export PATH="/usr/local/bin":$PATH
export PATH='/usr/local/sbin':$PATH
export PATH="$HOME/.dotfiles/scripts":$PATH

# Grep options
export GREP_OPTIONS=""
alias grep="grep --color=auto -E"

alias rm=rm -i

# A few command aliases
alias vi="vim"
alias swget="curl -O"
alias gcc-4.2="gcc"
alias l="ls -lah -G"
alias matlab="matlab -nodesktop -nosplash"
alias occam='ssh -X gharbi@occam.csail.mit.edu'
alias athena='ssh $athena'
alias vifm='nocorrect vifm'
alias doc='cd ~/Documents'
alias gst='git status'
alias gf='git fetch -a -v'
alias kb='kubectl'

alias zrc='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'
alias snip='vi ~/.vimplugins/vim-snippets/UltiSnips'

alias localenv="vi $HOME/localenv.sh"
alias todo="vi $HOME/todo.md"
alias tm="tmux at"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

# Python
export PYTHONPATH=:$PYTHONPATH
if (($+commands[ipython3])); then
    alias py='nocorrect ipython3'
else
    alias py='python'
fi

# C related
alias gdb='gdb -q'
alias db='lldb'

# Scripts binding
alias template='~/.scripts/project_template.py'

if [[ -e $HOME/localenv.sh ]]; then
    source $HOME/localenv.sh
fi

function update-x11-forwarding {
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY >~/.display.txt
    else
        export DISPLAY=$(cat ~/.display.txt)
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HALIDE_DISTRIB_DIR=$HOME/projects/Halide

fpath+=~/.zfunc

# CUDA
export CUDA_HOME="/usr/local/cuda"
export PATH=$CUDA_HOME/bin:$PATH

# PYTHON
export PATH=$HOME/.local/bin:$PATH

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# # tcl-tk
# HOMEBREW_OPT_FOLDER=/opt/homebrew/opt
# export PATH="$HOMEBREW_OPT_FOLDER/tcl-tk/bin:$PATH"
# export LDFLAGS="-L$HOMEBREW_OPT_FOLDER/tcl-tk/lib"
# export CPPFLAGS="-I$HOMEBREW_OPT_FOLDER/tcl-tk/include"
# export PKG_CONFIG_PATH="$HOMEBREW_OPT_FOLDER/tcl-tk/lib/pkgconfig"
# export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I$HOMEBREW_OPT_FOLDER/tcl-tk/include' --with-tcltk-libs='-L$HOMEBREW_OPT_FOLDER/tcl-tk/lib -ltcl8.6 -ltk8.6'"


export WANDB_API_KEY=945cb1631628a26959caf767dd7f99519e798bdf
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

alias gc=gcloud

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/mnt/userspace/mgharbi/downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/mnt/userspace/mgharbi/downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/mnt/userspace/mgharbi/downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/mnt/userspace/mgharbi/downloads/google-cloud-sdk/completion.zsh.inc'; fi

export CONDA_ENVS_PATH="$HOME/.conda/envs/"

alias qu-install="pip3 install git+ssh://git@github.com/reve-ai/queryfile-util.git"
alias gs="gcloud storage"

source $HOME/anthropic_api_key.sh
source $HOME/fal_key.sh