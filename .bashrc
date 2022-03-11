### Sources ###
source "$HOME"/.config/user-dirs.dirs
source /home/pepper/.config/broot/launcher/bash/br

### Exports and variables ###
export EDITOR="nvim"
export TERM="alacritty"
export BROWSER="firefox"
export MANPAGER="less"
export PAGER="less"
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export DIFFPROG="nvim -d $1"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE="-"
export R_ENVIRON_USER="$XDG_CONFIG_HOME"/r/.Renviron
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter 
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv 
export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-seccomp-filter-sandbox"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

PATH="$HOME/.local/bin${PATH:+:${PATH}}"
HISTFILE="$XDG_DATA_HOME"/bash/history
HISTCONTROL=ignoredups:erasedups
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

### Options ###
set -o vi
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize

### If not running interactively, do not do anything ###
[[ $- != *i* ]] && return

### Change window title ###
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st-256color|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

## Archive extraction function ###
### Usage: ex <file> ###
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

### Aliases ###
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'

alias ls='exa --color=always --group-directories-first' # Normal listing
alias la='exa -la --color=always --group-directories-first'  # All files and dirs (long format)
alias ll='exa -l --color=always --group-directories-first'  # Long format
alias lt='exa -aT --color=always --group-directories-first' # Tree listing

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ..='cd ..' 
alias ...='cd ../..'

alias vim=nvim

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"' 
alias newsboat='newsboat -u "$XDG_CONFIG_HOME/newsboat/urls" -c "$XDG_CACHE_HOME/newsboat/cache.db" -C "$XDG_CONFIG_HOME/newsboat/config"'
