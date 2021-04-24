self: super: {
  st = super.st.overrideAttrs (oldAttrs: rec {
    src = super.fetchgit {
      url = "git://git.suckless.org/st";
      sha256 = "138z5wmwwzl82hyz92psfga60mk5zq0c2m5lqpxc63k8qcqw69gr";
      rev = "9e68fdbcdb06dfa3d23fe3a7a7f7b59e40e1ea2f";
    };
    buildInputs = with self.xorg; [ libX11-cursor-fix libXft ];
    configFile = super.writeText "config.def.h"
      (builtins.readFile ~/.config/st/config.def.h);
    patches = [
      ~/.config/st/st.diff
    ];
    postPatch = ''
      ${oldAttrs.postPatch}
      cp ${configFile} config.def.h
    '';
  });
}
