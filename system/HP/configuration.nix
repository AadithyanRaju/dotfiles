{ config, pkgs, userSettings,... }:

{
  imports =
    [ 
      ../base.nix
      ../features.nix
      ../services/noPowerOffOnLidClose.nix

      ../applications/containers
      ../applications/development/editors.nix

      ../services/reconnect.nix
      ../services/update.nix

      ../security/ssh.nix

      ./hardware-configuration.nix
    ];

  services = {
    xserver.videoDrivers = [
      "amdgpu"
    ];
   };
  
  
  security.sudo.extraRules = [
    {
      users = [ userSettings.username ];
      commands = [
        { command = "${pkgs.nixos-rebuild}/bin/nixos-rebuild"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];

  features.apps.editors = {
    vscode.enable = true;
    zed.enable = false;
    intellijUltimate.enable = false;
  };
  # Configure keymap in X11
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  
}

