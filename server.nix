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
  zramSwap.enable = true;
  boot.tmp.useTmpfs = true;
  nix = {
    optimise.automatic = true;
    gc.automatic = true;
  };

  # Enable typical server programs
  programs = {
    tmux.enable = true;
    htop.enable = true;
    vim.defaultEditor = true;
  };
}
