_: _: {
  neovim-nightly = (import <nixpkgs> {
    overlays = [
      (import
        (builtins.fetchTarball {
          url = https://github.com/nix-community/neovim-nightly-overlay/archive/24daa13d67d41887f47db0e17262b244cd5b1afe.tar.gz;
        }))
    ];
  }).neovim-nightly;
}
