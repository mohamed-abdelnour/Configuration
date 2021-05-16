self: super: {
  st = super.st.overrideAttrs (_oldAttrs: {
    src = super.fetchFromGitHub {
      owner = "mohamed-abdelnour";
      repo = "st";
      rev = "935bd480519365b0c07cd2d9ecada28e42e3313a";
      sha256 = "1rvkdzcp5ww5dvj578j6vff23cpz7xpfbn0hkb4iqbmldrggjj0z";
    };
    buildInputs = with self.xorg; [ libX11-cursor-fix libXft ];
  });
}
