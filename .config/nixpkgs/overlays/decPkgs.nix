self: super: {
  decPkgs = super.decPkgs or { }
    // import ./tmpPkgs.nix { } self
    // {
    inherit (self)
      arc-theme
      default-cursor
      delta
      ghc
      glibcLocales
      hlint
      librsvg
      luaformatter
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
      stylua
      tmpmail
      ttfautohint
      vanilla-dmz
      # Defaults
      cacert
      nix
      ;
    inherit (self.haskellPackages)
      brittany
      haskell-language-server
      xmobar
      ;
  };
}
