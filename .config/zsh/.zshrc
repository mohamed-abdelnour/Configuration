NEWLINE=$'\n'
PROMPT="%F{cyan}[%1~]%f${NEWLINE}$ "
unset NEWLINE

autoload -U colors && colors
stty stop undef
unsetopt beep
setopt HIST_IGNORE_DUPS
setopt ignoreeof

HISTFILE="$XDG_STATE_HOME/zsh/histfile"
HISTSIZE=10000
SAVEHIST=10000

bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1

fpath+=($HOME/.nix-profile/share/zsh/site-functions $HOME/.nix-profile/share/zsh/plugins/nix)

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand_alias _complete _ignored
autoload -Uz compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char

. "$XDG_CONFIG_HOME/shell/shellrc"
. '/usr/share/fzf/completion.zsh'
. '/usr/share/fzf/key-bindings.zsh'

zle_highlight=(region:bg='#3c3c3c',fg=white special:none suffix:none isearch:none paste:none)

. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

if [ "$TERM" != 'linux' ]; then
    eval "$(starship init zsh)"
fi

eval "$(direnv hook zsh)"
