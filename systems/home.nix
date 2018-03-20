# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{ 
  imports = [
    # Enable working Avahi
    ../plugables/avahi/default.nix
    # Add all known OpenVPN servers
    ../plugables/openvpn/serverlist.nix
    # Enable transmission service
    ../plugables/transmission/default.nix
  ];

  nix.nixPath = [
    "/etc/nixos/nixos-config"
    "nixpkgs=/etc/nixos/nixos-config/nixpkgs"
    "nixos=/etc/nixos/nixos-config/nixpkgs/nixos"
    "nixos-config=/etc/nixos/configuration.nix"
    #"nixpkgs-overlays=/etc/nixos/nixos-config/pkgs"
  ];

  nixpkgs.overlays = [ (import ../pkgs) ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.memtest86.enable = true;

  # Override default nixos stuff
  boot.loader.grub.splashImage = null;
  boot.loader.grub.gfxmodeBios = "1366x768";
  boot.loader.timeout = -1;
  boot.plymouth.enable = true;

  # less verbose boot log
  boot.consoleLogLevel = 3;
  boot.kernelParams = [ "quiet" "udev.log_priority=3" ];
  #boot.earlyVconsoleSetup = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  #services.dhcpd4.enable = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "de";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Vienna";
  
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    mullvad-gtk
    ## Nixos
    nixUnstable
    nix-repl
    nox
    nix-index
    python2nix 
    nodePackages.node2nix
    ## Terminal Apps
    vim_configurable
    scim
    vifm
    neomutt
    ranger
    rtv
    taskwarrior
    htop
    atop
    gtop
    python36Packages.glances
    bmon
    vnstat
    figlet
    toilet
    fortune
    cowsay
    lolcat
    cmatrix
    pipes
    pulsemixer
    cava
    cli-visualizer
    ncmpcpp
    weechat
    canto-curses
    pamix
    ranger
    neofetch
    libqalculate
    ## Graphical Apps
    # Terminals
    xterm
    rxvt_unicode
    urxvt_perls 
    alacritty
    termite
    kitty
    #st
    #mlterm
    # Development
    vscode-with-extensions
    #jetbrains.pycharm-community
    #python36Packages.notebook
    #currently only works when loaded with python env
    # Other
    firefox
    vivaldi
    thunderbird
    steam
    feh
    sxiv
    surf
    zathura
    evince
    gnome3.gucharmap
    font-manager
    fontmatrix
    vlc
    mplayer
    gnome-mpv
    mpv
    xfce.thunar
    gnome3.nautilus
    dolphin
    discord
    projectm
    wireshark-gtk
    ## Utilities
    tree
    stow
    wmname
    tpacpi-bat
    xorg.xbacklight
    xorg.xev
    xdo
    xdotool
    xvkbd
    wget
    git
    scrot
	maim
    xclip
    dmenu
    #interrobang
    ncdu
    w3m
    elinks
    lynx
    bashmount
    psmisc
    efibootmgr
    tmux
    lxappearance-gtk3
    youtube-dl
    libnotify
    pandoc
    ffmpegthumbnailer
    p7zip
    exiftool
    poppler_utils
    mediainfo
    atool
    libarchive
    ffmpeg-full
    imagemagick
    transmission-remote-gtk
    transmission-remote-cli
    highlight
    unoconv
    discount
    autoconf
    automake
    xorg.xinit
    xorg.xauth
    acpi
    dash
    slop
    gcolor2
    python36Packages.pygments
    id3v2
    inotifyTools
    ## Other
    windowchef
    herbstluftwm
    wmutils-core
    wmutils-opt
    #howm
    #cottage
    sxhkd
    compton-git
    #athame-zsh
    zsh
    oh-my-zsh
    zsh-completions
    polybar
    dzen2
    mpd
    mpc_cli
    dunst
    # Vim
    instant-markdown-d
    ## Languages
    #R
    #pythonForR
    # Python
    #python3Full
    #python36Packages.pip
    #python36Packages.virtualenv
    #python36Packages.pylint
  ];

  fonts.fonts = with pkgs; [
    siji
    font-awesome-ttf
    google-fonts
    lmmath
    #nerdfonts
    gohufont
    terminus_font
    tewi-font
    dina-font
    fira-code
    fira-mono
  ];
  
  environment.variables = {
    OH_MY_ZSH = [ "${pkgs.oh-my-zsh}/share/oh-my-zsh" ];
    EDITOR = [ "vim" ];
    TERMINAL = [ "urxvt" ];
    RANGER_LOAD_DEFAULT_RC = [ "FALSE" ];
  };

  # Some programs need SUID wrappeas, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:
  
  # Test Test
  #programs.ibus.enable = true;

  # Enable upower
  services.upower.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [ hplip gutenprint gutenprintBin splix ];

  # Enable the X11 windowing system.
  services.xserver.enable = true; 
 
  # Enable the DE/WM + DM 
  services.xserver.displayManager.lightdm = { 
    enable = true;
    #background = "${pkgs.nixos-artwork.wallpapers.stripes-logo}/share/artwork/gnome/nix-wallpaper-stripes-logo.png";
    background = "${pkgs.adapta-backgrounds}/share/backgrounds/adapta/tealized.jpg";
    greeters.gtk = {
      theme.package = pkgs.adapta-gtk-theme;
      theme.name = "Adapta-Eta";
      iconTheme.package = pkgs.paper-icon-theme;
      iconTheme.name = "Paper";
    };
  };

  # Enable PulseAudio
  hardware.pulseaudio.enable = true;
  # For Steam
  hardware.pulseaudio.support32Bit = true;
  hardware.opengl.driSupport32Bit = true;
  
  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable clipboard manager
  services.gnome3.gpaste.enable = false;

  # Enable Virtualbox
  virtualisation.virtualbox.host = { 
    enable = true;
    #enableHardening = false; 
  };

  nixpkgs.config.virtualbox.enableExtensionPack = true;

  # Enable Deluge torrent server
  services.deluge.enable = false;

  # Add wireshark permissions
  programs.wireshark.enable = true;

}
