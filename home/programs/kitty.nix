{ ... }: {
  programs.kitty = {
    enable = true;
    font = { name = "JetBrainsMono Nerd"; };
    settings = {
      enable_audio_bell = false;
      background = "#111111";
      background_opacity = "0.7";
    };

    keybindings = {
      # Window
      "ctrl+shift+enter" = "new_window";
      "ctrl+alt+enter" = "launch --cwd=current";
      "ctrl+shift+n" = "new_os_window";
      "ctrl+shift+w" = "close_window";

      # Tabs
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+tab" = "next_tab";
      "ctrl+shift+tab" = "previous_tab";
      "ctrl+shift+alt+t" = "set_tab_title";

      # Font
      "ctrl+shift+plus" = "change_font_size all +2.0";
      "ctrl+shift+minus" = "change_font_size all -2.0";
      "ctrl+shift+backspace" = "change_font_size all 0";

      # Select and act on visible text
      "ctrl+shift+e" = "open_url_with_hints"; # Open URL
      "ctrl+shift+p>f" =
        "kitten hints --type path --program -"; # Insert selected path
      "ctrl+shift+p>shift+f" = "kitten hints --type path"; # Open selected path
      "ctrl+shift+p>l" =
        "kitten hints --type line --program -"; # Insert selected line
      "ctrl+shift+p>w" =
        "kitten hints --type word --program -"; # Insert selected word
      "ctrl+shift+p>h" =
        "kitten hints --type hash --program -"; # Insert selected hash
      "ctrl+shift+p>n" =
        "kitten hints --type linenum"; # Open the selected file at the selected line
      "ctrl+shift+p>y" =
        "kitten hints --type hyperlink"; # Open the selected hyperlink
      "ctrl+shift+u" = "kitten unicode_input"; # Unicode input
      "ctrl+shift+escape" = "kitty_shell window"; # Open the kitty command shell

    };
  };
}
