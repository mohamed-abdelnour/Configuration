let
  nixpkgs_pinned = builtins.fetchTarball {
    name = "nixpkgs-unstable-2022-02-01";
    url = "https://github.com/nixos/nixpkgs/archive/5efc8ca954272c4376ac929f4c5ffefcc20551d5.tar.gz";
  };
  overlay = builtins.fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/7ba0cd76c4e5cbd4a8ac7387c8ad2493caa800f0.tar.gz";
  };
  nixpkgs = import nixpkgs_pinned {
    overlays = [
      (import overlay)
    ];
  };
in
  _: _: {
    inherit (nixpkgs) emacsPgtkGcc;
  }
