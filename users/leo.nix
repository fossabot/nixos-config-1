# Edit this configuration file to define an users configurations
# on your systems. Help is available in the configuration.nix(5) 
# man page and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Define an user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.leo = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
  };
  # Global configuration linked to this account
  services.mpd.enable = true;
  services.mpd.startWhenNeeded = true;
  # Home manager configuration for this account
  home-manager.users.leo = {
    home.file."TEST".text = "foo";
    home.packages = [ pkgs.hello pkgs.nethack ];
    programs.git = {
      enable = true;
      userName  = "LeOtaku";
      userEmail = "leo.gaskin@brg-feldkirchen.at";
    }; 
  };
}
