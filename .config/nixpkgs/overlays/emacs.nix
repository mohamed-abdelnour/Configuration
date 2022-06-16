let
  nixpkgs_pinned = builtins.fetchTarball {
    name = "nixpkgs-unstable-2022-02-01";
    url = "https://github.com/nixos/nixpkgs/archive/e0169d7a9d324afebf5679551407756c77af8930.tar.gz";
  };
  overlay = builtins.fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/8a5064eefe2662589475aaba320ff8fcb663dd75.tar.gz";
  };
  nixpkgs = import nixpkgs_pinned {
    overlays = [
      (import overlay)
    ];
  };
in
  _: _: {
    inherit (nixpkgs) emacsGitNativeComp;
  }
