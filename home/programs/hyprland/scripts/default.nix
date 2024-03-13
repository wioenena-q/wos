{ ... }:
let inherit (builtins) readFile;
in {
  xdg.configFile."hypr/scripts/wallpaper" = {
    executable = true;
    text = readFile ./wallpaper;
  };
}
