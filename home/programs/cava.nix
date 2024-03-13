{ pkgs, ... }: {
  programs.cava = {
    enable = true;
    package = pkgs.cava.override {
      withPipewire = true;
      withSDL2 = true;
    };
    settings = {
      general = {
        mode = "normal";
        framerate = 60;
        autosens = 1;
        overshoot = 20;
        sensitivity = 100;
        bars = 0;
        bar_width = 20;
        bar_spacing = 5;
        bar_height = 32;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
        sleep_timer = 0;
      };

      input = {
        # method = pulse
        # source = auto
        method = "pipewire";
        source = "auto";
        # method = alsa
        # source = hw:Loopback,1
        sample_rate = 44100;
        sample_bits = 16;
        channels = 2;
        autoconnect = 2;
      };

      output = {
        method = "sdl"; # ncurses, noncurses, raw, noritake, sdl or sdl_glsl
        orientation = "bottom"; # bottom, top, left or right
        channels = "stereo";
        mono_option = "average";
        reverse = 0;
        raw_target = "/dev/stdout";
        # data_format = "binary";
        # bit_format = "16bit";
        # ascii_max_range = 1000;
        # bar_delimiter = 59;
        # frame_delimiter = 10;
        sdl_width = 1000;
        sdl_height = 500;
        sdl_x = -1;
        sdl_y = -1;
        sdl_full_screen = 0;
        # xaxis = "none"; # for ncurses or noncurses output
        # alacritty_sync = 0; # for allacritty
        # vertex_shader = "pass_through.vert"; # for glsl output
        # fragment_shader = "bar_spectrum.frag"; # for glsl output
        # continuous_rendering = 0; # for glsl output
        disable_blanking = 0;
        show_idle_bar_heads = 1;
        waveform = 0;
      };

      color = {
        # background = "default";
        # foreground = "default";
        background = "'#111111'";
        foreground = "'#33ffff'";
        gradient = 1;
        gradient_count = 8;
        gradient_color_1 = "'#797dec'";
        gradient_color_2 = "'#4c52e6'";
        gradient_color_3 = "'#2026df'";
        gradient_color_4 = "'#191eae'";
        gradient_color_5 = "'#191eae'";
        gradient_color_6 = "'#2026df'";
        gradient_color_7 = "'#4c52e6'";
        gradient_color_8 = "'#797dec'";
      };

      smoothing = {
        integral = 77;
        monstercat = 0;
        waves = 0;
        gravity = 100;
        ignore = 0;
        noise_reduction = 77;
      };

      eq = {
        "1" = 1; # bass
        "2" = 1;
        "3" = 1; # midtone
        "4" = 1;
        "5" = 1; # treble
      };
    };
  };
}
