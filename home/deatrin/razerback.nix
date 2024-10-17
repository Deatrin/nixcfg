{ config, ... }: { 
    imports = [ 
      ./home.nix
      ../common
      ../features/cli
      ../features/desktop
    ];
    
    features = {
      cli = {
        zsh.enable = true;
        fzf.enable = true;
        neofetch.enable = true;
      };
      desktop = {
        wayland.enable = true;
        hyprland.enable = true;
      };
    };
  
    wayland.windowManager.hyprland = {
      settings = {
        device = [
          {
            name = "keyboard";
            kb_layout = "us";
          }
          {
            name = "mouse";
            sensitivity = -0.5;
          }
        ];
        monitor = [
          "DP-1,2560x1440@144,0x0,1"
          "DP-2,2560x1440@144,2560x0,1"
        ];
        workspace = [
          "1, monitor:DP-1, default:true"
          "2, monitor:DP-1"
          "3, monitor:DP-1"
          "4, monitor:DP-2"
          "5, monitor:DP-1"
          "6, monitor:DP-2"
          "7, monitor:DP-2"
        ];
      };
    };
  }
