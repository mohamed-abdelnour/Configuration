_: prev: {
  default-cursor =
    prev.callPackage
    (
      {stdenv}:
        stdenv.mkDerivation
        {
          name = "default-cursor";
          unpackPhase = "true";
          outputs = ["out"];
          installPhase = ''
            mkdir -p $out/share/icons/default
            cat << EOF > $out/share/icons/default/index.theme
            [Icon Theme]
            Inherits=Vanilla-DMZ
            EOF
          '';
        }
    )
    {};
}
