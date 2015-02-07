# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="mgharbi"

alias snip='vi ~/.vimplugins/ultisnips/UltiSnips'

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(osx git gem brew ruby rails rake python)

alias vim="/usr/local/Cellar/macvim/7.4-73_1/bin/mvim -v"

alias todo="vi $HOME/todo.md"

source $ZSH/oh-my-zsh.sh
export EDITOR=vim

# PATH extension
export PATH="/usr/local/bin":$PATH
export PATH='/usr/local/sbin':$PATH
 
# Python
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV=true
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
export PYTHONPATH=$PYTHONPATH:$HOME/mghlib

# C related
alias cmm='nocorrect cmake .. ; make'
alias gdb='gdb -q'
alias db='lldb'
export FFLAGS=-ff2c
export CC="/usr/local/bin/gcc"
export CXX="/usr/local/bin/g++"
export PATH="/usr/local/cuda/bin":$PATH
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib":$DYLD_LIBRARY_PATH
export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/usr/local/cuda/lib

# Cmake
export CMAKE_C_COMPILER=$CC
export CMAKE_CXX_COMPILER=$CXX
export CMAKE_PREFIX_PATH="/usr/local/Cellar/qt5/5.4.0":$CMAKE_PREFIX_PATH

# CPP libs
export EIGEN3_INCLUDE_DIR='/usr/local/Cellar/eigen/3.2.2/include/eigen3'
export PNG_INCLUDE_DIR='/usr/local/Cellar/png++/0.2.5_1/include/png++'

# Google Test
export GTEST_DIR="$HOME/gtest/"

# Current Projects
alias diary='cd ~/Documents/diary'

# Zsh Help
unalias run-help
autoload run-help

# Scripts binding
alias template='~/.scripts/project_template.py'

# On startup quotations
# alias say='fortune 50% literature 50% ~/.fortunes/ | cowsay'
# alias quote='vi ~/.fortunes/citations'
# alias cquote='strfile ~/.fortunes/citations ~/.fortunes/citations.dat'
# say

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init -)"
