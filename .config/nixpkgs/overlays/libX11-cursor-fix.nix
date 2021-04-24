final: prev:
{
  xorg = prev.xorg // {
    libX11-cursor-fix = prev.xorg.libX11.overrideAttrs (oldAttrs: {
      postPatch = (oldAttrs.postPatch or "") + ''
        substituteInPlace src/CrGlCur.c --replace "libXcursor.so.1" \
          "${final.xorg.libXcursor}/lib/libXcursor.so.1"
      '';
    });
  };
}
