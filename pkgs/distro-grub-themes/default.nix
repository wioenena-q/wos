{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation {
  name = "distro-grub-themes";
  version = "v3.2";

  src = pkgs.fetchFromGitHub {
    owner = "AdisonCavani";
    repo = "distro-grub-themes";
    rev = "e3a1d12a500b66aaf97ab2b9ad6b616ee6d8c232";
    sha256 = "sha256-U5QfwXn4WyCXvv6A/CYv9IkR/uDx4xfdSgbXDl5bp9M=";
  };

  unpackPhase = ''
    ${pkgs.gnutar}/bin/tar -xf $src/themes/nixos.tar
  '';

  installPhase = ''
    mkdir $out
    cp -r ./* $out/
  '';
}

