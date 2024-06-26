#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export TERM="xterm-256color"
export BROWSER="firefox"
export MANPAGER="less"
export PAGER="less"
export QT_QPA_PLATFORM="wayland;xcb"
export LIBVA_DRIVER_NAME="radeonsi"

export LESSHISTFILE="-"

export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export JULIAUP_DEPOT_PATH="$XDG_DATA_HOME/julia"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker 
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export SSB_HOME="$XDG_DATA_HOME"/zoom 
export R_ENVIRON_USER="$XDG_CONFIG_HOME"/r/Renviron
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export MIX_XDG="true" 

PATH="$HOME/.local/bin":$PATH
HISTFILE="$XDG_DATA_HOME"/bash/history

set -o vi
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize
