self: super: {
  dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
    src = super.fetchgit {
      url = "git://git.suckless.org/dmenu";
      sha256 = "0gjjbh49j85rpbmiqj236g4c1zb1h8xh41mcjsvnzgwn72893mk6";
      rev = "1a13d0465d1a6f4f74bc5b07b04c9bd542f20ba6";
    };
    buildInputs = with self; [
      zlib
      xorg.libX11-cursor-fix
      xorg.libXinerama
      xorg.libXft
    ];
    configFile = super.writeText "config.def.h"
      (builtins.readFile "${super.fetchurl {
        url = "https://raw.githubusercontent.com/mohamed-abdelnour/Configuration/main/.config/dmenu/config.def.h";
        sha256 = "1dvxb0w8pj8b9njdwq2ai0bvfh90hc1r6apcw22gij5dd1aff27r";
    }}");
    patches = [
      (super.fetchurl {
        url = "https://raw.githubusercontent.com/mohamed-abdelnour/Configuration/main/.config/dmenu/dmenu.diff";
        sha256 = "1cw2ywsk0lvrfv4322w8jslnvplkxxlzsg8v3d7h0nsa1qsfpy0i";
      })
    ];
    postPatch = ''
      ${oldAttrs.postPatch}
      cp ${configFile} config.def.h
    '';
  });
}
