{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  ##################################################
  ## System
  ##################################################

  system.stateVersion = "26.05";

  networking.hostName = "ryuzakipi";

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

  ##################################################
  ## Boot Config
  ##################################################

  hardware.raspberry-pi."5".apply-overlays = true;

  boot.loader.raspberryPi = {
      enable = true;
      version = 5;
  }

  ##################################################
  ## Networking
  ##################################################

  networking.networkmanager.enable = true;

  ##################################################
  ## User
  ##################################################

  users.users.ryuzaki = {
    isNormalUser = true;

    initialPassword = "39207395";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  ##################################################
  ## SSH
  ##################################################

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  ##################################################
  ## Tailscale
  ##################################################

  services.tailscale.enable = true;

  ##################################################
  ## Packages
  ##################################################

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    htop
    tailscale
  ];

  ##################################################
  ## Sudo
  ##################################################

  security.sudo.enable = true;
}
