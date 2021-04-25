self: super: {
  extra-libs = (super.callPackage
    ({ stdenv }:
      let
        libc = super.lib.makeLibraryPath [ self.glibc ] + "/libc.so.6";
        libgcc_s = super.lib.makeLibraryPath [ self.stdenv.cc.cc.lib ] + "/libgcc_s.so.1";
        libstdc = super.lib.makeLibraryPath [ self.stdenv.cc.cc.lib ] + "/libstdc++.so.6";
      in
      stdenv.mkDerivation {
        name = "extra-libs";
        unpackPhase = "true";
        outputs = [ "out" ];
        installPhase = ''
          mkdir -p $out/lib
          ln -s ${libc} $out/lib/
          ln -s ${libgcc_s} $out/lib/
          ln -s ${libstdc} $out/lib/
        '';
      })
    { });
}
