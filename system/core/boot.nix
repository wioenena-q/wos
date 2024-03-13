{ host, local-pkgs, pkgs, lib, ... }: {
  boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = [ "btrfs" ];
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "quiet" "splash" "udev.log_level=3" ]
      ++ lib.optionals (host == "laptop") [ "i915.force_probe=46a8" ];

    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        theme = local-pkgs.distro-grub-themes;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };

  hardware.cpu.intel.updateMicrocode = lib.mkIf (host == "laptop") true;
}
