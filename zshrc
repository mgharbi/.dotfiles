platform=`uname`

if [[ $platform == Darwin ]]; then
else
  fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
fi

autoload -U promptinit && promptinit
prompt pure

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search


if [[ $platform == Darwin ]]; then
  [[ -n '^[[A'      ]]  && bindkey '^[[A' up-line-or-beginning-search
  [[ -n '^[[B'    ]]  && bindkey '^[[B' down-line-or-beginning-search
else
  [[ -n "${key[Up]}"      ]]  && bindkey "${key[Up]}" up-line-or-beginning-search
  [[ -n "${key[Down]}"    ]]  && bindkey "${key[Down]}" down-line-or-beginning-search
fi

setopt autocd
setopt appendhistory
setopt sharehistory
setopt incappendhistory  

# History config
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk

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

alias zrc='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'
alias snip='vi ~/.vimplugins/vim-snippets/UltiSnips'

alias localenv="vi $HOME/localenv.sh"
alias todo="vi $HOME/todo.md"
alias tm="tmux at"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"


# Python
export PYTHONPATH=:$PYTHONPATH
if (( $+commands[ipython3] )); then
    alias py='nocorrect ipython3'
else
    alias py='python'
fi

# C related
alias gdb='gdb -q'
alias db='lldb'

# Scripts binding
alias template='~/.scripts/project_template.py'

if [[ -a $HOME/localenv.sh ]]; then
    source $HOME/localenv.sh
fi

function update-x11-forwarding
{
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY > ~/.display.txt
    else
        export DISPLAY=`cat ~/.display.txt`
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HALIDE_DISTRIB_DIR=$HOME/projects/Halide

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mgharbi/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mgharbi/anaconda/etc/profile.d/conda.sh" ]; then
        . "/Users/mgharbi/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mgharbi/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
