{ config, pkgs, ... }:

let
  updateDotfiles = pkgs.writeShellScriptBin "update-dotfiles" ''
    set -euo pipefail

    GIT=/run/current-system/sw/bin/git
    NIXOS_REBUILD=/run/current-system/sw/bin/nixos-rebuild
    
    $GIT fetch --quiet "$REMOTE" "$BRANCH"
    LOCAL_COMMIT=$($GIT rev-parse HEAD)
    REMOTE_COMMIT=$($GIT rev-parse "$REMOTE/$BRANCH")
    
    if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
        echo "[+] Repo is behind, pulling updates..."
        $GIT reset --hard "$REMOTE/$BRANCH"
    
        echo "[+] Verified repo matches GitHub, rebuilding system..."
        $NIXOS_REBUILD switch --flake "$REPO_DIR" --impure
    else
        echo "[-] Already up-to-date."
    fi

  '';
in
{
  # Make sure git is available
  environment.systemPackages = [ updateDotfiles ];

  # Systemd service
  systemd.services.update-dotfiles = {
    description = "Update dotfiles repo and rebuild NixOS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${updateDotfiles}/bin/update-dotfiles";
      User = "aadithyan";
          Environment = "PATH=/run/current-system/sw/bin";
    };
  };

  # Timer to run every hour
  systemd.timers.update-dotfiles = {  
  };
}
