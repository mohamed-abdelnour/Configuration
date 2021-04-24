self: super: {
  st = super.st.overrideAttrs (oldAttrs: rec {
    src = super.fetchgit {
      url = "git://git.suckless.org/st";
      sha256 = "138z5wmwwzl82hyz92psfga60mk5zq0c2m5lqpxc63k8qcqw69gr";
      rev = "9e68fdbcdb06dfa3d23fe3a7a7f7b59e40e1ea2f";
    };
    buildInputs = with self.xorg; [ libX11-cursor-fix libXft ];
    configFile = super.writeText "config.def.h"
      (builtins.readFile "${super.fetchurl {
        url = "https://raw.githubusercontent.com/mohamed-abdelnour/Configuration/main/.config/st/config.def.h";
        sha256 = "16b3dlbskr0wj147jh5zpqdfrgsbx828aj4avf0i3915p2w5f1ph";
    }}");
    patches = [
      (super.fetchurl {
        url = "https://raw.githubusercontent.com/mohamed-abdelnour/Configuration/main/.config/st/st.diff";
        sha256 = "0iy7plj0gkxx3lb0mk466ik5pm22dk8dgbsarfwgh1lac9qsw4yw";
      })
    ];
    postPatch = ''
      ${oldAttrs.postPatch}
      cp ${configFile} config.def.h
    '';
  });
}
