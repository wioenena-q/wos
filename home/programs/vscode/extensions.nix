{ pkgs, ... }:
let fakeSha = pkgs.lib.fakeSha256;
in {
  home.packages = [

  ];

  programs.vscode.extensions = with pkgs.vscode-extensions;
    [
      dbaeumer.vscode-eslint
      github.copilot
      github.copilot-chat
      mikestead.dotenv
      codezombiech.gitignore
      formulahendry.auto-rename-tag
      pkief.material-icon-theme
      esbenp.prettier-vscode
      tamasfe.even-better-toml
      adpyke.codesnap
      streetsidesoftware.code-spell-checker
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "pretty-ts-errors";
        publisher = "yoavbls";
        version = "0.5.3";
        sha256 = "sha256-JSCyTzz10eoUNu76wNUuvPVVKq4KaVKobS1CAPqgXUA=";
      }
      {
        name = "vsc-material-theme";
        publisher = "equinusocio";
        version = "34.3.1";
        sha256 = "sha256-3yxFTMtjJR1b4EzBDfm55HF9chrya5OUF5wN+KHEduE=";
      }
      {
        name = "fluent-icons";
        publisher = "miguelsolorio";
        version = "0.0.18";
        sha256 = "sha256-sE0A441QPwokBoLoCqtImDHmlAXd66fj8zsJR7Ci+Qs=";
      }
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.17.2";
        sha256 = "sha256-p3SKu9FbtuP6in2dSsr5a0aB5W+YNQ0kMgMJoDYrhcU=";
      }
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "3.0.2";
        sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
      }
      {
        name = "sass-indented";
        publisher = "syler";
        version = "1.8.29";
        sha256 = "sha256-6RYI6Gu5UePTicmKm85ZnN5C19hQASc/t5lHWoKjpYk=";
      }
    ];
}
