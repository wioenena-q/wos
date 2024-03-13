{ lib, ... }:
with lib; {
  options.home-config = mkOption { type = types.attrs; };
}
