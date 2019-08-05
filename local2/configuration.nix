# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
{
  imports = [ 
    # Import configuration
    ./users.nix
    ./system.nix
    ../hardware/thinkpad-t480s.nix
    # Activate remote builders
    ../plugables/builders/all.nix
    # Import qemu module
    ../sources/links/clever/qemu.nix
  ];

  nix.trustedUsers = [ "root" "@wheel" ];
  
  qemu-user.aarch64 = false;
  nix.distributedBuilds = true;
  
  nix.nixPath = [
    "nixpkgs=/etc/nixos/nixos-config/sources/links/nixos-unstable"
    "nixos-config=/etc/nixos/configuration.nix"
    "sources=/etc/nixos/nixos-config/sources/nix/sources.nix"
  ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}