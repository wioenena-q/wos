{ wos-config, config, pkgs, ... }: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = wos-config.system.user.username;
    homeDirectory = "/home/${wos-config.system.user.username}";
  };
  imports = [ ./modules ./programs ./theme ./pkgs.nix ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  home.packages = with pkgs; [ bat ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
