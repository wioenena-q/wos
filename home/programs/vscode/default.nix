{ pkgs, ... }: {
  imports = [ ./extensions.nix ./userSettings.nix ];
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
  };
}
