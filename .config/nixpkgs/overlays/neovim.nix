_: _: {
  neovim-nightly = (import <nixpkgs> {
    overlays = [
      (import
        (builtins.fetchTarball {
          url = https://github.com/nix-community/neovim-nightly-overlay/archive/b8308a5693b3b027d75a16ea65dca8d98619027b.tar.gz;
        }))
    ];
  }).neovim-nightly;
}
