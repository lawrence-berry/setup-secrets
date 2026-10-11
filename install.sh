#!/bin/sh
# Creates ~/.secrets/secrets.sh from the template (first run only) and sources
# it from your shell's rc file. Safe to re-run; never touches an existing
# secrets.sh.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
secrets="$HOME/.secrets/secrets.sh"

mkdir -p "$HOME/.secrets" && chmod 700 "$HOME/.secrets"
if [ ! -f "$secrets" ]; then
  cp "$dir/secrets.sh.template" "$secrets"
  echo "created $secrets (fill in your secrets)"
fi
chmod 600 "$secrets"

case "$SHELL" in *zsh) rc="$HOME/.zshrc" ;; *) rc="$HOME/.bashrc" ;; esac
line="[ -f \"$secrets\" ] && . \"$secrets\"  # setup-secrets"
touch "$rc"
grep -qxF "$line" "$rc" || printf '%s\n' "$line" >> "$rc"
echo "set up: $rc sources $secrets"
