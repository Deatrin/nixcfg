{...}: {
  enable = true;
  enableZshIntegration = true;
  settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile ./ohmyposh/amro.toml));
}
