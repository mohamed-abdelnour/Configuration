_: _: {
  neovim-nightly = (import <nixpkgs> {
    overlays = [
      (import
        (builtins.fetchTarball {
          url = "https://github.com/nix-community/neovim-nightly-overlay/archive/19311b9ef8f8f8c71b2f41b59ec9e436646b667c.tar.gz";
        }))
    ];
  }).neovim-nightly;
}
