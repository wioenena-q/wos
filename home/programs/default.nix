{ pkgs, ... }: {
  imports = [
    ./hyprland
    ./vscode
    ./neovim
    ./ranger
    ./brave.nix
    ./kitty.nix
    ./cava.nix
    ./obs.nix
    ./git.nix
    ./shell.nix
  ];

  home.packages = with pkgs; [
    # Sound 
    pavucontrol

    # Terminals
    cool-retro-term # Fun terminal

    # Editors
    lapce

    feh # Image viewer
    viu # Image viewer

    # Notification
    libnotify

    # Music
    spotify

    # Tools
    libarchive
    p7zip
    rar
    zip
    unzip
    colordiff
    lsd
    duf
    ncdu
    xdg-user-dirs
    findutils
    diffutils
    hex
    jq
    emote
    neofetch
    htop
    btop
  ];
}
