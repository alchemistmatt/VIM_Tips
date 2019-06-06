# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Configure the history
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=10000

# Set options
setopt appendhistory autocd extendedhistory histexpiredupsfirst histignoredups histignorespace histverify incappendhistory interactivecomments pushdignoredups pushdminus sharehistory

# Fix home/end key binding (when using Putty)
# See https://stackoverflow.com/questions/161676/home-end-keys-in-zsh-dont-work-with-putty
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Disable beeping on errors
unsetopt beep

# Enable vim commands when using the Zsh Line Editor (toggle the editor with Escape)
bindkey -v

# Enable the completion system
zstyle :compinstall filename '/home/d3l243/.zshrc'
autoload -Uz compinit
compinit

# Load bash aliases, if defined
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt based on theme candy.zsh-theme in oh-my-zsh
# PROMPT=$'[%{$fg_bold[green]%}%n@%m:%{$reset_color%}%{$fg[blue]%}%~%{$reset_color%}]$(git_prompt_info) %{$fg_bold[magenta]%}$%{$reset_color%} '
# ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[green]%}("
# ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

# Prompt that works without oh-my-zh
autoload -U colors && colors
PS1="%{$fg[green]%}%n@%{$fg[green]%}%m:%{$fg[cyan]%}%~%{$reset_color%}$ "
