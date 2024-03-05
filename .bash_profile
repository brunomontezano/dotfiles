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

export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal

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
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

PATH="$HOME/.local/bin":$PATH
HISTFILE="$XDG_DATA_HOME"/bash/history

set -o vi
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize
