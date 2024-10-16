{
  config,
  lib,
  ...
}: 
with lib; let
  cfg = config.features.cli.fzf;
in {
  options.features.cli.fzf.enable = mkEnableOption "enable fuzzy finder";

  config = mkIf cfg.enable {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
  };
}