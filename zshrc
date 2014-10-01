# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="mgharbi"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(osx git gem brew ruby rails rake python mgharbi)

source $ZSH/oh-my-zsh.sh
export EDITOR=/usr/local/bin/vim

# PATH extension
export PATH="/usr/local/bin":$PATH
export PATH='/usr/local/sbin':$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
 
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

# Ruby
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# JS
export NODE_PATH=/usr/local/lib/node_modules

# C related
alias cmm='nocorrect cmake .. ; make'
alias gdb='gdb -q'
alias db='lldb'
# export FFLAGS=-ff2c
# export CC="/usr/local/bin/gcc"
# export CXX="/usr/local/bin/gcc"
# export CMAKE_C_COMPILER=$CC
# export CMAKE_CXX_COMPILER=$CXX
export PATH="/Developer/NVIDIA/CUDA-6.5/bin":$PATH
# export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-5.5/lib":$DYLD_LIBRARY_PATH

# Current Project
alias motion='cd ~/Documents/motioncpp'
alias timewarp='cd ~/Documents/timewarping'
alias video='cd ~/Documents/videolapse'
alias reading='cd ~/Documents/readings'
alias photo='cd ~/Documents/photosite'
alias splitsy='cd ~/Documents/splitsy'
alias diary='cd ~/Documents/diary'

# Code library
export MGH_MATLAB_TOOLBOX=~/Documents/mgh_matlab_toolbox


# vim snippets
alias snip='cd ~/.dotfiles/vim/bundle/ultisnips/UltiSnips'

# Zsh Help
unalias run-help
autoload run-help

# Scripts binding
alias new_proj='~/.scripts/project_template.rb'

# FFMPEG
function mkmov {
    ffmpeg -i $1 -vcodec qtrle $2
}
function resizemov {
    ffmpeg -i $1 -filter:v scale=$2:'trunc(ow/a/2)*2' $3
}

# Motion Comparison
export PVL='/Users/mgharbi/Documents/particleVideo/ParticleVideoLib'
export SBL='/Users/mgharbi/Documents/particleVideo/SimpleBaseLib'

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# On startup quotations
# alias say='fortune 50% literature 50% ~/.fortunes/ | cowsay'
# alias quote='vi ~/.fortunes/citations'
# alias cquote='strfile ~/.fortunes/citations ~/.fortunes/citations.dat'
# say
