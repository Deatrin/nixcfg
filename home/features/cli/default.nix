{
  pkgs,
  ...
}: {
  imports = [
    ./fzf.nix
    ./neofetch.nix
    ./ohmyposh.nix
    ./tmux.nix
    ./zsh.nix
  ];
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = ["--cmd cd"];
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraOptions = [ "-l" "--icons" "--git" "-a" ];
  };

  programs.bat = {enable = true;};
  
  home.packages = with pkgs; [
    coreutils
    fd
    htop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip
  ];
}