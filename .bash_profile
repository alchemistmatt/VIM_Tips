# .bash_profile

[[ -s ~/.profile ]] && source ~/.profile

# Get the aliases and functions
# [[ -r ~/.bashrc ]] &&  source ~/.bashrc

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
# Note that .bashrc will load aliases from .bash_aliases

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
