#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

VIM="nvim"
alias vim="nvim"

PERSONAL="$XDG_CONFIG_HOME/personal"

bindkey -s ^f '\ntmux-sessionizer\n'
alias dir="tmux-sessionizer"
alias a="tmux attach"

[[ -z $WAYLAND_DISPLAY ]] || alias codium='codium  \
                                --ozone-platform-hint=auto \
                                --enable-features=WaylandWindowDecorations'

export STDC=(-std=c2x)
export GCC_FLAGS=(-g3 -Wall -Wextra -Wpedantic -Werror -fsanitize=undefined,address -fno-strict-aliasing)
export CLANG_FLAGS=(-g3 -Wall -Wextra -Wpedantic -Werror -fsanitize=undefined,address -fno-strict-aliasing)

CLJ() {
    if [[ $# -eq 0 ]]; then
        echo "Pass a file"
        return 1
    fi
    clj -M -i $1 -r
}

export CC="gcc"
export CXX="clang++"
export GIT_EDITOR=$VIM

source "$HOME/.cargo/env"

prepath() {
    local usage="\
Usage: prepath [-f] [-n] [-q] DIR
  -f Force dir to front of path even if already in path
  -n Nonexistent dirs do not return error status
  -q Quiet mode"

    local tofront=false errcode=1 qecho=echo
    while true; do case "$1" in
        -f)     tofront=true;       shift;;
        -n)     errcode=0;          shift;;
        -q)     qecho=':';          shift;;
        *)      break;;
    esac; done
    # Bad params always produce message and error code
    [[ -z $1 ]] && { echo 1>&2 "$usage"; return 1; }

    [[ -d $1 ]] || { $qecho 1>&2 "$1 is not a directory."; return $errcode; }
    dir="$(realpath "$1")"
    if [[ :$PATH: =~ :$dir: ]]; then
        $tofront || { $qecho 1>&2 "$dir already in path."; return 0; }
        PATH="${PATH#$dir:}"        # remove if at start
        PATH="${PATH%:$dir}"        # remove if at end
        PATH="${PATH//:$dir:/:}"    # remove if in middle
    fi
    PATH="$dir${PATH:+:}${PATH:-}"
}

prepath -q "$HOME/.zig"
prepath -q "$HOME/.local/scripts"
prepath -q "$HOME/.local/bin"
prepath -q "/usr/local/cuda-12.3/bin"
prepath -q "/opt/riscv/bin"

# Redirect config files
export HASKELINE="$HOME/.config/.haskeline"

# Redirect history files
export CLOJURE_HISTORY="$HOME/.hist/.clojure"
export PYTHONHISTORY="$HOME/.hist/.python"
export NODE_REPL_HISTORY="$HOME/.hist/.node_repl"
export HISTFILE="$HOME/.hist"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
