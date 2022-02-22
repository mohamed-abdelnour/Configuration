final: prev: {
  decPkgs =
    prev.decPkgs
    or {}
    // import ./tmpPkgs.nix {} final
    // {
      inherit
        (final)
        alejandra
        arc-theme
        deadnix
        default-cursor
        delta
        emacsPgtkGcc
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
        # Defaults
        cacert
        nix
        ;
      inherit
        (final.haskellPackages)
        brittany
        haskell-language-server
        xmobar
        ;
    };
}
