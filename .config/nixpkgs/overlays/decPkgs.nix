self: super: {
  decPkgs = super.decPkgs or { } // {
    inherit (self)
      default-cursor
      dmenu
      dwm
      ghc
      glibcLocales
      hlint
      luaformatter
      nix-linter
      nix-zsh-completions
      nixpkgs-fmt
      nordic
      papirus-icon-theme
      pfetch
      rnix-lsp
      shellcheck
      st
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
