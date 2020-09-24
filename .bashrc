# _
#| |__  _ __ _   _ _ __   ___
#| '_ \| '__| | | | '_ \ / _ \    Bruno Montezano
#| |_) | |  | |_| | | | | (_) |   https://github.com/brunomontezano/dotfiles
#|_.__/|_|   \__,_|_| |_|\___/    Feel free to copy and modify it.
#
# My bash config. Created and mantained by Bruno Montezano.

### EXPORTS ###
PATH="$HOME/.local/bin${PATH:+:${PATH}}" # Add .local/bin to $PATH
export EDITOR="nvim" # Set Vim as $EDITOR
export TERM="st-256color" # Set st as $TERM
export BROWSER="firefox" # Set Firefox as $BROWSER
export MANPAGER="less" # Set less as $MANPAGER
export HISTCONTROL=ignoredups:erasedups  # No duplicate entries
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc # Change location of gtk-2.0 config file
export GNUPGHOME="$XDG_DATA_HOME"/gnupg # Change location of ~/.gnupg directory
export LESSHISTFILE="-" # Stop less from creating history file
export R_ENVIRON_USER="$HOME/.config/r/.Renviron"

### SET VI MODE IN BASH ###
set -o vi

### IF NOT RUNNING INTERACTIVELY, DO NOT DO ANYTHING ###
[[ $- != *i* ]] && return

### CHANGE THE WINDOW TITLE OF X TERMINALS ###
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st-256color|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

### SHOPT ###
shopt -s histappend # Do not overwrite history
shopt -s expand_aliases # Expand aliases
shopt -s checkwinsize # Checks term size when bash regains control 
## ARCHIVE EXTRACTION ###
## Usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ALIASES ###

# Changing "ls" to "exa"
alias ls='exa --color=always --group-directories-first' # Normal listing
alias la='exa -la --color=always --group-directories-first'  # All files and dirs (long format)
alias ll='exa -l --color=always --group-directories-first'  # Long format
alias lt='exa -aT --color=always --group-directories-first' # Tree listing

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Change brightness level
alias cb='sudo vim /sys/class/backlight/intel_backlight/brightness'

# Navigation
alias ..='cd ..' 
alias ...='cd ../..'

# Broot
alias br='br -dhp'
alias bs='br --sizes'

# Vim
alias vim=nvim

# Adding flags
alias df='df -h'
alias newsboat='newsboat -u /home/pepper/.config/newsboat/urls -C /home/pepper/.config/newsboat/config -c /home/pepper/.cache/newsboat/newsboat.db'
alias elinks='elinks -config-dir /home/pepper/.config/elinks'

# Confirm before overwriting
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

### COLORS IN LESS (31 - red; 32 - green; 33 - yellow; 0 - reset/normal; 1 - bold; 4 - underlined) ### 
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

### BASH POWERLINE ###
source ~/.config/bash-powerline.sh

### RANDOM COLOR SCRIPT ###
colorscript random
