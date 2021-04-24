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
      (builtins.readFile ~/.config/dmenu/config.def.h);
    patches = [
      ~/.config/dmenu/dmenu.diff
    ];
    postPatch = ''
      ${oldAttrs.postPatch}
      cp ${configFile} config.def.h
    '';
  });
}
