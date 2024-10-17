let
  razerback = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHZ0Yq6UR0Qtt7YYA2t8FR2pQCIJ8jN76lH2RNWctO7J";
in {
  "secret1.age".publicKeys = [ razerback ];
}