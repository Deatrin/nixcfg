{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.wayland;
in {
  options.features.desktop.wayland.enable = mkEnableOption "wayland extra tools and config";

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      style = ''
      @define-color background-darker rgba(30, 31, 41, 230);
      @define-color background #282a36;
      @define-color selection #44475a;
      @define-color foreground #f8f8f2;
      @define-color comment #6272a4;
      @define-color cyan #8be9fd;
      @define-color green #50fa7b;
      @define-color orange #ffb86c;
      @define-color pink #ff79c6;
      @define-color purple #bd93f9;
      @define-color red #ff5555;
      @define-color yellow #f1fa8c;

      * {
          border: none;
          border-radius: 0;
          font-family: Iosevka;
          font-size: 11pt;
          min-height: 0;
        }
        window#waybar {
            opacity: 0.9;
            background: @background-darker;
            color: @foreground;
            border-bottom: 2px solid @background;
        }
        #workspaces button {
            padding: 0 10px;
            background: @background;
            color: @foreground;
        }
        #workspaces button:hover {
            box-shadow: inherit;
            text-shadow: inherit;
            background-image: linear-gradient(0deg, @selection, @background-darker);
        }
        #workspaces button.active {
            background-image: linear-gradient(0deg, @purple, @selection);
        }
        #workspaces button.urgent {
            background-image: linear-gradient(0deg, @red, @background-darker);
        }
        #taskbar button.active {
            background-image: linear-gradient(0deg, @selection, @background-darker);
        }
        #clock {
            padding: 0 4px;
            background: @background;
        }
      '';
      settings = {
        mainbar = {
          layer = "top";
          position = "top";
          mod = "dock";
          exclusive = true;
          passthrough = false;
          gtk-layer-shell = true;
          height = 0;
          modules-left = ["clock" "custom/weather" "hyprland/workspaces"];
          modules-center = ["hyprland/window"];
          modules-right = [
            "tray"
          ];

          "hyprland/window" = {
            format = "👉 {}";
            seperate-outputs = true;
          };
          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            on-click = "activate";
            format = " {name} {icon} ";
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
            format-icons = {
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "5" = "";
              "6" = "";
              "7" = "";
            };
            persistent_workspaces = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
            };
          };
          "custom/weather" = {
            format = "{}°C";
            tooltip = true;
            interval = 3600;
            exec = "wttrbar --location Pockau-Lengefeld";
            return-type = "json";
          };
          tray = {
            icon-size = 13;
            spacing = 10;
          };
          clock = {
            format = " {:%R   %d/%m}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
        };
      };
    };
    home.packages = with pkgs; [
      grim
      hyprlock
      qt6.qtwayland
      slurp
      waypipe
      wf-recorder
      wf-mirror
      wl-clipboard
      wlogout
      wtype
      ydotool
    ];
  };
}