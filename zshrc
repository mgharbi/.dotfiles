autoload -U promptinit && promptinit
prompt pure

setopt autocd

# History config
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  
bindkey 'OA' history-search-backward 
bindkey 'OB' history-search-forward 

export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# Grep options
export GREP_OPTIONS="--color=auto -E"

# A few command aliases
alias swget="curl -O"
alias gcc-4.2="gcc"
alias l="ls -lah --color=auto"
alias matlab="matlab -nodesktop -nosplash"
alias clust='ssh $clust'
alias athena='ssh $athena'
alias vifm='nocorrect vifm'
alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc'
alias doc='cd ~/Documents'
alias gst='git status'

alias zrc='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'
alias snip='vi ~/.vimplugins/ultisnips/UltiSnips'

alias localenv="vi $HOME/localenv.sh"
alias todo="vi $HOME/todo.md"
alias tm="tmux at"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
 
export EDITOR=vim
 
# PATH extension
export PATH="/usr/local/bin":$PATH
export PATH='/usr/local/sbin':$PATH
export PATH="$HOME/.dotfiles/scripts":$PATH
  
# Python
export WORKON_HOME=~/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV=false
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
syspip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
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
