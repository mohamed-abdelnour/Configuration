self: super: {
  dwm = super.dwm.overrideAttrs (_oldAttrs: {
    src = super.fetchFromGitHub {
      owner = "mohamed-abdelnour";
      repo = "dwm";
      rev = "7e3329f5dba2570370d6b6fe858d5ee54be0e630";
      sha256 = "15z4r73rv0cg62jcnfwbf3kj2sk03hs8na697wlvbzfgm9av157y";
    };
    buildInputs = with self.xorg; [ libX11-cursor-fix libXft libXinerama ];
  });
}
