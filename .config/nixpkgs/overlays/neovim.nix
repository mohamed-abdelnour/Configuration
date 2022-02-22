let
  overlay = builtins.fetchTarball {
    url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
  };
  nixpkgs = import <nixpkgs> {
    overlays = [
      (import overlay)
    ];
  };
in
  _: _: {
    inherit (nixpkgs) neovim-nightly;
  }
