
{ config, pkgs, lib, ... }:
let 
  actions = config.lib.niri.actions;
in
{
  programs.niri.settings = {
    outputs."eDP-1" = {
      mode = { width = 1920; height = 1200; refresh = 60.0; };
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
      theme = "adwaita";
      size = 20;
      hide-when-typing = true;
      hide-after-inactive-ms = 1000;
    };

    layout = {
      gaps = 16;
      border = {
        enable = true;
	width = 4;
#	color = "red";
      };
      shadow.enable = true;
    };

    window-rules = [
      { matches = [ { app-id = "firefox"; } ]; open-maximized = true; }
      { matches = [ { app-id = "kitty"; } ]; }
#      { matches = [ { geometry-corner-radius = "12"; } ]; }
 #     { matches = [ { clip-to-geometry = "true"; } ]; }
    ];

    prefer-no-csd = true;

    # CRÍTICO: aquí NO se arranca waybar/mako/polkit.
    # Todo eso va en systemd --user para evitar duplicados.
    spawn-at-startup = [
      { argv = [ "uwsm" "finalize" ]; }
    ];

    binds = with config.lib.niri.actions;
    let
      Mod = "Mod";
    in
    {

      "${Mod}+Return".action.spawn = [ "uwsm" "app" "--" "kitty" ];
      "${Mod}+R".action.spawn = [ "uwsm" "app" "--" "fuzzel" ];
      "${Mod}+W".action.spawn = [ "uwsm" "app" "--" "firefox" ];

      "${Mod}+Q".action = close-window;
      "${Mod}+F".action = maximize-column;
      "${Mod}+V".action = toggle-window-floating;
      "${Mod}+Shift+V".action = switch-focus-between-floating-and-tiling;

      "${Mod}+Left".action = focus-column-left;
      "${Mod}+Right".action = focus-column-right;
      "${Mod}+Down".action = focus-window-down;
      "${Mod}+Up".action = focus-window-up;

      "${Mod}+WheelScrollDown".action = focus-column-right;
      "${Mod}+WheelScrollUp".action = focus-column-left;

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
    
      "print".action.spawn = [ "grim ~/Media/pictures/screenshots/ss-$(date +%F-%T).png" ];
      "Shift+Print".action.spawn = [ "grim -g \"$(slurp)\" ~/Media/pictures/screenshots/ss-$(date +%F-%T).png" ];
   };
    
   
    environment = {
      QT_QPA_PLATFORM = "wayland";
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
 
}
