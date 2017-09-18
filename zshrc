platform=`uname`

autoload -U promptinit && promptinit
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

if [[ $platform -eq Darwin ]]; then
  [[ -n '^[[A'      ]]  && bindkey   '^[[A'       up-line-or-beginning-search
  [[ -n '^[[B'    ]]  && bindkey   '^[[B' down-line-or-beginning-search
else
  [[ -n "${key[Up]}"      ]]  && bindkey   "${key[Up]}"       up-line-or-beginning-search
  [[ -n "${key[Down]}"    ]]  && bindkey   "${key[Down]}"    down-line-or-beginning-search
fi

prompt pure

setopt autocd
setopt appendhistory
setopt sharehistory
setopt incappendhistory  

# History config
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk

# Grep options
export GREP_OPTIONS="--color=auto -E"

# A few command aliases
alias vi="vim"
alias swget="curl -O"
alias gcc-4.2="gcc"
alias l="ls -lah"
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
 
# PATH extension
export PATH="/usr/local/bin":$PATH
export PATH='/usr/local/sbin':$PATH
export PATH="$HOME/.dotfiles/scripts":$PATH
  
# Python
export WORKON_HOME=~/.virtualenvs

if [[ $platform == Darwin ]]; then
  export VIRTUALENVWRAPPER_PYTHON="python3"
  export PIP="pip3"
else
  export PIP="pip"
  # export VIRTUALENVWRAPPER_PYTHON="python"
fi

export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--system-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV=false
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
syspip(){
    PIP_REQUIRE_VIRTUALENV="" $PIP "$@"
}

if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
     if [[ -a $WORKON_HOME/default/bin/activate ]]; then
         workon default
     fi
fi
if (( $+commands[ipython] )); then
    alias py='nocorrect ipython'
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
source /Users/mgharbi/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
