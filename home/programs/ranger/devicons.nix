{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation {
  name = "ranger-devicons";
  version = "master";

  src = pkgs.fetchFromGitHub {
    owner = "alexanderjeurissen";
    repo = "ranger_devicons";
    rev = "2c3c19dffb4238d01c74515c9eed5088066db243";
    sha256 = "sha256-HLeiV3c+8fl3kiht01s3H/HGPABPC2033rMB/uXKwLM=";
  };

  installPhase = ''
    mkdir $out
    cp ./*.py $out
  '';
}
