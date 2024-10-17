{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.extraServices.libvirtd;
in {
  options.extraServices.libvirtd.enable = mkEnableOption "enable libvirtd";

  config = mkIf cfg.enable {
    virtualisation = {
      libvirtd = {
        enable = true;
      };
    };
    programs.virt-manager.enable = true;
  };
}