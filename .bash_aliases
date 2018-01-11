# ~/.bash_aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls -alF --color=auto --time-style='+%Y-%m-%d %H:%M:%S'"
    alias lsd="ls -alF --color=auto --sort=time --reverse --time-style='+%Y-%m-%d %H:%M:%S'"
    alias l='/bin/ls -CF --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls="ls -alF --time-style='+%Y-%m-%d %H:%M:%S'"
    alias lsd="ls -alF --sort=time --reverse --time-style='+%Y-%m-%d %H:%M:%S'"
    alias l='/bin/ls -CF'
fi

alias cd..='cd ..'
alias cls='clear'
alias edit='nano'
alias ftp='echo Use scp or lftp'
alias hf='history | grep -i $1'
alias less='less -R'

# Use fk to repeat the last command but use sudo this time
alias fk='echo sudo $(fc -ln -1) && sudo $(fc -ln -1)'

# Open vim with the most recent file
# The same as starting VIM then typing '0
alias lvim='vim -c "normal '\''0"'
