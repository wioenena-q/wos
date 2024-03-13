{ pkgs, ... }: { environment.systemPackages = with pkgs; [ vim nano ]; }
