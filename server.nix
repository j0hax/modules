{ config, ... }: {
  # Enable OpenSSH, but only allow public key auth
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  # Allow automatic updates
  system.autoUpgrade.enable = true;

  # Save VPS space
  nix = {
    optimise.automatic = true;
    gc.automatic = true;
  };
}
