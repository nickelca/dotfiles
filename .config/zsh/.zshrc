#!/usr/bin/env zsh

ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.cache/.zcompdump-$(hostname)-${ZSH_VERSION}"

# no duplicate history
HISTSIZE=5000
HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# case insensitive completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # "ma=48;5;153;1"

setopt autocd
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export MANPATH="/usr/share/man:/usr/local/share/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='nvim'

source $ZDOTDIR/.zprofile

# Haskell
[ -f "/home/cnickel/.ghcup/env" ] && source "/home/cnickel/.ghcup/env" # ghcup-env

# command line prompt
git_dirty() {
    git diff --shortstat 2> /dev/null | tail -n1
}

git_num_untracked_files() {
    git status --porcelain 2>/dev/null| grep "^??" | wc -l
}

git_uncommitted_changes() {
    git diff HEAD --name-only | wc -l
}

git_prompt_info() {
    ref=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [[ -z $ref ]]; then
        return 0
    fi
    local symbol="%F{green}✔"
    local symbol_bad="%F{yellow}✗"
    if [[ -n $(git_dirty) ||
        "$(git_num_untracked_files)" != "0" ||
        "$(git_uncommitted_changes)" != "0" ]]; then

        symbol=$symbol_bad
    fi
    print -rP "%F{blue}%Bgit:(%F{red}$ref%F{blue}) $symbol%b "
}

precmd() {
    print -rP '%F{yellow}%n@%m%f:%F{blue}%4~%f'
}

setopt PROMPT_SUBST
export PS1='$(git_prompt_info)%(?.%F{green}.%F{red})%(!.#.$)%f '
