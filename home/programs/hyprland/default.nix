{ pkgs, config, ... }: {
  imports = [ ./scripts ];

  home.packages = with pkgs; [
    swww # For wallpapers
    wl-clipboard # Clipboard
    grim # For screenshot
    slurp # For screenshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./config.nix { inherit config; };
  };
}
