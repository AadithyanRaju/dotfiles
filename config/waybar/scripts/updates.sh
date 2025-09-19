#!/usr/bin/env bash
updates=$(nix flake update --commit-lock-file --dry-run 2>&1 | grep "updated input" | wc -l)
[ "$updates" -gt 0 ] && echo "⬆️ $updates" || echo "✔️"
