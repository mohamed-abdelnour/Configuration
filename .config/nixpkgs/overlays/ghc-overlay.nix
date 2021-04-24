_self: super: {
  ghc = super.haskellPackages.ghcWithPackages (
    haskellPackages: with haskellPackages; [
      arithmoi
      hashtables
      implicit-hie
      regex-pcre
      regex-tdfa
      unordered-containers
      utf8-string
      vector
      xmonad
      xmonad-contrib
    ]
  );
}
# ghc = super.haskell.packages.ghc8103.ghcWithPackages (
