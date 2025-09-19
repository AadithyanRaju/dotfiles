{ config, pkgs, ... }:

let
  updateDotfiles = pkgs.writeShellScriptBin "update-dotfiles" ''
    set -euo pipefail

    REPO_DIR="/home/aadithyan/.dotfiles"
    BRANCH="main"
    REMOTE="origin"

    cd "$REPO_DIR"

    git fetch --quiet "$REMOTE" "$BRANCH"

    LOCAL_COMMIT=$(git rev-parse HEAD)
    REMOTE_COMMIT=$(git rev-parse "$REMOTE/$BRANCH")

    if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
        echo "[+] Repo is behind, pulling updates..."
        git reset --hard "$REMOTE/$BRANCH"

        echo "[+] Verified repo matches GitHub, rebuilding system..."
        nixos-rebuild switch --flake "$REPO_DIR" --impure
    else
        echo "[-] Already up-to-date."
    fi
  '';
in
{
  # Make sure git is available
  environment.systemPackages = [ pkgs.git updateDotfiles ];

  # Systemd service
  systemd.services.update-dotfiles = {
    description = "Update dotfiles repo and rebuild NixOS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${updateDotfiles}/bin/update-dotfiles";
      User = "aadithyan";
    };
  };

  # Timer to run every hour
  systemd.timers.update-dotfiles = {
    description = "Run update-dotfiles every hour";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "10min";
      OnUnitActiveSec = "1h";
      Persistent = true;
    };
  };
}
