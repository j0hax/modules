{ config, lib, ... }: {
  # Enable OpenSSH, but only allow public key auth
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    startWhenNeeded = true;
    banner = lib.readFile ./banner.txt;
  };

  services.fail2ban = {
    enable = true;
    bantime-increment.enable = true;
  };

  # Allow automatic updates
  system.autoUpgrade.enable = true;

  # Save VPS space
  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };

  # Enable typical server programs
  programs = {
    iftop.enable = true;
    tmux.enable = true;
    htop.enable = true;
    vim.defaultEditor = true;
  };

  services.tuptime.enable = true;
}
