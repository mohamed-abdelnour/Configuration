#!/usr/bin/env dash

PS1='\[\e[36m\][\W]\[\e[m\]\n\$ '

# shellcheck disable=1091
{
    . "$XDG_CONFIG_HOME/shell/shellrc"
    . '/usr/share/fzf/completion.bash'
    . '/usr/share/fzf/key-bindings.bash'
}

set -o ignoreeof
set -o vi

eval "$(starship init bash)"
eval "$(direnv hook bash)"
