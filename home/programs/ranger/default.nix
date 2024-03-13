{ pkgs, ... }:
let ranger-devicons = pkgs.callPackage ./devicons.nix { };
in {
  home.packages = [ pkgs.ranger pkgs.w3m ];

  xdg.configFile."ranger/rc.conf".text = ''
    default_linemode devicons
    set preview_images_method kitty 
  '';

  xdg.configFile."ranger/plugins/ranger_devicons" = {
    source = ranger-devicons;
    recursive = true;
  };
}
