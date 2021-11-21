#!/usr/bin/env zsh

eval "$(dircolors -b)"

GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

export PATH="$PATH:$GEM_HOME/bin"

. "$XDG_CONFIG_HOME/fzf/modus-vivendi"
. "$XDG_CONFIG_HOME/jdtls/environment"
. "$XDG_CONFIG_HOME/keychain/load_keys"
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    console_session
    exec startx > /dev/null 2>&1
fi
