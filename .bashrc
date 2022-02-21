#!/usr/bin/env dash

PS1='\[\e[36m\][\W]\[\e[m\]\n\$ '

# shellcheck disable=1091
{
    . "$XDG_CONFIG_HOME/shell/aliasrc"
    . "$XDG_CONFIG_HOME/fzf/completion"
    . "$XDG_CONFIG_HOME/git/alias"
    . "$XDG_CONFIG_HOME/nnn/quitcd.bash_zsh"
    . '/usr/share/fzf/completion.bash'
    . '/usr/share/fzf/key-bindings.bash'
}

set -o ignoreeof
set -o vi

eval "$(starship init bash)"
eval "$(direnv hook bash)"
