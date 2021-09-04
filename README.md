# Configuration

## Table of Contents

- [Quick-start](#quick-start)
  - [Prerequisites](#prerequisites)
  - [Set-up a configuration repository for the first time](#set-up-a-configuration-repository-for-the-first-time)
  - [Use an existing configuration repository](#use-an-existing-configuration-repository)
- [Applications](#applications)
- [Credits](#credits)

## Quick-start

### Prerequisites

- Make sure that [`bare`](.local/bin/bare) is available in `"$PATH"`.

- Have `git` ignore _everything_ inside `"$HOME"`:

```console
$ printf '*\n' > "$HOME/.gitignore"
```

### Set-up a configuration repository for the first time

- Initialise the repository:

```console
$ git init --bare "$HOME/.bare"
```

- Add patterns to `.gitignore` to track or ignore files (see the [`gitignore`
  documentation](https://git-scm.com/docs/gitignore)). This repository includes
  a [`.gitignore`](.gitignore) file that can be used as a reference.

- Interact with the repository just as you would with any `git` repository,
  using `bare` instead of `git`.

### Use an existing configuration repository

- Clone your repository:

```console
$ git clone --bare [REPOSITORY_URL] "$HOME/.bare"
```

- Checkout your repository:

```console
$ bare checkout
```

This may fail if `"$HOME"` includes any files that would be overwritten by
`git`. Move or remove these files, as prompted, and run `bare checkout`.

## Applications

- [Alacritty](https://github.com/alacritty/alacritty)
- [Dunst](https://github.com/dunst-project/dunst)
- [Eclipse JDT Language Server](https://github.com/eclipse/eclipse.jdt.ls)
- [Fontconfig](https://www.freedesktop.org/wiki/Software/fontconfig/)
- [GHC](https://gitlab.haskell.org/ghc/ghc)
- [GNU Emacs](https://www.gnu.org/software/emacs/)
- [Git](https://git-scm.com/)
- [GnuPG](https://gnupg.org/)
- [Iosevka](https://github.com/be5invis/Iosevka)
- [Keychain](https://www.funtoo.org/Keychain)
- [Latexmk](https://personal.psu.edu/~jcc8/software/latexmk/)
- [Neovim](https://github.com/neovim/neovim)
- [Nixpkgs](https://github.com/NixOS/nixpkgs)
- [Starship](https://github.com/starship/starship)
- [X.Org](https://www.x.org/wiki/)
- [XMonad](https://github.com/xmonad/xmonad)
- [Xmobar](https://github.com/jaor/xmobar)
- [Zsh](https://www.zsh.org/)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [feh](https://feh.finalrewind.org/)
- [fzf](https://github.com/junegunn/fzf)
- [htop](https://github.com/htop-dev/htop)
- [nnn](https://github.com/jarun/nnn/)
- [picom](https://github.com/yshui/picom)
- [tmux](https://github.com/tmux/tmux)
- [zathura](https://git.pwmt.org/pwmt/zathura)

## Credits

The colours used in this configuration are taken from Protesilaos Stavrou's
[Modus Vivendi](https://gitlab.com/protesilaos/modus-themes/) for GNU Emacs.

<!-- TODO: Document scripts -->
