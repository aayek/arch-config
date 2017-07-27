
zstyle ":completion:*:commands" rehash 1
zstyle ':completion:::*:default' menu no select
#zstyle ':completion:*' hosts off
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh/cache

autoload -Uz compinit promptinit colors
compinit
promptinit
colors


#history options
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extended_history
setopt PROMPT_SUBST
#setopt inc_append_history
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
HISTTIMEFORMAT='%F %T  '
unsetopt beep


. ~/.zsh/export.zsh
. ~/.zsh/alias.zsh
. ~/.zsh/arch-git-prompt.zsh
. ~/.zsh/function.zsh

bindkey -v

# History Search
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^R" history-incremental-search-backward
bindkey "^A" history-beginning-search-backward
bindkey "^B" history-beginning-search-forward

export KEYTIMEOUT=1
typeset -A key
# Searching autocompl using <Ctrl>j/k
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search
bindkey '^j' down-line-or-beginning-search
bindkey '^[[3~'	delete-char
bindkey '^[3;5~' delete-char

# Fix backward delete
bindkey -v '^?' backward-delete-char
# Fix vi mode search on zsh history session
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -v "^[[3~"   delete-char
bindkey -v "^[3;5~"  delete-char


# Finally, make sure the terminal is in application mode, when zle is
# # active. Only then are the values from $terminfo valid.

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/ [NORMAL]}/(main|viins)/[INSERT]}"
    RPS2=$RPS1
    zle reset-prompt
}


zle -N zle-line-init
zle -N zle-keymap-select


# *** Yank in the clipboard ***
x-yank() {
    zle copy-region-as-kill
    print -rn -- $CUTBUFFER | xclip -in -selection clipboard
}
zle -N x-yank

x-cut() {
    zle kill-region
    print -rn -- $CUTBUFFER | xclip -in -selection clipboard
}
zle -N x-cut

x-paste() {
    CUTBUFFER=$(xclip -selection clipboard -o)
    zle yank
}
zle -N x-paste


setopt autopushd pushdsilent pushdtohome
## Remove duplicate entries
setopt pushdignoredups
### This reverts the +/- operators.
setopt pushdminus
