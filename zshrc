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

alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

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

# CLANG
export LLVM_CONFIG=/Users/mgharbi/Downloads/clang36/bin/llvm-config
export CLANG=/Users/mgharbi/Downloads/clang36/bin/clang

# Clang OpenMP
export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/usr/local/lib

# CPP libs
export EIGEN3_INCLUDE_DIR='/usr/local/Cellar/eigen/3.2.2/include/eigen3'
export PNG_INCLUDE_DIR='/usr/local/Cellar/png++/0.2.5_1/include/png++'

# Cuda
export CUDA_TOOLKIT_ROOT_DIR='/usr/local/cuda/'
export PATH="/usr/local/cuda/bin":$PATH
export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:'/usr/local/cuda/lib'

# Android
export ANDROID_NDK="/usr/local/Cellar/android-ndk/r10d/"
export ANDROID_SDK="/usr/local/Cellar/android-sdk/24.1.2/"

# Google Test
export GTEST_DIR="$HOME/gtest/"

# Current Projects
alias diary='cd ~/Documents/projects/diary'

# Zsh Help
unalias run-help
autoload run-help

# Scripts binding
alias template='~/.scripts/project_template.py'

# Projects shortcuts
alias xform='cd ~/Documents/projects/xform'

# Xform
export XFORM_MOBILE='/Users/mgharbi/Documents/projects/xform_mobile/'
export HALIDE='/Users/mgharbi/Documents/projects/xform_mobile/third_party/halide'
# export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:"$HALIDE/bin"

# On startup quotations
# alias say='fortune 50% literature 50% ~/.fortunes/ | cowsay'
# alias quote='vi ~/.fortunes/citations'
# alias cquote='strfile ~/.fortunes/citations ~/.fortunes/citations.dat'
# say

# Kinect
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2
export NITE2_INCLUDE=/Users/mgharbi/Documents/projects/kinect/NiTE2/Include
export NITE2_REDIST64=/Users/mgharbi/Documents/projects/kinect/NiTE2/Redist

alias nanomed='ssh -2 -i ~/Downloads/nanomedicine.pem ubuntu@ec2-54-174-181-94.compute-1.amazonaws.com'

# Video_sync
export VIDEO_SYNC="$HOME/Documents/projects/video_sync"
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:"$VIDEO_SYNC/lib"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init -)"
