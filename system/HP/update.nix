{ config, pkgs, lib, ... }:

let
  updateDotfiles = pkgs.writeShellScriptBin "update-dotfiles" ''
    set -euo pipefail

    # Safe defaults (if env vars unset or empty)
    REPO_DIR="${REPO_DIR:-/home/aadithyan/.dotfiles}"
    BRANCH="${BRANCH:-main}"
    REMOTE="${REMOTE:-origin}"

    # Use absolute paths to avoid PATH issues in systemd
    GIT=/run/current-system/sw/bin/git
    NIXOS_REBUILD=/run/current-system/sw/bin/nixos-rebuild

    cd "$REPO_DIR"

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
  environment.systemPackages = [ updateDotfiles ];

  systemd.services.update-dotfiles = {
    description = "Update dotfiles repo and rebuild NixOS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${updateDotfiles}/bin/update-dotfiles";
      User = "aadithyan";
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };

  systemd.timers.update-dotfiles = {
    description = "Hourly dotfiles update";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };
}
