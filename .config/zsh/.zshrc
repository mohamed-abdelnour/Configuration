NEWLINE=$'\n'
PROMPT="%F{cyan}[%1~]%f${NEWLINE}$ "
unset NEWLINE

autoload -U colors && colors
stty stop undef
unsetopt beep
setopt HIST_IGNORE_DUPS
setopt ignoreeof

HISTFILE=$HOME/.cache/zsh/histfile
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

. "$HOME/.config/aliasrc"
. "$HOME/.config/fzf/completion"
. "$HOME/.config/nnn/quitcd.bash_zsh"
. '/usr/share/fzf/completion.zsh'
. '/usr/share/fzf/key-bindings.zsh'

zle_highlight=(region:bg='#3C3C3C',fg=white special:none suffix:none isearch:none paste:none)

. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

if [ "$TERM" != 'linux' ]; then
    eval "$(starship init zsh)"
fi
