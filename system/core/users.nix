{ wos-config, pkgs, ... }:
let inherit (wos-config.system.user) username groups;
in {
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = groups;
    shell = pkgs.fish;
  };
}
