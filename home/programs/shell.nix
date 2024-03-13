{ pkgs, lib, ... }:
let
  randomRusselTheme = pkgs.fetchFromGitHub {
    owner = "lightify97";
    repo = "randomrussel";
    rev = "139b2e0ced406ace5bcaa5ee2f85a4245f342b8f";
    sha256 = "sha256-0Hp3x+7++xhIwIZSWQs7023tBkVBZSr/rL2qXjmFiw4=";
  };
in {
  home.packages = [
    pkgs.thefuck # TheFuck
  ];

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "spark.fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "spark.fish";
          rev = "c598d164c463ce3d27b7a50b65865fddf40af71a";
          sha256 = "sha256-AIFj7lz+QnqXGMBCfLucVwoBR3dcT0sLNPrQxA5qTuU=";
        };
      }
      {
        name = "autopair.fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "204014f7e268a655d1f29562130c202da6750681";
          sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
        };
      }
      {
        name = "pupper-fish";
        src = pkgs.fetchFromGitHub {
          owner = "nickeb96";
          repo = "puffer-fish";
          rev = "5d3cb25e0d63356c3342fb3101810799bb651b64";
          sha256 = "sha256-aPxEHSXfiJJXosIm7b3Pd+yFnyz43W3GXyUB5BFAF54=";
        };
      }
      {
        name = "projectdo";
        src = pkgs.fetchFromGitHub {
          owner = "paldepind";
          repo = "projectdo";
          rev = "62b7e6fe90907ed8aeb874ac65349d0e04268783";
          sha256 = "sha256-6jvUA7JeleEwcTrgzVhy9wwHHZh8lPuKJ/yzH5H29Ig=";
        };
      }
      {
        name = "fish-abbreviation-tips";
        src = pkgs.fetchFromGitHub {
          owner = "gazorby";
          repo = "fish-abbreviation-tips";
          rev = "8ed76a62bb044ba4ad8e3e6832640178880df485";
          sha256 = "sha256-F1t81VliD+v6WEWqj1c1ehFBXzqLyumx5vV46s/FZRU=";
        };
      }
      {
        name = "oh-my-fish-bang-bang";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-bang-bang";
          rev = "ec991b80ba7d4dda7a962167b036efc5c2d79419";
          sha256 = "sha256-oPPCtFN2DPuM//c48SXb4TrFRjJtccg0YPXcAo0Lxq0=";
        };
      }
      {
        name = "oh-my-fish-gi";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-gi";
          rev = "48bc41a86c5dcf14ffe3745a7f61cba728a4de0c";
          sha256 = "sha256-njrOCUaWVj+CIZTUzRGrG4yxcEONEl2fpYuXZrAd4qg=";
        };
      }
    ];
  };

  # TheFuck alias
  xdg.configFile."fish/functions/fuck.fish".text = ''
    function fuck -d "Correct your previous console command"
      set -l fucked_up_command $history[1]
      env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
      if [ "$unfucked_command" != "" ]
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge
      end
    end
  '';

  # randomrussel theme
  xdg.configFile."fish/functions/fish_prompt.fish".text =
    builtins.readFile "${randomRusselTheme}/fish_prompt.fish";
}
