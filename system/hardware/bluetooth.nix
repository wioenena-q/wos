{ pkgs, ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;

    package = pkgs.bluez5-experimental;
  };
}
