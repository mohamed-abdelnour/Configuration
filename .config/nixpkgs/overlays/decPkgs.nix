final: _: {
  decPkgs =
    # Defaults
    {
      inherit
        (final)
        cacert
        nix
        ;
    }
    // import ./tmpPkgs.nix {} final
    // {
      inherit
        (final)
        alejandra
        arc-theme
        cachix
        deadnix
        default-cursor
        delta
        dwm-status
        emacsGitNativeComp
        ghc
        glibcLocales
        hlint
        librsvg
        luaformatter
        neovim-nightly
        nix-direnv
        nix-linter
        nix-zsh-completions
        nixpkgs-fmt
        nordic
        nsxiv
        pandoc
        papirus-icon-theme
        patchelf
        pfetch
        plata-theme
        rnix-lsp
        shellcheck
        stack
        starship
        statix
        stylua
        tmpmail
        ttfautohint
        vanilla-dmz
        ;
      inherit
        (final.haskellPackages)
        brittany
        haskell-language-server
        xmobar
        ;
    };
}
