_: prev: {
  ghc = prev.haskellPackages.ghcWithPackages (
    haskellPackages:
      with haskellPackages; [
        xmonad
        xmonad-contrib
      ]
  );
}
