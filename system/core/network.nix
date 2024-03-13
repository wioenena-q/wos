{ ... }: {
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };
  };

  services.resolved.enable = true;
}
