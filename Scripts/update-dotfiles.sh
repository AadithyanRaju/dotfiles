#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/home/aadithyan/.dotfiles"
BRANCH="main"
REMOTE="origin"

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
