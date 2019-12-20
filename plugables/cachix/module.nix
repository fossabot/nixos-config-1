{ config, pkgs, lib, ... }:

{
  # Manually trust @wheel users
  nix.trustedUsers = [ "leo" ];

  environment.systemPackages = [
    pkgs.cachix
  ];
}
