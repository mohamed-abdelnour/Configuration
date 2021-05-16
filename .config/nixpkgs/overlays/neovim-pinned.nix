self: super: {
  neovim-pinned = super.neovim-unwrapped.overrideAttrs (oldAttrs: {
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "4570d04b16b4de0731455681f4db4bd27c77fc4c";
      sha256 = "0fffyspflnchry1gnxzad57nlddzc964383p7i0x8qxh3c8ki58s";
    };
    buildInputs = oldAttrs.buildInputs ++ [ self.tree-sitter ];
  });
}
