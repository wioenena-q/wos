{ config }:
let
  naturalScroll = "true";
  terminal = "kitty";
  gapsIn = "2";
  gapsOut = "10";
  borderSize = "2";
  activeBorderColor = "rgba(33CCFFEE) rgba(00FF99EE) 45deg";
  inactiveBorderColor = "rgba(595959AA)";
  layout = "dwindle";
  rounding = "0";
  blurSize = "3";
  cfg = config.home-config;

  makeWorkspaceBinding = { }:
    builtins.concatStringsSep "\n    " (builtins.genList (x:
      let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
      in ''
        bind = $mainMod, ${ws}, workspace, ${toString (x + 1)}
        bind = $mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}'')
      10);
in ''
        monitor =,1920x1080@120,auto,1.25

        # Auto-start
        exec-once = hyprctl setcursor "Catppuccin-Frappe-Dark-Cursors" 24
        exec-once = swww init

        # Env
        ## Toolkit
        env = GDK_BACKEND,wayland,x11env = SDL_VIDEODRIVER, wayland
        env = CLUTTER_BACKEND, wayland

        ## XDG
        env = XDG_CURRENT_DESKTOP, Hyprland
        env = XDG_SESSION_TYPE, wayland
        env = XDG_SESSION_DESKTOP, Hyprland

        ## QT
        env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
        env = QT_QPT_PLATFORM, "wayland;xcb"
        env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
        env = QT_QPA_PLATFORMTHEME, qt5ct

        ## Theming
        env = XCURSOR_SIZE, ${toString cfg.theme.cursorSize}

        input {
            kb_layout = tr
            kb_variant =
            kb_model =
            kb_options =
            kb_rules =

            follow_mouse = 1

            touchpad {
                disable_while_typing = true
                natural_scroll = ${naturalScroll}
            }

            numlock_by_default = true 

            sensitivity = 0
        }

        general {
            gaps_in = ${gapsIn}
            gaps_out = ${gapsOut}

            border_size = ${borderSize}
            col.active_border = ${activeBorderColor}
            col.inactive_border = ${inactiveBorderColor}

            layout = ${layout} 

            allow_tearing = false
        }

        decoration {
            rounding = ${rounding}
            
            blur {
                enabled = true
                size = ${blurSize}
                passes = 1
    	      special = true
  	      new_optimizations = true
  	      # xray = true
  	      ignore_opacity = true 
            }

            drop_shadow = false
            shadow_range = 4
            shadow_render_power = 3
            col.shadow = rgba(1a1a1aee)

            dim_inactive = false
            dim_strength = 0.2
            dim_special = 0.5
        }

        animations {
            enabled = yes

            bezier = myBezier, 0.05, 0.9, 0.1, 1.05

            animation = windows, 1, 7, myBezier
            animation = windowsOut, 1, 7, default, popin 80%
            animation = border, 1, 10, default
            animation = borderangle, 1, 8, default
            animation = fade, 1, 7, default
            animation = workspaces, 1, 6, default
        }

        dwindle {
            pseudotile = true 
            # preserve_split = true
            no_gaps_when_only = 2
        }

        master {
            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
            new_is_master = true
        }

        gestures {
            workspace_swipe = true 
        }

        misc {
            disable_hyprland_logo = true
            disable_autoreload = false
            enable_swallow = true 
            swallow_regex = ^(kitty)$
        }

        xwayland {
          force_zero_scaling = true;
        }

        # Example windowrule v1
        # windowrule = float, ^(kitty)$
        # Example windowrule v2
        # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.


        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        $mainMod = SUPER

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = $mainMod, Q, exec, ${terminal}
        bind = $mainMod, C, killactive, 
        bind = $mainMod, M, exit, 
        bind = $mainMod, V, togglefloating, 
        bind = $mainMod, R, exec, $menu
        bind = $mainMod, P, togglesplit, # dwindle
        bind = $mainMod, F, fullscreen
        bind = , Print, exec, grim - | wl-copy 
        bind = $mainMod, Print, exec, grim -g "$(slurp -d)" - | wl-copy 

        # Move focus with mainMod + arrow keys
        bind = $mainMod, h, movefocus, l
        bind = $mainMod, l, movefocus, r
        bind = $mainMod, k, movefocus, u
        bind = $mainMod, j, movefocus, d

        # Workspaces 
        ${makeWorkspaceBinding { }}

        # Example special workspace (scratchpad)
        bind = $mainMod, S, togglespecialworkspace, magic
        bind = $mainMod SHIFT, S, movetoworkspace, special:magic

        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow
''
