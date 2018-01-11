# ~/.bash_profile

[[ -s ~/.profile ]] && source ~/.profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
# Note that .bashrc will load aliases from .bash_aliases

PATH=$PATH:$HOME/bin

export PATH
