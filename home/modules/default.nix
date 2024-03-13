{ lib, ... }:
with lib; {
  imports = [ ./options.nix ./theme ];
  home-config = { };
}
