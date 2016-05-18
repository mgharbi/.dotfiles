autoload -U promptinit && promptinit
prompt pure

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

# if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]; then
#     source /usr/local/bin/virtualenvwrapper.sh
#     if [[ -a $WORKON_HOME/default/bin/activate ]]; then
#         workon default
#     fi
# fi
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

# function update-x11-forwarding
# {
#     if [ -z "$STY" -a -z "$TMUX" ]; then
#         echo $DISPLAY > ~/.display.txt
#     else
#         export DISPLAY=`cat ~/.display.txt`
#     fi
# }

if [[ -a $HOME/localenv.sh ]]; then
    source $HOME/localenv.sh
fi

