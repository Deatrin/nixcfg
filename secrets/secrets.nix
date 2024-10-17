let
  razerback = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHZ0Yq6UR0Qtt7YYA2t8FR2pQCIJ8jN76lH2RNWctO7J";
  deatrin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY06wy+S3ze6CsUzIPQmErBxT4V3FLfAIzANNDEogte jennexa@gmail.com";
in {
  "secret1.age".publicKeys = [ razerback ];
  "deatrin-secrets.age".publicKeys = [razerback deatrin];
}