#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export TERM="gnome-terminal"
export BROWSER="firefox"
export MANPAGER="less"
export PAGER="less"
export QT_QPA_PLATFORM="wayland;xcb"
export LIBVA_DRIVER_NAME="radeonsi"

export LESS=-R
export LESSHISTFILE="-"

export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker 
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export SSB_HOME="$XDG_DATA_HOME"/zoom 
export R_ENVIRON_USER="$XDG_CONFIG_HOME"/r/Renviron
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history

PATH="$HOME/.local/bin":$PATH
HISTFILE="$XDG_DATA_HOME"/bash/history

set -o vi
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize
