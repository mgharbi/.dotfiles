# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="mgharbi"

alias snip='vi ~/.vimplugins/ultisnips/UltiSnips'

alias zrc='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(osx git gem brew ruby rails rake python)

alias todo="vi $HOME/todo.md"
alias tm="tmux at"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

source $ZSH/oh-my-zsh.sh
export EDITOR=vim

# PATH extension
export PATH="/usr/local/bin":$PATH
export PATH='/usr/local/sbin':$PATH
 
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
if (( $+commands[nosetests] )); then
    alias pytest=nosetests
fi

# C related
alias gdb='gdb -q'
alias db='lldb'


# Cuda
export CUDA_TOOLKIT_ROOT_DIR='/usr/local/cuda/'
export PATH="/usr/local/cuda/bin":$PATH
export LD_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:'/usr/local/cuda/lib64'

# Scripts binding
alias template='~/.scripts/project_template.py'

# On startup quotations
# alias say='fortune 50% literature 50% ~/.fortunes/ | cowsay'
# alias quote='vi ~/.fortunes/citations'
# alias cquote='strfile ~/.fortunes/citations ~/.fortunes/citations.dat'
# say

alias nanomed='ssh -2 -i ~/Downloads/nanomedicine.pem ubuntu@ec2-54-174-181-94.compute-1.amazonaws.com'

if [[ -a $HOME/localenv.sh ]]; then
    source $HOME/localenv.sh
fi
