self: super: {
  dmenu = super.dmenu.overrideAttrs (_oldAttrs: {
    src = super.fetchFromGitHub {
      owner = "mohamed-abdelnour";
      repo = "dmenu";
      rev = "c39266dee6414f839fd7e68b76b5cf63dba4c4da";
      sha256 = "08v1w17vdwv1i04g0nzv4fbpv2rzy0vw34gj6rdwkc2xbs7y5k4g";
    };
    buildInputs = with self; [
      xorg.libX11-cursor-fix
      xorg.libXft
      xorg.libXinerama
      zlib
    ];
  });
}
