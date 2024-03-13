{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono

      (google-fonts.override { fonts = [ "Inter" ]; })

      inter
      fira-code
      fira-code-symbols
      (nerdfonts.override {
        fonts = [ "FiraCode" "JetBrainsMono" "CascadiaCode" ];
      })
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Inter" "Noto Color Emoji" ];
      monospace = [ "JetBrains Mono" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
