_: _: {
  neovim-nightly = (import <nixpkgs> {
    overlays = [
      (import
        (builtins.fetchTarball {
          url = https://github.com/nix-community/neovim-nightly-overlay/archive/945e2862cacd95c06ff444c44e83f1539653fa01.tar.gz;
        }))
    ];
  }).neovim-nightly;
}
