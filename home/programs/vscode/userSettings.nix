{ ... }: {
  programs.vscode.userSettings = {
    "window.titleBarStyle" = "custom";
    "window.zoomLevel" = 1;

    "editor.fontFamily" =
      "'CaskaydiaCove Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
    "editor.fontSize" = 20;
    "editor.fontLigatures" =
      "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'";
    "editor.cursorStyle" = "block";
    "editor.cursorBlinking" = "phase";
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.tokenColorCustomizations" = {
      "textMateRules" = [{
        "scope" = [ "source.js" ];
        "settings" = { "fontStyle" = "italic"; };
      }];
    };
    "editor.minimap.autohide" = true;

    "workbench.colorTheme" = "Material Theme Ocean";
    "workbench.iconTheme" = "material-icon-theme";
    "workbench.productIconTheme" = "fluent-icons";
    "workbench.activityBar.location" = "top";

    "files.autoSave" = "off";

    # Extensions
    "codesnap.backgroundColor" = "#00000000";
    "codesnap.boxShadow" = "rgba(0, 0, 0, 0) 0px 20px 68px";
    "codesnap.showWindowTitle" = true;
    "codesnap.shutterAction" = "copy";
    "codesnap.target" = "container";
  };
}
