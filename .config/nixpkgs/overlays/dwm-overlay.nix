self: super: {
  dwm = super.dwm.overrideAttrs (oldAttrs: rec {
    src = super.fetchgit {
      url = "git://git.suckless.org/dwm";
      sha256 = "1mdg6kgvz3vj6n9hjyg4pxi5589mpzhw8lqsxsa7vcs7z5szdjb6";
      rev = "67d76bdc68102df976177de351f65329d8683064";
    };
    buildInputs = with self.xorg; [ libX11-cursor-fix libXinerama libXft ];
    configFile = super.writeText "config.def.h"
      (builtins.readFile "${super.fetchurl {
        url = "https://raw.githubusercontent.com/mohamed-abdelnour/Configuration/main/.config/dwm/config.def.h";
        sha256 = "0nbii4g7bf3xg3plrv91cs9xqp7nwnk58si94hsy84xgrfv3j6sc";
    }}");
    patches = [
      (super.fetchurl {
        url = "https://raw.githubusercontent.com/mohamed-abdelnour/Configuration/main/.config/dwm/dwm.diff";
        sha256 = "0d9vdgc8540wply6pay1rlwxdb6nhhcxbhd1i0grz6s79a2gc3h2";
      })
    ];
    postPatch = ''
      ${oldAttrs.postPatch}
      cp ${configFile} config.def.h
    '';
  });
}
