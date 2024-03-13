{ pkgs, ... }: {
  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.catppuccin-cursors.frappeDark;
      name = "Catppuccin-Frappe-Dark-Cursors";
      size = 24;
    };

    font = { name = "Roboto"; };

    # iconTheme = {
    #  package = pkgs.fluent-icon-theme;
    #  name = "Fluent";
    # };

    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Frappe-Standard-Blue-Dark";
    };

    gtk2.extraConfig = "";
    gtk3.extraConfig = { };
    gtk4.extraConfig = { };
  };
}
