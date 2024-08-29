#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

VIM="nvim"
alias vim="nvim"

PERSONAL="$XDG_CONFIG_HOME/personal"

bindkey -s ^f 'tmux-sessionizer\n'
bindkey -s  'tmux attach\n'

alias fcd='cd $(find -mindepth 0 -maxdepth 1 -type d | cut -c3- | fzf)'
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

source "$ZDOTDIR/path"

# Redirect config files
export HASKELINE="$HOME/.config/.haskeline"

# Redirect history files
export CLOJURE_HISTORY="$HOME/.hist/.clojure"
export PYTHONHISTORY="$HOME/.hist/.python"
export NODE_REPL_HISTORY="$HOME/.hist/.node_repl"
export HISTFILE="$HOME/.hist"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
