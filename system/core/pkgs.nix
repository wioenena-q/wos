{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Filesystem utilites
    btrfs-progs
    dosfstools
    exfatprogs
    e2fsprogs
    ntfs3g
  ];
}
