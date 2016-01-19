# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Command history settings

# don't put duplicate lines or lines starting with spaces in the history
HISTCONTROL=ignoreboth

# append to the history file; don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s autocd           # Type a directory name and press enter to "cd" into the directory
shopt -s checkjobs        # Warn of running jobs on logout (suspend task with Ctrl+z and resume with fg)
shopt -s histverify       # Show command from history with:   !34<enter>
shopt -s nocaseglob       # case-insenstive match to:         cd ap*<enter>

# User specific aliases and functions

alias ls='ls -alF --color=tty'
alias lsd='ls -alF --color=tty --sort=time --reverse'
alias edit='nano'
alias ftp='echo Use scp or lftp'
alias cd..='cd ..'

PS1='[\u@\h \w]\$ '
export PS1

# Open vim with the most recent file
# The same as starting VIM then typing '0
alias lvim='vim -c "normal '\''0"'
