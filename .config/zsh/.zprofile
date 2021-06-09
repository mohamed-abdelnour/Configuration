#!/usr/bin/zsh

GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

export PATH="$PATH:$HOME/.local/bin:$GEM_HOME/bin"

eval "$(dircolors -b)"

export CARGO_HOME="$HOME/.local/share/cargo"
export DIFFPROG="nvim -d"
export EDITOR="nvim"
export EXA_COLORS="reset:uu=0:gu=0:lm=35"
export FZF_CTRL_T_COMMAND="fd -H -t f"
export FZF_DEFAULT_COMMAND="$FZF_CTRL_T_COMMAND"
export GRADLE_USER_HOME="$HOME/.local/share/gradle"
export LC_COLLATE="C"
export LESS="-R"
export LOCALE_ARCHIVE="$HOME/.nix-profile/lib/locale/locale-archive"
export NIX_PAGER="bat"
export NNN_FCOLORS="000304020005060805030501"
export NNN_OPTS="Hde"
export QT_QPA_PLATFORMTHEME="qt5ct"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export STACK_ROOT="$HOME/.local/share/stack"
export SUDO_ASKPASS="$HOME/.local/bin/askpass"
export UNCRUSTIFY_CONFIG="$HOME/.config/uncrustify/uncrustify.cfg"
export VISUAL="nvim"
export _JAVA_AWT_WM_NONREPARENTING=1

. "$HOME/.config/fzf/onedark"
. "$HOME/.config/jdtls/environment"
. "$HOME/.config/keychain/load_keys"
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    console_session
    exec startx > /dev/null 2>&1
fi
