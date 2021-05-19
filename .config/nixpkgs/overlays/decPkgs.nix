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
      luaformatter
      nix-linter
      nix-zsh-completions
      nixpkgs-fmt
      nordic
      papirus-icon-theme
      patchelf
      pfetch
      rnix-lsp
      shellcheck
      stack
      starship
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
    inherit (self.nodePackages)
      pyright
      ;
  };
}
