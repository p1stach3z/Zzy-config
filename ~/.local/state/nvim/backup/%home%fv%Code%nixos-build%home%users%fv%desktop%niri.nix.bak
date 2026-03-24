{ config, pkgs, lib, specialArgs, ... }:

let
  actions = config.lib.niri.actions;
  Mod = "Mod";
in
{
  
  programs.niri.package = pkgs.niri-unstable;

  programs.niri = {

    settings = {
      outputs."eDP-1" = {
        mode = {
          width = 1920;
          height = 1200;
          refresh = 60.0;
        };
        scale = 1.0;
      };

      input = {
        keyboard = {
          numlock = true;
          repeat-delay = 350;
          repeat-rate = 40;
          xkb.layout = "latam";
        };

        touchpad = {
          tap = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          scroll-factor = 1.0;
          accel-speed = 0.2;
          dwt = true;
          dwtp = true;
          click-method = "clickfinger";
        };
      };

      cursor = {
        theme = "adwaita-dark";
        size = 20;
        hide-when-typing = true;
        hide-after-inactive-ms = 1000;
      };

      layout = {
        gaps = 16;
        border = {
          enable = true;
          width = 4;
          # color = "red";
        };
        shadow.enable = true;
      };

      window-rules = [
        {
          matches = [ { app-id = "firefox"; } ];
          open-maximized = true;
        }
        {
          matches = [ { app-id = "kitty"; } ];
        }
        # { matches = [ { geometry-corner-radius = "12"; } ]; }
        # { matches = [ { clip-to-geometry = "true"; } ]; }
      ];

      prefer-no-csd = true;

      # Todo lo demás arranca vía systemd --user
      spawn-at-startup = [
        { argv = [ "uwsm" "finalize" ]; }
      ];

      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite-unstable;
      };

      binds = {
        "${Mod}+Return".action.spawn = [ "uwsm" "app" "--" "kitty" ];
        "${Mod}+R".action.spawn = [ "uwsm" "app" "--" "fuzzel" ];
        "${Mod}+W".action.spawn = [ "uwsm" "app" "--" "firefox" ];

        "${Mod}+Q".action = actions.close-window;
        "${Mod}+F".action = actions.maximize-column;
        "${Mod}+V".action = actions.toggle-window-floating;
        "${Mod}+Shift+V".action = actions.switch-focus-between-floating-and-tiling;

        "${Mod}+Left".action = actions.focus-column-left;
        "${Mod}+Right".action = actions.focus-column-right;
        "${Mod}+Down".action = actions.focus-window-down;
        "${Mod}+Up".action = actions.focus-window-up;

        "${Mod}+WheelScrollDown".action = actions.focus-column-right;
        "${Mod}+WheelScrollUp".action = actions.focus-column-left;

        "${Mod}+1".action.focus-workspace = 1;
        "${Mod}+2".action.focus-workspace = 2;
        "${Mod}+3".action.focus-workspace = 3;
        "${Mod}+4".action.focus-workspace = 4;
        "${Mod}+5".action.focus-workspace = 5;
        "${Mod}+6".action.focus-workspace = 6;
        "${Mod}+7".action.focus-workspace = 7;
        "${Mod}+8".action.focus-workspace = 8;
        "${Mod}+9".action.focus-workspace = 9;

        "${Mod}+Shift+1".action.move-window-to-workspace = 1;
        "${Mod}+Shift+2".action.move-window-to-workspace = 2;
        "${Mod}+Shift+3".action.move-window-to-workspace = 3;
        "${Mod}+Shift+4".action.move-window-to-workspace = 4;
        "${Mod}+Shift+5".action.move-window-to-workspace = 5;
        "${Mod}+Shift+6".action.move-window-to-workspace = 6;
        "${Mod}+Shift+7".action.move-window-to-workspace = 7;
        "${Mod}+Shift+8".action.move-window-to-workspace = 8;
        "${Mod}+Shift+9".action.move-window-to-workspace = 9;

        "XF86AudioRaiseVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+" ];
        "XF86AudioLowerVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-" ];
        "XF86AudioMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
        "XF86AudioMicMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
        "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "+10%" ];
        "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "10%-" ];

        "Print".action.spawn = [
	  "sh" "-c"
	  "mkdir -p ~/Media/pictures/screenshots && grim ~/Media/pictures/screenshots/ss-$(date +%F-%H%M%S).png"
	];

	"Shift+Print".action.spawn = [
	  "sh" "-c"
	  "mkdir -p ~/Media/pictures/screenshots && FILE=~/Media/pictures/screenshots/ss-$(date +%F-%H%M%S).png && grim -g \"$(slurp)\" \"$FILE\" && wl-copy < \"$FILE\""
	];
      };
      
      environment = {
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        _JAVA_AWT_WM_NONREPARENTING = "1";

        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri";
        XDG_CURRENT_DESKTOP = "niri";
      };

      debug = {
        render-drm-device = "/dev/dri/renderD128";
      };
    };
  };
}
