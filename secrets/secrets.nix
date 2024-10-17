let
  razerback = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgfBnUK555uIgENo1X0P2hBb7vDQcqDtA3HSPxsf0Sa";
  deatrin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY06wy+S3ze6CsUzIPQmErBxT4V3FLfAIzANNDEogte jennexa@gmail.com";
in {
  "deatrin-secrets.age".publicKeys = [razerback deatrin];
}