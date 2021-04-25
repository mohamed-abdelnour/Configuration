self: super: {
  dwm = super.dwm.overrideAttrs (oldAttrs: rec {
    src = super.fetchgit {
      url = "git://git.suckless.org/dwm";
      sha256 = "1mdg6kgvz3vj6n9hjyg4pxi5589mpzhw8lqsxsa7vcs7z5szdjb6";
      rev = "67d76bdc68102df976177de351f65329d8683064";
    };
    buildInputs = with self.xorg; [ libX11-cursor-fix libXinerama libXft ];
    configFile = super.writeText "config.def.h"
      (builtins.readFile ~/.config/dwm/config.def.h);
    patches = [
      ~/.config/dwm/dwm.diff
    ];
    postPatch = ''
      ${oldAttrs.postPatch}
      cp ${configFile} config.def.h
    '';
  });
}
